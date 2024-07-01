// import 'package:diabestapp/Core/Utils/App-Assets.dart';
// import 'package:diabestapp/Core/Utils/App-TextStyles.dart';
// import 'package:diabestapp/Core/Utils/App-colors.dart';
// import 'package:diabestapp/Features/Register_your_information/presentation/widgets/information_adresses.dart';
// import 'package:diabestapp/Localizations/applocalizations.dart';
import 'package:diiabest/core/Utils/App-Assets.dart';
import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:diiabest/feature/Register_your_information/cubit/register_patient_cubit.dart';
import 'package:diiabest/feature/Register_your_information/presentation/widgets/information_adresses.dart';
import 'package:diiabest/feature/auth/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CustomFormInfoPage1 extends StatefulWidget {
  const CustomFormInfoPage1({super.key});

  @override
  State<CustomFormInfoPage1> createState() => _CustomFormInfoPage1State();
}

class _CustomFormInfoPage1State extends State<CustomFormInfoPage1> {
  String? gender;
  String? diabeticcama;
  String? doyousmoke;
  String? familyhavediabetes;
  String? oral;
  String? breastfeeding;
  String? pregnant;
  String? presuremedications;
  String? takemedications;
  String? drinkachol;
  String? pancreasdisease;
  @override
  Widget build(BuildContext context) {
    gender = BlocProvider.of<AuthCubit>(context).gender;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InformationAdresses(text: AppStrings.doyousufferfromdiabeticcoma
            // Applocalizations.of(context)!.translatetext("doyousufferfromdiabeticcoma")
            ),
        const SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Radio(
                value: 'true',
                groupValue: diabeticcama,
                onChanged: (val) {
                  BlocProvider.of<RegisterPatientCubit>(context).diabeticcama =
                      val!;
                  setState(() {
                    diabeticcama = val;
                  });
                }),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                AppStrings.yes,
                // Applocalizations.of(context)!.translatetext("yes"),
                style: CustomTextStyles.lohit400style18,
              ),
            ),
            const SizedBox(
              width: 80,
            ),
            Radio(
                value: 'false',
                groupValue: diabeticcama,
                onChanged: (val) {
                  BlocProvider.of<RegisterPatientCubit>(context).diabeticcama =
                      val!;
                  setState(() {
                    diabeticcama = val;
                  });
                }),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                AppStrings.no,
                // Applocalizations.of(context)!.translatetext("no"),
                style: CustomTextStyles.lohit400style18,
              ),
            ),
          ],
        ),
        InformationAdresses(text: AppStrings.doyousmoke
            // Applocalizations.of(context)!.translatetext("doyousmoke")
            ),
        const SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Radio(
                value: 'true',
                groupValue: doyousmoke,
                onChanged: (val) {
                  BlocProvider.of<RegisterPatientCubit>(context).doyousmoke =
                      val!;
                  setState(() {
                    doyousmoke = val;
                  });
                }),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                AppStrings.yes,
                // Applocalizations.of(context)!.translatetext("yes"),
                style: CustomTextStyles.lohit400style18,
              ),
            ),
            const SizedBox(
              width: 80,
            ),
            Radio(
                value: 'false',
                groupValue: doyousmoke,
                onChanged: (val) {
                  BlocProvider.of<RegisterPatientCubit>(context).doyousmoke =
                      val!;
                  setState(() {
                    doyousmoke = val;
                  });
                }),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                AppStrings.no,

                // Applocalizations.of(context)!.translatetext("no"),
                style: CustomTextStyles.lohit400style18,
              ),
            ),
          ],
        ),
        InformationAdresses(text: AppStrings.doesanyoneinyourfamilyhavediabetes
            // Applocalizations.of(context)!.translatetext("doesanyoneinyourfamilyhavediabetes")
            ),
        const SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Radio(
                value: 'true',
                groupValue: familyhavediabetes,
                onChanged: (val) {
                  BlocProvider.of<RegisterPatientCubit>(context)
                      .familyhavediabetes = val!;
                  setState(() {
                    familyhavediabetes = val;
                  });
                }),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                AppStrings.yes,

                // Applocalizations.of(context)!.translatetext("yes"),
                style: CustomTextStyles.lohit400style18,
              ),
            ),
            const SizedBox(
              width: 80,
            ),
            Radio(
                value: 'false',
                groupValue: familyhavediabetes,
                onChanged: (val) {
                  BlocProvider.of<RegisterPatientCubit>(context)
                      .familyhavediabetes = val!;
                  setState(() {
                    familyhavediabetes = val;
                  });
                }),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                AppStrings.no,

                // Applocalizations.of(context)!.translatetext("no"),
                style: CustomTextStyles.lohit400style18,
              ),
            ),
          ],
        ),
        InformationAdresses(text: AppStrings.doyouusebloodpresuremedications
            // Applocalizations.of(context)!.translatetext("doyouusebloodpresuremedications")
            ),
        const SizedBox(
          height: 7,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Radio(
                value: 'true',
                groupValue: presuremedications,
                onChanged: (val) {
                  BlocProvider.of<RegisterPatientCubit>(context)
                      .presuremedications = val!;
                  setState(() {
                    presuremedications = val;
                  });
                }),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                AppStrings.yes,

                //  Applocalizations.of(context)!.translatetext("yes"),
                style: CustomTextStyles.lohit400style18,
              ),
            ),
            const SizedBox(
              width: 80,
            ),
            Radio(
                value: 'false',
                groupValue: presuremedications,
                onChanged: (val) {
                  BlocProvider.of<RegisterPatientCubit>(context)
                      .presuremedications = val!;
                  setState(() {
                    presuremedications = val;
                  });
                }),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                AppStrings.no,

                // Applocalizations.of(context)!.translatetext("no"),
                style: CustomTextStyles.lohit400style18,
              ),
            ),
          ],
        ),
        InformationAdresses(
            text: AppStrings
                .doyoutakemedicationforatheroscleriosisoranyheartdisease
            //  Applocalizations.of(context)!.translatetext("doyoutakemedicationforatheroscleriosisoranyheartdisease")
            ),
        const SizedBox(
          height: 7,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Radio(
                value: 'true',
                groupValue: takemedications,
                onChanged: (val) {
                  BlocProvider.of<RegisterPatientCubit>(context)
                      .takemedications = val!;
                  setState(() {
                    takemedications = val;
                  });
                }),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                AppStrings.yes,

                // Applocalizations.of(context)!.translatetext("yes"),
                style: CustomTextStyles.lohit400style18,
              ),
            ),
            const SizedBox(
              width: 80,
            ),
            Radio(
                value: 'false',
                groupValue: takemedications,
                onChanged: (val) {
                  BlocProvider.of<RegisterPatientCubit>(context)
                      .takemedications = val!;
                  setState(() {
                    takemedications = val;
                  });
                }),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                AppStrings.no,

                // Applocalizations.of(context)!.translatetext("no"),
                style: CustomTextStyles.lohit400style18,
              ),
            ),
          ],
        ),
        InformationAdresses(text: AppStrings.doyoudrinkalcholetc
            //  Applocalizations.of(context)!.translatetext("doyoudrinkalcholetc")
            ),
        const SizedBox(
          height: 7,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Radio(
                value: 'true',
                groupValue: drinkachol,
                onChanged: (val) {
                  BlocProvider.of<RegisterPatientCubit>(context).drinkachol =
                      val!;
                  setState(() {
                    drinkachol = val;
                  });
                }),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                AppStrings.yes,

                // Applocalizations.of(context)!.translatetext("yes"),
                style: CustomTextStyles.lohit400style18,
              ),
            ),
            const SizedBox(
              width: 80,
            ),
            Radio(
                value: 'false',
                groupValue: drinkachol,
                onChanged: (val) {
                  BlocProvider.of<RegisterPatientCubit>(context).drinkachol =
                      val!;
                  setState(() {
                    drinkachol = val;
                  });
                }),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                AppStrings.no,

                // Applocalizations.of(context)!.translatetext("no"),
                style: CustomTextStyles.lohit400style18,
              ),
            ),
          ],
        ),
        InformationAdresses(
            text: AppStrings.doyouhavemedicationforanyhepaticdisease
            //  Applocalizations.of(context)!.translatetext("doyouhavemedicationforanyhepaticdisease")
            ),
        const SizedBox(
          height: 7,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Radio(
                value: 'true',
                groupValue: pancreasdisease,
                onChanged: (val) {
                  BlocProvider.of<RegisterPatientCubit>(context)
                      .pancreasdisease = val!;
                  setState(() {
                    pancreasdisease = val;
                  });
                }),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                AppStrings.yes,

                // Applocalizations.of(context)!.translatetext("yes"),
                style: CustomTextStyles.lohit400style18,
              ),
            ),
            const SizedBox(
              width: 80,
            ),
            Radio(
                value: 'false',
                groupValue: pancreasdisease,
                onChanged: (val) {
                  BlocProvider.of<RegisterPatientCubit>(context)
                      .pancreasdisease = val!;
                  setState(() {
                    pancreasdisease = val;
                  });
                }),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                AppStrings.no,

                // Applocalizations.of(context)!.translatetext("no"),
                style: CustomTextStyles.lohit400style18,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        if (gender == AppStrings.female)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Icon(Icons.woman_2_outlined,size: 40,color: AppColors.black2,),
                  Image.asset(Assets.imagesImageOpenmojiWoman),
                  Text(
                    AppStrings.forfemale,
                    // Applocalizations.of(context)!.translatetext("forfemale"),
                    style: CustomTextStyles.lohit500style24
                        .copyWith(color: AppColors.black2),
                  )
                ],
              ),
              InformationAdresses(text: AppStrings.doyouhaveoralcontraceptives
                  // Applocalizations.of(context)!.translatetext("doyouhaveoralcontraceptives")
                  ),
              const SizedBox(
                height: 7,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Radio(
                      value: 'true',
                      groupValue: oral,
                      onChanged: (val) {
                        BlocProvider.of<RegisterPatientCubit>(context).oral =
                            val!;
                        setState(() {
                          oral = val;
                        });
                      }),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      AppStrings.yes,

                      // Applocalizations.of(context)!.translatetext("yes"),
                      style: CustomTextStyles.lohit400style18,
                    ),
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  Radio(
                      value: 'false',
                      groupValue: oral,
                      onChanged: (val) {
                        BlocProvider.of<RegisterPatientCubit>(context).oral =
                            val!;
                        setState(() {
                          oral = val;
                        });
                      }),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      AppStrings.no,

                      // Applocalizations.of(context)!.translatetext("no"),
                      style: CustomTextStyles.lohit400style18,
                    ),
                  ),
                ],
              ),
              InformationAdresses(text: AppStrings.areyoupregnant
                  // Applocalizations.of(context)!.translatetext("areyoupregnant")
                  ),
              const SizedBox(
                height: 7,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Radio(
                      value: 'true',
                      groupValue: pregnant,
                      onChanged: (val) {
                        BlocProvider.of<RegisterPatientCubit>(context)
                            .pregnant = val!;
                        setState(() {
                          pregnant = val;
                        });
                      }),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      AppStrings.yes,

                      // Applocalizations.of(context)!.translatetext("yes"),
                      style: CustomTextStyles.lohit400style18,
                    ),
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  Radio(
                      value: 'false',
                      groupValue: pregnant,
                      onChanged: (val) {
                        BlocProvider.of<RegisterPatientCubit>(context)
                            .pregnant = val!;
                        setState(() {
                          pregnant = val;
                        });
                      }),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      AppStrings.no,

                      // Applocalizations.of(context)!.translatetext("no"),
                      style: CustomTextStyles.lohit400style18,
                    ),
                  ),
                ],
              ),
              InformationAdresses(text: AppStrings.areyoubreastfeeding
                  // Applocalizations.of(context)!.translatetext("areyoubreastfeeding")
                  ),
              const SizedBox(
                height: 7,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Radio(
                      value: 'true',
                      groupValue: breastfeeding,
                      onChanged: (val) {
                        BlocProvider.of<RegisterPatientCubit>(context)
                            .breastfeeding = val!;
                        setState(() {
                          breastfeeding = val;
                        });
                      }),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      AppStrings.yes,

                      // Applocalizations.of(context)!.translatetext("yes"),
                      style: CustomTextStyles.lohit400style18,
                    ),
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  Radio(
                      value: 'false',
                      groupValue: breastfeeding,
                      onChanged: (val) {
                        BlocProvider.of<RegisterPatientCubit>(context)
                            .breastfeeding = val!;
                        setState(() {
                          breastfeeding = val;
                        });
                      }),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      AppStrings.no,

                      // Applocalizations.of(context)!.translatetext("no"),
                      style: CustomTextStyles.lohit400style18,
                    ),
                  ),
                ],
              )
            ],
          ),
      ],
    );
  }
}
