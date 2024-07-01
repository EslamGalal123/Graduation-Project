import 'package:diiabest/core/Utils/App-Assets.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/feature/pregnancy/presentation/widget/high_blood_suger.dart';
import 'package:diiabest/feature/pregnancy/presentation/widget/information.dart';
import 'package:diiabest/feature/pregnancy/presentation/widget/low_blood_suger.dart';
import 'package:diiabest/feature/pregnancy/presentation/widget/pregnancy_adress.dart';
import 'package:flutter/material.dart';
class CustomPregnancyForm extends StatefulWidget {
  const CustomPregnancyForm({super.key});

  @override
  State<CustomPregnancyForm> createState() => _CustomPregnancyFormState();
}

class _CustomPregnancyFormState extends State<CustomPregnancyForm> {
  List<bool> isCheckedList = [false, false];
  bool showField1 = false;
  bool showField2 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          "Pregnancy",
          style: CustomTextStyles.lohit500style24deed,
        ),
        const SizedBox(
          height: 15,
        ),
        PregnancyAdress(text: "Blood Suger Level"),
        Row(
          children: [
            Checkbox(
              value: isCheckedList[0],
              onChanged: (bool? value) {
                setState(() {
                  isCheckedList[0] = value ?? false;
                  isCheckedList[1] = !isCheckedList[0];
                  if (isCheckedList[0] = true) {
                    showField1 = true;
                    showField2 = false;
                  } else {
                    showField1 = false;
                  }
                });
              },
            ),
            Text(
              "High",
              style: CustomTextStyles.lohit400style20,
            ),
            const SizedBox(width: 86),
            Checkbox(
              value: isCheckedList[1],
              onChanged: (bool? value) {
                setState(() {
                  isCheckedList[1] = value ?? false;
                  isCheckedList[0] = !isCheckedList[1];
                  if (isCheckedList[1] = true) {
                    showField1 = false;
                    showField2 = true;
                  } else {
                    showField1 = false;
                  }
                });
              },
            ),
            Text(
              'Low',
              style: CustomTextStyles.lohit400style20,
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            Image.asset(
              Assets.hand,
              width: 50,
            ),
            Text(
              "Things to be careful of",
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 25, bottom: 15),
          child: Column(
            children: [
              PregnancyInformation(text: "obesity."),
              PregnancyInformation(text: "extreme thinness."),
              PregnancyInformation(text: "polycystic ovary syndrome."),
              PregnancyInformation(
                  text: "giving birth to a baby weighing \nmore than 4.5 kg ."),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 35,
                  ),
                  Text(
                    "OR ELSE",
                    style: CustomTextStyles.lohit500style20
                        .copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              PregnancyInformation(
                  text:
                      "Your risk of getting pregnancy \ndiabetes will increase."),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
        if (showField1) const HighBloodSuger(),
        if (showField2) const LowBloodSuger()
      ],
    );
  }
}
