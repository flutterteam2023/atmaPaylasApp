import 'dart:io';

import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFilledButtonBerke extends StatelessWidget {
  const CustomFilledButtonBerke({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    const primary = Color(AppColors.primaryColor);
    bool isLoading = false;
    if (onTap.runtimeType.toString() == "() => Future<Null>") {
      return StatefulBuilder(builder: (context, setState) {
        return Bounceable(
          onTap: () async {
            setState(() => isLoading = true);
            await onTap.call();
            setState(() => isLoading = false);
          },
          child: Container(
            decoration: BoxDecoration(color: primary, borderRadius: BorderRadius.circular(5.r)),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Center(
                child: isLoading
                    ? Platform.isAndroid
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : const CircularProgressIndicator.adaptive(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            backgroundColor: Colors.white,
                          )
                    : Text(
                        text,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
              ),
            ),
          ),
        );
      });
    } else {
      return Bounceable(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(color: primary, borderRadius: BorderRadius.circular(5.r)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
