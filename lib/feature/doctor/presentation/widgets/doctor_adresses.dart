import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DoctorAdress extends StatelessWidget {
   DoctorAdress({ this.text});
String? text;
  @override
  Widget build(BuildContext context) {
    return Text(text!,style: Theme.of(context).textTheme.titleSmall);
  }
}