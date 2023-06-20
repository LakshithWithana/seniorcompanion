import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/models/custom_claims/claims_model.dart';
import '../../core/models/sc_user/sc_user_model.dart';
import '../data/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../data/repository/custom_claims/custom_claims_repository.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.freezed.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthRepository _authRepository;
  late final StreamSubscription<SCUser> _userSubscription;
  // late final StreamSubscription<UserDetails> _userDetailsSubscription;
  final CustomClaimsRepository customClaimsRepository;
  late final StreamSubscription<firebase_auth.User?> _firebaseUserSubscription;
  StreamSubscription<ClaimsModel>? _claimsSubscription;

  AppBloc(
      {required AuthRepository authRepository,
      required this.customClaimsRepository})
      : _authRepository = authRepository,
        super(authRepository.currentUser.isEmpty
            ? const AppState.unAuthenticated()
            : (authRepository.currentUser.isNotEmpty &&
                    authRepository.currentUser.role == "CR")
                ? AppState.careRecipient(authRepository.currentUser)
                : AppState.careGiver(authRepository.currentUser)) {
    on<_AuthStatusChanged>(_onAuthStatusChanged);

    _userSubscription =
        _authRepository.scUser.listen((user) => add(AppEvent.authStatusChanged(
              user: user,
            )));

    // _userDetailsSubscription =
    //     _authRepository.currentUserDetails.listen((user) {});

    _firebaseUserSubscription =
        _authRepository.firebaseUser.listen((firebaseUser) async {
      if (firebaseUser != null) {
        _claimsSubscription?.cancel(); //todo check if this is correct
        _claimsSubscription =
            customClaimsRepository.customClaimsModel.listen((claimModel) async {
          if (claimModel.isNotEmpty) {
            if (claimModel.lastCommitted != null) {
              if (!customClaimsRepository.lastCommittedDate.isEmpty &&
                  customClaimsRepository.lastCommittedDate.date
                          .compareTo(claimModel.lastCommitted!.date) !=
                      0) {
                //refresh token here
                await refreshIdTokenOfTheUser();
              }
              customClaimsRepository
                  .setLastCommitedDate(claimModel.lastCommitted!);
            }
          }
        });
      } else {
        if (_claimsSubscription != null) {
          _claimsSubscription!.cancel();
          _claimsSubscription = null;
        }
      }
    });
  }

  FutureOr<void> _onAuthStatusChanged(
      _AuthStatusChanged event, Emitter<AppState> emit) async {
    if (event.user!.isNotEmpty && event.user!.role == "CR") {
      emit(AppState.careRecipient(event.user!));
    } else if (event.user!.isNotEmpty && event.user!.role == "CG") {
      emit(AppState.careGiver(event.user!));
    } else {
      emit(const AppState.unAuthenticated());
    }
  }

  FutureOr<void> _onLogoutRequested(
      _LogoutRequested event, Emitter<AppState> emit) {
    unawaited(_authRepository.signOutUser());
    unawaited(_authRepository.clearValue());
    //TODO learn more about this unawaited keyword
  }

  Future<void> refreshIdTokenOfTheUser() async {
    final result = await _authRepository.refreshIdTokenOfTheUser();
    print("referesh token called");

    result.fold((l) {
      print(l);
    }, (r) {
      print("success");
    });
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    // _consumerUsefulDataStream.cancel();
    return super.close();
  }
}
