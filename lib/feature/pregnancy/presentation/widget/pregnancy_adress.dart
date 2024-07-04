import 'package:diiabest/core/Utils/App-Assets.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PregnancyAdress extends StatelessWidget {
  final String text;

  const PregnancyAdress({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Text(
      text,
      style:CustomTextStyles.lohit500style18.copyWith(
            fontSize: 20.sp, // Utilize screen util for font size
          ),
    );
  }
}

class IfYes extends StatelessWidget {
  const IfYes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        SizedBox(width: 40.w), // Utilize screen util for width
        Text(
          "If yes, you should",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 24.sp, // Utilize screen util for font size
            color: Color.fromARGB(172, 43, 111, 213),
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}

class AddressPregnancy extends StatelessWidget {
  final String text;

  const AddressPregnancy({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Image.asset(
          Assets.hand,
          width: 50.w, // Utilize screen util for width
        ),
        SizedBox(width: 10.w), // Utilize screen util for spacing
        Text(
          text,
          style: CustomTextStyles.lohit400style20.copyWith(
            fontSize: 16.sp, // Utilize screen util for font size
          ),
        ),
      ],
    );
  }
}
