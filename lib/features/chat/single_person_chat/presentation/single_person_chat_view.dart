import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared/widgets/custom_text.dart';

class SinglePersonChatView extends StatelessWidget {
  const SinglePersonChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Theme.of(context).shadowColor,
        centerTitle: false,
        title: CustomText(
          text: "chat".tr().toUpperCase(),
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
