import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InformationAdresses extends StatelessWidget {
 InformationAdresses({super.key,required this.text});
String? text;
  @override
  Widget build(BuildContext context) {
    return Text(
              text!,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.left,
              maxLines: 1
            );
  }
}