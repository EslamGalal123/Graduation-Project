import 'package:diiabest/core/Utils/App-Assets.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PregnancyInformation extends StatelessWidget {
  final String text;

  const PregnancyInformation({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          Assets.specific,
          width: 30.w, // Utilize screen util for width
        ),
        SizedBox(width: 10.w), // Utilize screen util for spacing
        Text(
          text,
          style: CustomTextStyles.lohit400style22.copyWith(
            fontSize: 18.sp, // Utilize screen util for font size
          ),
        ),
        SizedBox(height: 20.h), // Utilize screen util for height
      ],
    );
  }
}
