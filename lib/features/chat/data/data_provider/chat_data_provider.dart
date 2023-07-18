import 'package:dartz/dartz.dart';

abstract class ChatDataProvider {
  Future<Unit> createChat({
    required String myUid,
    required String partnerUid,
  });
}
