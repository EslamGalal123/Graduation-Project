import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:diiabest/core/Widgets/custom_text_field.dart';
import 'package:diiabest/feature/Register_your_information/presentation/views/register_your_information.dart';
import 'package:diiabest/feature/auth/Presentation/widgets/signup_radio.dart';
import 'package:diiabest/feature/auth/auth_cubit/autch_state.dart';
import 'package:diiabest/feature/auth/auth_cubit/auth_cubit.dart';
import 'package:diiabest/feature/doctor/presentation/views/doctor_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


// ignore: must_be_immutable
class CustomSignUpForm extends StatefulWidget {
  const CustomSignUpForm({super.key});

  @override
  State<CustomSignUpForm> createState() => _CustomSignUpFormState();
}

enum Gender { Male, Female }

Gender? selectedGender;

class _CustomSignUpFormState extends State<CustomSignUpForm> {
  String? gender;
  String? selectedGender;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
        if (state is SignUpSuccess) {
          if (state.currentUser.role == AppStrings.patient) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RegisterPatientInformation()));
            // customNavigate(context, "/registerYourInformation");
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DoctorView(),
              ),
            );
            // customNavigate(context, "/doctor");
          }
        }
      },
      child: Column(children: [
        CustomTextFormField(
          mycontroller: BlocProvider.of<AuthCubit>(context).fullName,
          labelText: AppStrings.fullname,
          //  Applocalizations.of(context)!.translatetext("fullname"),
          onChanged: (fristName) {},
        ),
        CustomTextFormField(
          mycontroller: BlocProvider.of<AuthCubit>(context).nationalID,
          labelText: AppStrings.nationalID,
          // Applocalizations.of(context)!.translatetext("nationalID"),
          onChanged: (lastName) {},
        ),

        Container(
            padding: const EdgeInsets.only(right: 15, left: 15, top: 5),
            margin: EdgeInsets.only(
              top: 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.grey),
            ),
            child: PopupMenuButton(
              icon: Container(
                child: Row(
                  children: [
                    Text(
                      selectedGender ?? "Gender",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              onSelected: (value) {
                setState(() {
                  selectedGender = value;
                });
                BlocProvider.of<AuthCubit>(context).gender = value;
              },
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: AppStrings.male,
                    child: Text(
                      "Male",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const PopupMenuItem(
                    value: AppStrings.female,
                    child: Text(
                      "Female",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ];
              },
            )
            ),

        CustomTextFormField(
          mycontroller: BlocProvider.of<AuthCubit>(context).emailAddress,
          labelText: AppStrings.emailAddress,
          // Applocalizations.of(context)!.translatetext("emailAddress"),
          prefixIcon: const Icon(Icons.email),
          onChanged: (email) {},
        ),
        CustomTextFormField(
            mycontroller: BlocProvider.of<AuthCubit>(context).password,
            labelText: AppStrings.password,
            //  Applocalizations.of(context)!.translatetext("password"),
            prefixIcon: const Icon(Icons.lock),
            onChanged: (password) {}),
        CustomTextFormField(
            mycontroller:
                BlocProvider.of<AuthCubit>(context).confirmThePassword,
            labelText: AppStrings.confirmThePassword,
            // Applocalizations.of(context)!.translatetext("confirmThePassword"),
            prefixIcon: const Icon(Icons.lock),
            onChanged: (password) {}),
        SizedBox(height: height * 0.01),

        const SignUpRadio(),
      ]),
    );
  }
}
