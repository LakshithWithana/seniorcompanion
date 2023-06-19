import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    required this.fontSize,
    this.color,
    this.fontWeight,
    this.letterSpacing,
    this.textAlignment,
    this.textEllipsis,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final TextAlign? textAlignment;
  final FontWeight? fontWeight;
  final Color? color;
  final double? letterSpacing;
  final bool? textEllipsis;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlignment,
      style: TextStyle(
        overflow: textEllipsis == true ? TextOverflow.ellipsis : null,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? mainFontColor,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
