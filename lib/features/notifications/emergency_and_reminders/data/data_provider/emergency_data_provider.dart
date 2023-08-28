import 'package:dartz/dartz.dart';

import '../../../../../core/form_models/general_field.dart';

abstract class EmergencyDataProvider {
  Future<Unit> updateEmergencyCallNo({
    required GeneralField emergencyCallNo,
  });

  Future<Unit> updateDoctorCallNo({
    required GeneralField doctorCallNo,
  });

  Future<Unit> updateAmbulanceCallNo({
    required GeneralField ambulanceCallNo,
  });

  Future<String> getEmergencyCallNo();
  Future<String> getDoctorCallNo();
  Future<String> getAmbulanceCallNo();
}
