
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:flutter/material.dart';

class CustomBtnProfile extends StatelessWidget {
  const CustomBtnProfile({super.key, this.color, required this.text, this.onPressed});
  final Color? color;
  final String text;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.6,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:color?? AppColors.primarycolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          text,
          style: CustomTextStyles.lohit500style24
              .copyWith(fontSize: 22, color: AppColors.offwhite),
        ),
      ),
    );
  }
}