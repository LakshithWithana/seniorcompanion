import 'package:dartz/dartz.dart';

import '../../../../../core/form_models/general_field.dart';

abstract class EmergencyRepository {
  Future<Either<String, Unit>> updateEmergencyCallNo({
    required GeneralField emergencyCallNo,
  });

  Future<Either<String, Unit>> updateDoctorCallNo({
    required GeneralField doctorCallNo,
  });

  Future<Either<String, Unit>> updateAmbulanceCallNo({
    required GeneralField ambulanceCallNo,
  });

  Future<Either<String, String>> getAmbulanceCallNo();
  Future<Either<String, String>> getDoctorCallNo();
  Future<Either<String, String>> getEmergencyCallNo();
}
