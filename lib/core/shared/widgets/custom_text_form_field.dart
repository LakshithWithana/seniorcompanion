import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import 'custom_text.dart';

enum RoleType { general, careGiver, careRecipient }

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.controller,
    this.validator,
    this.initialValue,
    this.onChanged,
    this.inputFormatters,
    this.keyboardType,
    this.secure,
    this.readOnly,
    @required this.hintText,
    this.enabled,
    this.prefix,
    this.suffix,
    required this.borderColor,
    this.borderWidth,
    this.fontSize,
    this.height,
    this.errorText,
    this.roleType,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? initialValue;
  final Function(String)? onChanged;
  final inputFormatters;
  final keyboardType;
  final bool? secure;
  final bool? readOnly;
  final String? hintText;
  final bool? enabled;
  final Widget? prefix;
  final Widget? suffix;
  final Color borderColor;
  final double? borderWidth;
  final double? fontSize;
  final double? height;
  final String? errorText;
  final RoleType? roleType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          // height: widget.height ?? 30.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: hintText!.toUpperCase(),
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
              TextFormField(
                enabled: enabled,
                style: TextStyle(
                  color: black,
                  fontSize: fontSize ?? 16.0.w,
                ),
                decoration: InputDecoration(
                  errorText: errorText,
                  prefixIcon: prefix,
                  suffixIcon: suffix,
                  hintText: hintText,
                  hintStyle: const TextStyle(color: secondaryFontColor),
                  isDense: true,
                  contentPadding: const EdgeInsets.all(10.0),
                  fillColor: white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: secondaryColor, width: borderWidth ?? 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: secondaryColor, width: borderWidth ?? 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: roleType == RoleType.general
                            ? borderColor
                            : roleType == RoleType.careGiver
                                ? mainBlue
                                : mainOrange,
                        width: borderWidth ?? 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.redAccent, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.redAccent, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: validator,
                controller: controller,
                initialValue: initialValue,
                onChanged: onChanged,
                inputFormatters: inputFormatters,
                obscureText: secure == null ? false : secure!,
                readOnly: readOnly == null ? false : readOnly!,
                keyboardType: keyboardType,
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ],
    );
  }
}
