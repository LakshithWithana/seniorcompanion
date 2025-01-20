import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:newseniiorcompaniion/app/data/repository/auth_repository.dart';
import 'package:newseniiorcompaniion/core/models/sc_user/sc_user_model.dart';
import 'package:newseniiorcompaniion/core/models/user_details_model/user_details_model.dart';
import 'package:newseniiorcompaniion/core/user_details/data/repository/user_details_repository.dart';

part 'user_details_state.dart';
part 'user_details_cubit.freezed.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  final UserDetailsRepository _userDetailsRepository;
  final AuthRepository _authRepository;
  StreamSubscription<UserDetails>? _userDetailsStreamSubscription;
  StreamSubscription<SCUser>? _currentUserStreamSubscription;
  UserDetailsCubit({
    required UserDetailsRepository userDetailsRepository,
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        _userDetailsRepository = userDetailsRepository,
        super(const UserDetailsState.initial()) {
    emit(const UserDetailsState.loading());

    _currentUserStreamSubscription =
        _authRepository.scUser.listen((currentUser) {
      if (currentUser.isNotEmpty) {
        _userDetailsStreamSubscription?.cancel();

        _userDetailsStreamSubscription =
            _userDetailsRepository.listenToUserDetails().listen((dataModel) {
          emit(UserDetailsState.loaded(dataModel));
        });
      } else {
        _userDetailsStreamSubscription?.cancel();
      }
    });
  }

  @override
  Future<void> close() {
    _userDetailsStreamSubscription?.cancel();
    _currentUserStreamSubscription?.cancel();
    return super.close();
  }
}
