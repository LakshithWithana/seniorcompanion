import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seniorcompanion/core/shared/widgets/custom_text.dart';

class BlockScreenView extends StatelessWidget {
  BlockScreenView({
    super.key,
    required this.pmtBlocked,
    required this.tmpBlocked,
  });
  bool tmpBlocked = false;
  bool pmtBlocked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(
          Icons.warning,
          color: pmtBlocked ? Colors.red : Colors.orange,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset("assets/gifs/oops.gif"),
                CustomText(
                    text: pmtBlocked
                        ? "Your account is permanently blocked by the Admin! No longer you can use this app!"
                        : "Your account is temporary blocked by the Admin! Account will restore in some days.",
                    fontSize: 18.0.sp),
                const SizedBox(height: 40.0),
                CustomText(
                  text:
                      "Why you see this blocked screen?\n * Your account may contain inappopriate images in your account.\n * You may have sent unwanted messages to other users.",
                  fontSize: 16.0.sp,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
