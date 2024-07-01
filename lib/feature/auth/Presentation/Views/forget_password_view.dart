import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/feature/auth/Presentation/widgets/custom_forget_password.dart';
import 'package:flutter/material.dart';


class ForgotPasswordViews extends StatelessWidget {
  const ForgotPasswordViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: const Text(AppStrings.forgotPassword
              // Applocalizations.of(context)!.translatetext("Forget Password")
              )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomForgetPasswordForm(),
        ),
      ),
    );
  }
}
