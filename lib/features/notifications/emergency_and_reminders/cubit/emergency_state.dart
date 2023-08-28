part of 'emergency_cubit.dart';

class EmergencyState extends Equatable {
  const EmergencyState({
    this.emergencyCallNo = const GeneralField.pure(),
    this.emergencyCallUpdated = false,
    this.doctorCallNo = const GeneralField.pure(),
    this.doctorCallUpdated = false,
    this.ambulanceCallNo = const GeneralField.pure(),
    this.ambulanceCallUpdated = false,
    this.retrievedAmbulanceNo = "",
    this.retrievedDoctorNo = "",
    this.retrievedEmergencyNo = "",
  });

  final GeneralField emergencyCallNo;
  final bool emergencyCallUpdated;
  final GeneralField doctorCallNo;
  final bool doctorCallUpdated;
  final GeneralField ambulanceCallNo;
  final bool ambulanceCallUpdated;

  final String retrievedAmbulanceNo;
  final String retrievedDoctorNo;
  final String retrievedEmergencyNo;

  @override
  List<Object?> get props => [
        emergencyCallNo,
        emergencyCallUpdated,
        doctorCallNo,
        doctorCallUpdated,
        ambulanceCallNo,
        ambulanceCallUpdated,
        retrievedAmbulanceNo,
        retrievedDoctorNo,
        retrievedEmergencyNo,
      ];

  EmergencyState copyWith({
    GeneralField? emergencyCallNo,
    bool? emergencyCallUpdated,
    GeneralField? doctorCallNo,
    bool? doctorCallUpdated,
    GeneralField? ambulanceCallNo,
    bool? ambulanceCallUpdated,
    String? retrievedAmbulanceNo,
    String? retrievedDoctorNo,
    String? retrievedEmergencyNo,
  }) {
    return EmergencyState(
      emergencyCallNo: emergencyCallNo ?? this.emergencyCallNo,
      emergencyCallUpdated: emergencyCallUpdated ?? this.emergencyCallUpdated,
      doctorCallNo: doctorCallNo ?? this.doctorCallNo,
      doctorCallUpdated: doctorCallUpdated ?? this.doctorCallUpdated,
      ambulanceCallNo: ambulanceCallNo ?? this.ambulanceCallNo,
      ambulanceCallUpdated: ambulanceCallUpdated ?? this.ambulanceCallUpdated,
      retrievedAmbulanceNo: retrievedAmbulanceNo ?? this.retrievedAmbulanceNo,
      retrievedDoctorNo: retrievedDoctorNo ?? this.retrievedDoctorNo,
      retrievedEmergencyNo: retrievedEmergencyNo ?? this.retrievedEmergencyNo,
    );
  }
}
