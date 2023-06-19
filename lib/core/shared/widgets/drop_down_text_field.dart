import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';

class DropDownTextField extends StatefulWidget {
  const DropDownTextField({
    super.key,
    required this.hintText,
    required this.dropdownItems,
    required this.width,
    required this.borderColor,
    required this.fillColor,
    this.paddingArround,
  });
  final String hintText;
  final List<String> dropdownItems;
  final double width;
  final Color borderColor;
  final Color fillColor;
  final EdgeInsetsGeometry? paddingArround;

  @override
  State<DropDownTextField> createState() => _DropDownTextFieldState();
}

class _DropDownTextFieldState extends State<DropDownTextField> {
  String currentSelectedValue = "";
  @override
  void initState() {
    setState(() {
      currentSelectedValue = widget.dropdownItems.first;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Padding(
        padding: widget.paddingArround != null
            ? widget.paddingArround!
            : const EdgeInsets.symmetric(vertical: 5.0),
        child: SizedBox(
          // constraints: BoxConstraints(minHeight: 20.0.h, maxHeight: 40.0.h),
          height: 30.0,
          child: FormField<String>(
            builder: (FormFieldState<String> state) {
              return InputDecorator(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: widget.fillColor,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 0.0),
                  labelText: widget.hintText,
                  labelStyle:
                      TextStyle(fontSize: 12.0.sp, color: secondaryFontColor),
                  errorStyle:
                      TextStyle(color: Colors.redAccent, fontSize: 12.0.sp),
                  hintText: widget.hintText,
                  hintStyle:
                      TextStyle(fontSize: 12.0.sp, color: secondaryFontColor),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: widget.borderColor, width: 1.0),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
                isEmpty: currentSelectedValue == widget.dropdownItems.first,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    style: TextStyle(fontSize: 12.0.sp),
                    value: currentSelectedValue,
                    isDense: true,
                    itemHeight: null,
                    onChanged: (String? newValue) {
                      setState(() {
                        currentSelectedValue = newValue!;
                        state.didChange(newValue);
                      });
                    },
                    items: widget.dropdownItems.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
