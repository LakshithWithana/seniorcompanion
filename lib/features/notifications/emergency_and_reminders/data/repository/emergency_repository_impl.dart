import 'package:dartz/dartz.dart';
import 'package:newseniiorcompaniion/core/form_models/general_field.dart';
import 'package:newseniiorcompaniion/features/notifications/emergency_and_reminders/data/data_provider/emergency_data_provider.dart';
import 'package:newseniiorcompaniion/features/notifications/emergency_and_reminders/data/failures/emergency_no_update_failure.dart';
import 'package:newseniiorcompaniion/features/notifications/emergency_and_reminders/data/repository/emergency_repositoy.dart';

class EmergencyRepositoryImpl implements EmergencyRepository {
  final EmergencyDataProvider _emergencyDataProvider;

  EmergencyRepositoryImpl(
      {required EmergencyDataProvider emergencyDataProvider})
      : _emergencyDataProvider = emergencyDataProvider;

  @override
  Future<Either<String, Unit>> updateEmergencyCallNo(
      {required GeneralField emergencyCallNo}) async {
    try {
      await _emergencyDataProvider.updateEmergencyCallNo(
          emergencyCallNo: emergencyCallNo);

      return right(unit);
    } on EmergencyNoUpdateFailure catch (e) {
      return left(e.message);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> updateDoctorCallNo(
      {required GeneralField doctorCallNo}) async {
    try {
      await _emergencyDataProvider.updateDoctorCallNo(
          doctorCallNo: doctorCallNo);

      return right(unit);
    } on EmergencyNoUpdateFailure catch (e) {
      return left(e.message);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> updateAmbulanceCallNo(
      {required GeneralField ambulanceCallNo}) async {
    try {
      await _emergencyDataProvider.updateAmbulanceCallNo(
          ambulanceCallNo: ambulanceCallNo);

      return right(unit);
    } on EmergencyNoUpdateFailure catch (e) {
      return left(e.message);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> getAmbulanceCallNo() async {
    try {
      final result = await _emergencyDataProvider.getAmbulanceCallNo();

      return right(result);
    } on EmergencyNoUpdateFailure catch (e) {
      return left(e.message);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> getDoctorCallNo() async {
    try {
      final result = await _emergencyDataProvider.getDoctorCallNo();

      return right(result);
    } on EmergencyNoUpdateFailure catch (e) {
      return left(e.message);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> getEmergencyCallNo() async {
    try {
      final result = await _emergencyDataProvider.getEmergencyCallNo();

      return right(result);
    } on EmergencyNoUpdateFailure catch (e) {
      return left(e.message);
    } catch (e) {
      return left(e.toString());
    }
  }
}
