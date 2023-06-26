import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import 'custom_text.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({
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
  }) : super(key: key);

  final TextEditingController? controller;
  final String? Function(DateTime?)? validator;
  final DateTime? initialValue;
  final Function(DateTime?)? onChanged;
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

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
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
              DateTimeField(
                format: DateFormat("yyyy-MM-dd"),
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime.now(),
                  );
                },
                validator: widget.validator,
                controller: widget.controller,
                initialValue: widget.initialValue,
                onChanged: widget.onChanged,
                inputFormatters: widget.inputFormatters,
                obscureText: widget.secure == null ? false : widget.secure!,
                readOnly: widget.readOnly == null ? false : widget.readOnly!,
                keyboardType: widget.keyboardType,
                decoration: InputDecoration(
                  errorText: widget.errorText,
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
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ],
    );
  }
}
