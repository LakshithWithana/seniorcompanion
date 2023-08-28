import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:seniorcompanion/app/data/repository/blocked_account/blocked_account_repository.dart';
import 'package:seniorcompanion/core/models/user_details_model/user_details_model.dart';

part 'blocked_status_state.dart';

class BlockedStatusCubit extends Cubit<BlockedStatusState> {
  final BlockedAccountRepository _blockedAccountRepository;
  BlockedStatusCubit(
      {required BlockedAccountRepository blockedAccountRepository})
      : _blockedAccountRepository = blockedAccountRepository,
        super(const BlockedStatusState());

  Future<void> getBlockedAccountStatus() async {
    try {
      var result = await _blockedAccountRepository.getBlockedAccountStatus();

      result.fold((l) {
        if (!isClosed) {
          emit(state.copyWith());
        }
      }, (r) {
        if (!isClosed) {
          emit(state.copyWith(userDetails: r));
        }
      });
    } catch (e) {
      if (!isClosed) {
        emit(state.copyWith());
      }
    }
  }
}
