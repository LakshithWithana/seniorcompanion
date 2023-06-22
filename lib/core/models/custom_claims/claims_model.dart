// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../converters/date_stamp_converter.dart';
import '../../custom_types/date_stamp.dart';

part 'claims_model.freezed.dart';
part 'claims_model.g.dart';

@freezed

///This user model will contain  information about the [`current user`]

class ClaimsModel with _$ClaimsModel {
  const factory ClaimsModel({
    ///user ID of the user
    @JsonKey(name: 'user_id') required String userId,

    ///The role of the user
    @JsonKey(name: 'role') String? role,

    ///Full name of the user
    @JsonKey(name: 'email') String? email,

    ///Profile updated or not
    @JsonKey(name: 'profileUpdated') bool? profileUpdated,
    @DateStampConverterForNull()
    @JsonKey(name: '_lastCommitted')
    DateStamp? lastCommitted,
  }) = _ClaimsModel;
  const ClaimsModel._();

  static const empty = ClaimsModel(
    role: "",
    email: "",
    userId: "",
  );

  factory ClaimsModel.fromJson(Map<String, dynamic> json) =>
      _$ClaimsModelFromJson(json);

  /// Convenience getter to determine whether the current claim model is empty.
  bool get isEmpty => this == ClaimsModel.empty;

  /// Convenience getter to determine whether the current claim model is not empty.
  bool get isNotEmpty => this != ClaimsModel.empty;
}
