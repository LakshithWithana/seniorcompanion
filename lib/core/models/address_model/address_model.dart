// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
class AddressModel with _$AddressModel {
  const factory AddressModel({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'latitude') required double latitude,
    @JsonKey(name: 'longitude') required double longitude,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  const AddressModel._();
  static const empty = AddressModel(
    name: "",
    latitude: 0,
    longitude: 0,
  );

  /// Convenience getter to determine whether the AddressModel is empty.
  bool get isEmpty => this == AddressModel.empty;

  /// Convenience getter to determine whether the AddressModel is not empty.
  bool get isNotEmpty => this != AddressModel.empty;
}
