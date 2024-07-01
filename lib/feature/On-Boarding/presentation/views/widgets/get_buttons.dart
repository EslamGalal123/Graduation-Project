

import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Widgets/custom_btn.dart';
import 'package:diiabest/feature/On-Boarding/Functions/on_boarding.dart';
import 'package:diiabest/feature/auth/Presentation/Views/sign_in.dart';
import 'package:diiabest/feature/auth/Presentation/Views/sign_up.dart';
import 'package:diiabest/feature/doctor/data/model/doctor_model.dart';
import 'package:flutter/material.dart';
class GetButtons extends StatelessWidget {
  const GetButtons(
      {super.key, required this.currentIndex, required this.controller});
  final int currentIndex;
  final PageController controller;
  
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    if (currentIndex == onBoardingData.length - 1) {
      return Column(
        children: [
          CustomBtn(
            text: AppStrings.createAccount,
            // Applocalizations.of(context)!.translatetext("createAccount"),
            onPressed: () {
              onBoardingVisited();
              // customReplacementNavigate(context, "/signUp");
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>const SignUpView()));
            },
          ),
          SizedBox(height:height*0.02 ),
          GestureDetector(
            onTap: () {
              onBoardingVisited();
              // customReplacementNavigate(context, "/signIn");
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>const SignInView()));
            },
            child: Text(
              AppStrings.loginNow,
              // Applocalizations.of(context)!.translatetext( "loginNow"),
              style: Theme.of(context).textTheme.titleSmall
              
            ),
          ),
        ],
      );
    } else {
      return CustomBtn(
        text:AppStrings.next,
        //  Applocalizations.of(context)!.translatetext("next"),
        onPressed: () {
          controller.nextPage(
            duration: const Duration(microseconds: 200),
            curve: Curves.bounceIn,
          );
        },
      );
    }
  }
}