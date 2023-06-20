import 'package:flutter/foundation.dart';

@immutable
class DateStamp {
  const DateStamp({
    required this.date,
  });
  final DateTime date;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DateStamp && other.date == date;
  }

  @override
  int get hashCode => date.hashCode;
  static final empty = DateStamp(date: DateTime.now());

  bool get isEmpty => this == empty;
}
