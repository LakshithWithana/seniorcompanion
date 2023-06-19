import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import 'custom_text.dart';

class CustomTextFormField extends StatefulWidget {
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

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
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
                text: widget.hintText!.toUpperCase(),
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
              TextFormField(
                enabled: widget.enabled,
                style: TextStyle(
                  color: black,
                  fontSize: widget.fontSize ?? 16.0.w,
                ),
                decoration: InputDecoration(
                  prefixIcon: widget.prefix,
                  suffixIcon: widget.suffix,
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(color: secondaryFontColor),
                  isDense: true,
                  contentPadding: const EdgeInsets.all(10.0),
                  fillColor: white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: secondaryColor,
                        width: widget.borderWidth ?? 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: secondaryColor,
                        width: widget.borderWidth ?? 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: widget.borderColor,
                        width: widget.borderWidth ?? 2.0),
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
                validator: widget.validator,
                controller: widget.controller,
                initialValue: widget.initialValue,
                onChanged: widget.onChanged,
                inputFormatters: widget.inputFormatters,
                obscureText: widget.secure == null ? false : widget.secure!,
                readOnly: widget.readOnly == null ? false : widget.readOnly!,
                keyboardType: widget.keyboardType,
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ],
    );
  }
}
