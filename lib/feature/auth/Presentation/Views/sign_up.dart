import 'package:diiabest/core/Utils/App-Assets.dart';
import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/feature/auth/Presentation/Views/sign_in.dart';
import 'package:diiabest/feature/auth/Presentation/widgets/custom_signup_form.dart';
import 'package:diiabest/feature/auth/Presentation/widgets/have_an_account_widget.dart';
import 'package:diiabest/feature/auth/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Form(
        key: BlocProvider.of<AuthCubit>(context).signupFormKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(child: Image.asset(Assets.imagesImageSigin)),
                SliverToBoxAdapter(child: SizedBox(height: height * 0.02)),
                const SliverToBoxAdapter(child: CustomSignUpForm()),
                SliverToBoxAdapter(child: SizedBox(height: height * 0.01)),
                SliverToBoxAdapter(
                  child: HaveAnAccountWidget(
                    text1: AppStrings.alreadyHaveAnAccount,
                    // Applocalizations.of(context)!.translatetext("alreadyHaveAnAccount"
                    // ),
        
                    text2: AppStrings.signIn,
                    // Applocalizations.of(context)!.translatetext("signIn"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInView(),
                        ),
                      );
                      // customNavigate(context, "/signIn");
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: height * 0.01),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
