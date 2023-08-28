import 'package:flutter/material.dart';
import 'package:seniorcompanion/features/block_screen/presentation/block_screen_view.dart';

class BlockScreenPage extends StatelessWidget {
  BlockScreenPage({
    super.key,
    required this.pmtBlocked,
    required this.tmpBlocked,
  });
  bool tmpBlocked = false;
  bool pmtBlocked = false;

  static Page page({required bool tmpBlocked, required bool pmtBlocked}) =>
      MaterialPage<void>(
          child: BlockScreenPage(
        pmtBlocked: pmtBlocked,
        tmpBlocked: tmpBlocked,
      ));

  @override
  Widget build(BuildContext context) {
    return BlockScreenView(
      tmpBlocked: tmpBlocked,
      pmtBlocked: pmtBlocked,
    );
  }
}
