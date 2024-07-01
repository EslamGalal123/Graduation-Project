
import 'package:diiabest/core/Utils/App-Assets.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:flutter/material.dart';
// ignore: must_be_immutable
class PregnancyInformation extends StatelessWidget {
   PregnancyInformation({super.key,required this.text});
String? text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(Assets.specific,width: 35,),
        Text(text!,style:CustomTextStyles.lohit400style22 ,),
      const  SizedBox(height: 20,),
      ],
    );
  }
}