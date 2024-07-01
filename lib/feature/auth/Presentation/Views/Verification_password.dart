import 'dart:async';

import 'package:diiabest/feature/auth/Presentation/Views/new_password.dart';
import 'package:diiabest/feature/auth/auth_cubit/autch_state.dart';
import 'package:diiabest/feature/auth/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyVerificationPage extends StatefulWidget {
  const MyVerificationPage({super.key});

  @override
  _MyVerificationPageState createState() => _MyVerificationPageState();
}

class _MyVerificationPageState extends State<MyVerificationPage> {
  String emailAddress = 'es*******@gmail.com';
  String otpCode = '';
  int countdown = 120;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (countdown > 0) {
          countdown--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "OTP Verification",
          // Applocalizations.of(context)!.translatetext("OTP Verification")
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              "OTP Code Verification",
              // Applocalizations.of(context)!.translatetext("OTP Code Verification"),
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text('${"Enter code sent to"} $emailAddress'),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 6; i++)
                  Container(
                    width: 40.0,
                    height: 40.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontSize: 16.0),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      readOnly: true,
                      controller: TextEditingController(
                          text: i < otpCode.length ? otpCode[i] : ''),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text('${"Reset code in"}$countdown s'),
            const SizedBox(height: 16.0),
            BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is VerifyEmailSuccess) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateNewPassword()),
                    (route) => false,
                  );
                }
                if (state is VerifyEmailFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errorMessage)));
                }
              },
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF246BFE),
                    padding: const EdgeInsets.symmetric(horizontal: 40)),
                onPressed: () {
                  if (otpCode.isNotEmpty) {
                    BlocProvider.of<AuthCubit>(context)
                      .verifyEmailCode(code: otpCode);
                  }
                  // customNavigate(context, "/CreateNewPassword");
                },
                child: const Text(
                  "Continue"
                  // Applocalizations.of(context)!.translatetext("Continue")
                  ,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: buildNumericKeyboard(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNumericKeyboard() {
    return ListView(
      shrinkWrap: true,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildKeyboardButton('1'),
            buildKeyboardButton('2'),
            buildKeyboardButton('3'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildKeyboardButton('4'),
            buildKeyboardButton('5'),
            buildKeyboardButton('6'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildKeyboardButton('7'),
            buildKeyboardButton('8'),
            buildKeyboardButton('9'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildEmptyButton(),
            buildKeyboardButton('0'),
            buildBackspaceButton(),
          ],
        ),
      ],
    );
  }

  Widget buildKeyboardButton(String value) {
    return GestureDetector(
      onTap: () {
        if (value.isNotEmpty) {
          _onKeyboardButtonPressed(value);
        }
      },
      child: Container(
        width: 60.0,
        height: 60.0,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            value,
            style: const TextStyle(fontSize: 24.0),
          ),
        ),
      ),
    );
  }

  Widget buildBackspaceButton() {
    return GestureDetector(
      onTap: () {
        _onBackspacePressed();
      },
      child: Container(
        width: 60.0,
        height: 60.0,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.yellow[700],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Center(
          child: Icon(
            Icons.backspace,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget buildEmptyButton() {
    return Container(
      width: 60.0,
      height: 60.0,
      margin: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
    );
  }

  void _onOtpChanged(int index, String value) {
    setState(() {
      otpCode =
          otpCode.padLeft(index, '0') + value + otpCode.substring(index + 1);
    });
  }

  void _onKeyboardButtonPressed(String value) {
    if (otpCode.length < 7) {
      setState(() {
        otpCode += value;
      });
    }
  }

  void _onBackspacePressed() {
    if (otpCode.isNotEmpty) {
      setState(() {
        otpCode = otpCode.substring(0, otpCode.length - 1);
      });
    }
  }
}
