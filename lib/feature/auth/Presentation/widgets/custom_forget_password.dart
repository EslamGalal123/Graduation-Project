import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Widgets/custom_btn.dart';
import 'package:diiabest/core/Widgets/custom_text_field.dart';
import 'package:diiabest/feature/auth/Presentation/Views/Verification_password.dart';
import 'package:diiabest/feature/auth/auth_cubit/autch_state.dart';
import 'package:diiabest/feature/auth/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/Utils/App-Assets.dart';

// ignore: must_be_immutable
class CustomForgetPasswordForm extends StatelessWidget {
  CustomForgetPasswordForm({Key? key}) : super(key: key);
  TextEditingController emailAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SendCodeSuccess) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MyVerificationPage()));
        } else if (state is SendCodeFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMessage),
          ));
        }
      },
      child: Form(
        key:formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.01),
            Expanded(
              child: Text(
                "Reset your password with email",
                // Applocalizations.of(context)!.translatetext("Reset your password with email"),
                textAlign: TextAlign.center,
                style: CustomTextStyles.lohit500style18,
              ),
            ),
            SizedBox(height: height * 0.01),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.imagesImageNewpassword2,
                  height: height * 0.33,
                  width: width * 0.75,
                ),
                SizedBox(height: height * 0.03),
                CustomTextFormField(
                    mycontroller: emailAddress,
                    labelText: AppStrings.emailAddress),
              ],
            ),
            SizedBox(height: height * 0.02),
            const Spacer(
              flex: 4,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomBtn(
                  text: "Continue",
                  // Applocalizations.of(context)!.translatetext("Continue"),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                       BlocProvider.of<AuthCubit>(context)
                        .forgetPassword(email: emailAddress.text);
                    }
                    // customNavigate(context, "/MyVerificationPage");
                  },
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
          ],
        ),
      ),
    );
  }
}
