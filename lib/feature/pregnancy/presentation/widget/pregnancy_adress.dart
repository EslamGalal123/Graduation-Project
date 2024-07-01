import 'package:diiabest/core/Utils/App-Assets.dart';
import 'package:flutter/material.dart';
// ignore: must_be_immutable
class PregnancyAdress extends StatelessWidget {
   PregnancyAdress({super.key,required this.text});
String? text;
  @override
  Widget build(BuildContext context) {
    return Text(text!,style: Theme.of(context).textTheme.bodyMedium,);
  }
}

class IfYes extends StatelessWidget {
  const IfYes({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(width: 40,),
         Text("If yes , you should",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 24,color: Color.fromARGB(172, 43, 111, 213),),textAlign: TextAlign.start,),
      ],
    );
  }
}

// ignore: must_be_immutable
class AddressPregnancy extends StatelessWidget {
  AddressPregnancy({super.key,required this.text});
String? text;
  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
            Image.asset(
              Assets.hand,
              width: 50,
            ),
            Text(
              text!,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        );
  }
}