import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';

/// Custom custom elevated button
class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    this.isHalf,
    this.isNegative,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.labelColor,
    this.isLoading,
    this.height,
    this.borderRadius,
    this.prefix,
  }) : super(key: key);

  final bool? isHalf;
  final bool? isNegative;
  final String? label;
  final onPressed;
  final Color? backgroundColor;
  final Color? labelColor;
  final bool? isLoading;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final Widget? prefix;

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isNegative == null || isNegative == false ? backgroundColor : white,
        shape: RoundedRectangleBorder(
          side: isNegative == null || isNegative == false
              ? const BorderSide(color: Colors.transparent, width: 0)
              : BorderSide(color: backgroundColor!, width: 2.0),
          borderRadius: borderRadius != null
              ? borderRadius!
              : const BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      child: SizedBox(
        width: isHalf == null || isHalf == false ? screensize.width : 170.0.w,
        height: height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Center(
            child: isLoading == null || isLoading == false
                ? prefix != null
                    ? Row(
                        children: [
                          prefix!,
                          const SizedBox(width: 5.0),
                          Text(
                            label!.toUpperCase(),
                            style: TextStyle(
                              fontSize: 16.0.sp,
                              fontWeight: FontWeight.bold,
                              color: isNegative != null || isNegative == true
                                  ? labelColor
                                  : white,
                            ),
                          ),
                        ],
                      )
                    : Text(
                        label!.toUpperCase(),
                        style: TextStyle(
                          fontSize: 20.0.sp,
                          fontWeight: FontWeight.bold,
                          color: isNegative != null || isNegative == true
                              ? labelColor
                              : white,
                        ),
                      )
                : const Padding(
                    padding: EdgeInsets.all(0.0),
                    child: SizedBox(
                      height: 22.0,
                      width: 22.0,
                      child: CircularProgressIndicator(color: mainColor),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
