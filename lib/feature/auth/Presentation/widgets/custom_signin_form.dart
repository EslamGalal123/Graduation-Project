import 'package:diiabest/core/Utils/App-Assets.dart';
import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Widgets/custom_btn.dart';
import 'package:diiabest/core/Widgets/custom_text_field.dart';
import 'package:diiabest/feature/auth/Presentation/Views/sign_up.dart';
import 'package:diiabest/feature/auth/Presentation/widgets/custom_check_box.dart';
import 'package:diiabest/feature/auth/Presentation/widgets/custom_social_icons.dart';
import 'package:diiabest/feature/auth/Presentation/widgets/forgot_password_text_widget.dart';
import 'package:diiabest/feature/auth/Presentation/widgets/have_an_account_widget.dart';
import 'package:diiabest/feature/auth/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSignInForm extends StatelessWidget {
  CustomSignInForm({super.key});
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        children: [
          Image.asset(
            Assets.imagesLogo,
            height: 0.4.sh,
          ),
          Text(
            AppStrings.logintoyouraccount,
            // Applocalizations.of(context)!.translatetext("logintoyouraccount"),
            style: CustomTextStyles.lohit500style24,
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTextFormField(
            mycontroller: emailAddress,
            labelText: AppStrings.emailAddress,
            // Applocalizations.of(context)!.translatetext("emailAddress"),
            prefixIcon: const Icon(Icons.email),
            onChanged: (email) {},
          ),
          CustomTextFormField(
            mycontroller: password,
            labelText: AppStrings.password,
            // Applocalizations.of(context)!.translatetext("password"),
            prefixIcon: const Icon(Icons.lock),
            onChanged: (password) {},
          ),
          const CustomCheckBox(),
          SizedBox(
            height: 10.h,
          ),
          CustomBtn(
            text: AppStrings.signIn,
            // Applocalizations.of(context)!.translatetext("signIn"),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<AuthCubit>(context).loginWithEmailAndPassword(
                  email: emailAddress.text,
                  password: password.text,
                );
              }
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          const ForgotPasswordTextWidget(),
          SizedBox(
            height: 20.h,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSocialIcons(
                image: Assets.imagesImageFacebook,
                url: '',
              ),
              CustomSocialIcons(
                image: Assets.imagesImageGoogle,
                url: '',
              ),
              CustomSocialIcons(
                image: Assets.imagesImageApple,
                url: '',
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          HaveAnAccountWidget(
            text1: AppStrings.donthaveanaccount,
            // Applocalizations.of(context)!.translatetext("donthaveanaccount"),
            text2: AppStrings.signUp,
            //  Applocalizations.of(context)!.translatetext("signUp"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignUpView()),
              );
              //  customNavigate(context, "/signUp");
            },
          )
        ],
      ),
    );
  }
}
