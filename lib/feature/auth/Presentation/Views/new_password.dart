import 'package:diiabest/core/Utils/App-Assets.dart';
import 'package:diiabest/core/Widgets/custom_btn.dart';
import 'package:diiabest/core/Widgets/custom_text_field.dart';
import 'package:diiabest/feature/auth/Presentation/Views/sign_up.dart';
import 'package:diiabest/feature/auth/auth_cubit/autch_state.dart';
import 'package:diiabest/feature/auth/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


// ignore: must_be_immutable
class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  TextEditingController newpassword = TextEditingController();

  TextEditingController confirmThePassword = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Create New Password",
          // Applocalizations.of(context)!.translatetext("Create New Password"),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.01),
              SizedBox(height: height * 0.01),
              SizedBox(height: height * 0.01),
              ClipOval(
                child: SizedBox(
                  width: width * 0.4,
                  height: height * 0.4,
                  child: Image.asset(
                    Assets.imagesImageNewpassword1,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              CustomTextFormField(
                  labelText: "New Password",
                  //  Applocalizations.of(context)!.translatetext("New Password"),
                  mycontroller: newpassword),
              CustomTextFormField(
                  labelText: "Confirm Password",
                  //  Applocalizations.of(context)!.translatetext("Confirm Password"),
                  mycontroller: confirmThePassword),
              SizedBox(height: height * 0.01),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {
                      // Handle checkbox state
                    },
                  ),
                  const Text("Remember me"
                      // Applocalizations.of(context)!.translatetext("Remember me")
                      ),
                ],
              ),
              SizedBox(height: height * 0.04),
              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is ResetPasswordSuccess) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpView(),
                      ),
                      (route) => false,
                    );
                  }
                  if (state is ResetPasswordFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.errorMessage),
                      ),
                    );
                  }
                },
                child: CustomBtn(
                  text: "Continue"
                  // Applocalizations.of(context)!.translatetext("Continue")
                  ,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<AuthCubit>(context).resetPassword(
                          password: newpassword.text,
                          comfirmPassword: confirmThePassword.text);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Function to show a dialog
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(''),
          content: Image.asset(
            'assets/New Password/congrats.png',
            fit: BoxFit.cover,
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF246BFE)),
              child: const Text(
                "Close"
                // Applocalizations.of(context)!.translatetext("Close")
                ,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
