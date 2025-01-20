import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newseniiorcompaniion/features/notifications/emergency_and_reminders/data/repository/emergency_repositoy.dart';

import '../../../../core/form_models/general_field.dart';

part 'emergency_state.dart';

class EmergencyCubit extends Cubit<EmergencyState> {
  final EmergencyRepository _emergencyRepository;
  EmergencyCubit({required EmergencyRepository emergencyRepository})
      : _emergencyRepository = emergencyRepository,
        super(const EmergencyState());

  void emergencyCallNoChanged(String value) {
    final emergencyNo = GeneralField.dirty(value);
    emit(state.copyWith(
      emergencyCallNo: emergencyNo,
    ));
  }

  Future<void> updateEmergencyCallNo() async {
    try {
      var result = await _emergencyRepository.updateEmergencyCallNo(
          emergencyCallNo: state.emergencyCallNo);

      result.fold((l) {
        if (!isClosed) {
          emit(
            state.copyWith(emergencyCallUpdated: false),
          );
        }
      }, (r) {
        if (!isClosed) {
          emit(state.copyWith(emergencyCallUpdated: true));
        }
      });
    } catch (e) {
      if (!isClosed) {
        emit(state.copyWith(emergencyCallUpdated: false));
      }
    }
  }

  void doctorCallNoChanged(String value) {
    final doctorNo = GeneralField.dirty(value);
    emit(state.copyWith(
      doctorCallNo: doctorNo,
    ));
  }

  Future<void> updateDoctorCallNo() async {
    try {
      var result = await _emergencyRepository.updateDoctorCallNo(
          doctorCallNo: state.doctorCallNo);

      result.fold((l) {
        if (!isClosed) {
          emit(
            state.copyWith(doctorCallUpdated: false),
          );
        }
      }, (r) {
        if (!isClosed) {
          emit(state.copyWith(doctorCallUpdated: true));
        }
      });
    } catch (e) {
      if (!isClosed) {
        emit(state.copyWith(doctorCallUpdated: false));
      }
    }
  }

  void ambulanceCallNoChanged(String value) {
    final ambulanceNo = GeneralField.dirty(value);
    emit(state.copyWith(
      ambulanceCallNo: ambulanceNo,
    ));
  }

  Future<void> updateAmbulanceCallNo() async {
    try {
      var result = await _emergencyRepository.updateAmbulanceCallNo(
          ambulanceCallNo: state.ambulanceCallNo);

      result.fold((l) {
        if (!isClosed) {
          emit(
            state.copyWith(ambulanceCallUpdated: false),
          );
        }
      }, (r) {
        if (!isClosed) {
          emit(state.copyWith(ambulanceCallUpdated: true));
        }
      });
    } catch (e) {
      if (!isClosed) {
        emit(state.copyWith(ambulanceCallUpdated: false));
      }
    }
  }

  Future<void> getAmbulanceCallNo() async {
    try {
      var result = await _emergencyRepository.getAmbulanceCallNo();

      result.fold((l) {
        if (!isClosed) {}
      }, (r) {
        if (!isClosed) {
          emit(state.copyWith(retrievedAmbulanceNo: r));
        }
      });
    } catch (e) {}
  }

  Future<void> getDoctorCallNo() async {
    try {
      var result = await _emergencyRepository.getDoctorCallNo();

      result.fold((l) {
        if (!isClosed) {}
      }, (r) {
        if (!isClosed) {
          emit(state.copyWith(retrievedDoctorNo: r));
        }
      });
    } catch (e) {}
  }

  Future<void> getEmergencyCallNo() async {
    try {
      var result = await _emergencyRepository.getEmergencyCallNo();

      result.fold((l) {
        if (!isClosed) {}
      }, (r) {
        if (!isClosed) {
          emit(state.copyWith(retrievedEmergencyNo: r));
        }
      });
    } catch (e) {}
  }
}
