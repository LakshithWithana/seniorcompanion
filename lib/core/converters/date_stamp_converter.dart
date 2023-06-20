import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../custom_types/date_stamp.dart';

/// -`fromJson` converts TimeStamp to Dart DateTime
/// - `toJson` Sets the server transacting timestamp for the field
class DateStampConverter implements JsonConverter<DateStamp, dynamic> {
  const DateStampConverter();

  @override
  DateStamp fromJson(dynamic json) {
    if (json is Timestamp) {
      return DateStamp(date: json.toDate());
    }
    return DateStamp.empty;
  }

  @override
  dynamic toJson(DateStamp object) {
    return FieldValue.serverTimestamp();
  }
}

class DateStampConverterForNull implements JsonConverter<DateStamp?, dynamic> {
  const DateStampConverterForNull();

  @override
  DateStamp fromJson(dynamic json) {
    if (json is Timestamp) {
      return DateStamp(date: json.toDate());
    }
    return DateStamp.empty; //todo update this
  }

  @override
  dynamic toJson(DateStamp? object) {
    return FieldValue.serverTimestamp();
  }
}
