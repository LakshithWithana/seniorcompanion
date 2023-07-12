import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:seniorcompanion/features/search/data/repository/search_repository.dart';

import '../../../core/models/user_details_model/user_details_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepository _searchRepository;
  SearchCubit({
    required SearchRepository searchRepository,
  })  : _searchRepository = searchRepository,
        super(const SearchState());

  void genderChanged(String gender) {
    emit(state.copyWith(
      gender: gender,
      status: FormzSubmissionStatus.initial,
    ));
  }

  void startAgeChanged(double age) {
    emit(state.copyWith(
      startAge: age.round(),
      status: FormzSubmissionStatus.initial,
    ));
  }

  void endAgeChanged(double age) {
    emit(state.copyWith(
      endAge: age.round(),
      status: FormzSubmissionStatus.initial,
    ));
  }

  void distanceChanged(double distance) {
    emit(state.copyWith(
      distance: distance.round(),
      status: FormzSubmissionStatus.initial,
    ));
  }

  Future<void> searchUser(String role) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    try {
      var result = await _searchRepository.searchUsers(
        gender: state.gender,
        startAge: state.startAge,
        endAge: state.endAge,
        distance: state.distance.toDouble(),
        startTime: state.startTime,
        endTime: state.endTime,
        role: role,
      );
      result.fold((l) {
        if (!isClosed) {
          emit(state.copyWith(
              status: FormzSubmissionStatus.failure, errorMessage: l));
        }
      }, (r) {
        if (!isClosed) {
          r.listen((value) {
            // print('Value from controller: ${value.first.email}');

            emit(state.copyWith(
                status: FormzSubmissionStatus.success, searchResult: value));
          });
        }
      });
    } catch (e) {
      if (!isClosed) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
