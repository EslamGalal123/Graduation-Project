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
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({Key? key}) : super(key: key);

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
                builder: (context) => const RegisterPatientInformation(),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DoctorView(),
              ),
            );
          }
        }
      },
      child: SingleChildScrollView(
        padding: EdgeInsets.all(5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFormField(
              mycontroller: BlocProvider.of<AuthCubit>(context).fullName,
              labelText: AppStrings.fullname,
              onChanged: (fristName) {},
            ),
            CustomTextFormField(
              mycontroller: BlocProvider.of<AuthCubit>(context).nationalID,
              labelText: AppStrings.nationalID,
              onChanged: (lastName) {},
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
              margin: EdgeInsets.only(top: 15.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.grey),
              ),
              child: PopupMenuButton(
                icon: Container(
                  child: Row(
                    children: [
                      Text(
                        BlocProvider.of<AuthCubit>(context).gender ?? "Gender",
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ],
                  ),
                ),
                onSelected: (value) {
                  BlocProvider.of<AuthCubit>(context).gender = value.toString();
                },
                itemBuilder: (context) {
                  return [
                     PopupMenuItem(
                      value: AppStrings.male,
                      child: Text(
                        "Male",
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                     PopupMenuItem(
                      value: AppStrings.female,
                      child: Text(
                        "Female",
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                  ];
                },
              ),
            ),
            CustomTextFormField(
              mycontroller: BlocProvider.of<AuthCubit>(context).emailAddress,
              labelText: AppStrings.emailAddress,
              prefixIcon: const Icon(Icons.email),
              onChanged: (email) {},
            ),
            CustomTextFormField(
              mycontroller: BlocProvider.of<AuthCubit>(context).password,
              labelText: AppStrings.password,
              prefixIcon: const Icon(Icons.lock),
              onChanged: (password) {},
            ),
            CustomTextFormField(
              mycontroller: BlocProvider.of<AuthCubit>(context).confirmThePassword,
              labelText: AppStrings.confirmThePassword,
              prefixIcon: const Icon(Icons.lock),
              onChanged: (password) {},
            ),
            SizedBox(height: 10.h),
            const SignUpRadio(),
          ],
        ),
      ),
    );
  }
}
