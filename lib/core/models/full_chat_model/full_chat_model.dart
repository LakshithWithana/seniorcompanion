// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:newseniiorcompaniion/core/models/chat_model/chat_model.dart';

part 'full_chat_model.freezed.dart';
part 'full_chat_model.g.dart';

@freezed
class FullChatModel with _$FullChatModel {
  factory FullChatModel({
    @JsonKey(name: 'myUid') required Map<String, List<ChatModel>> myUid,
    @JsonKey(name: 'partnerUid')
    required Map<String, List<ChatModel>> partnerUid,
    @JsonKey(name: 'chatID') required String chatID,
  }) = _FullChatModel;

  factory FullChatModel.fromJson(Map<String, dynamic> json) =>
      _$FullChatModelFromJson(json);

  FullChatModel._();
  static var empty = FullChatModel(
    myUid: {},
    partnerUid: {},
    chatID: "",
  );

  /// Convenience getter to determine whether the FullChatModel is empty.
  bool get isEmpty => this == FullChatModel.empty;

  /// Convenience getter to determine whether the FullChatModel is not empty.
  bool get isNotEmpty => this != FullChatModel.empty;
}
