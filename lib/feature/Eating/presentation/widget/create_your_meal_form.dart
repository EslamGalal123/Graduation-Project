
import 'package:diiabest/core/Utils/App-Assets.dart';
import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Widgets/custom_btn_profile.dart';
import 'package:diiabest/feature/Eating/presentation/view/user_info.dart';
import 'package:flutter/material.dart';

class CreateYourMealForm extends StatelessWidget {
  const CreateYourMealForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.howtoEatHealthyandAvoidFadDiets,
              height: MediaQuery.of(context).size.height*0.53,
              width:MediaQuery.of(context).size.width*1.1,
            ),
           const SizedBox(height: 20),
            CustomBtnProfile(text: AppStrings.createyourmealplan,onPressed: () {
           
           Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  UserInfoPage()));
              // customNavigate(context, "/MealSection");
            },)
          ],
    );
  }
}