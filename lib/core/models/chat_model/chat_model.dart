// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
class ChatModel with _$ChatModel {
  const factory ChatModel({
    @JsonKey(name: 'message') required String message,
    @JsonKey(name: 'sentBy') required String sentBy,
    @JsonKey(name: 'timestamp') required int timestamp,
  }) = _ChatModel;

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);

  const ChatModel._();
  static var empty = const ChatModel(
    message: "",
    sentBy: "",
    timestamp: 0,
  );

  /// Convenience getter to determine whether the ChatModel is empty.
  bool get isEmpty => this == ChatModel.empty;

  /// Convenience getter to determine whether the ChatModel is not empty.
  bool get isNotEmpty => this != ChatModel.empty;
}
