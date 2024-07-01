import 'dart:io';

import 'package:diiabest/core/Database/cache/cache_helper.dart';
import 'package:diiabest/core/Database/cache/constants.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:diiabest/core/services/service_locator.dart';
import 'package:diiabest/feature/On-Boarding/presentation/views/on-boarding-view.dart';
import 'package:diiabest/feature/Splash2/Presentation/views/Splash2.dart';
import 'package:diiabest/feature/auth/auth_cubit/auth_cubit.dart';
import 'package:diiabest/feature/my_watch/presentation/views/my_watch.dart';
import 'package:diiabest/feature/reminder_medicins/presentation/widget/notification.dart';
import 'package:diiabest/simple_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  await Future.wait([
    LocalNotificationService.init(),
  ]);
  Bloc.observer = SimpleBlocObServer();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final double fontSize = MediaQuery.of(context).devicePixelRatio;
    return BlocProvider(
      create: (context) => AuthCubit()..checkIsLogin(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme: TextTheme(
              titleLarge: TextStyle(
                  fontSize: fontSize * 12,
                  fontWeight: FontWeight.w500,
                  fontFamily: "poppins",
                  color: AppColors.primarycolor),
              titleMedium: TextStyle(
                  fontSize: fontSize * 9,
                  fontWeight: FontWeight.w500,
                  fontFamily: "poppins",
                  color: AppColors.black1),
              titleSmall: TextStyle(
                  fontSize: fontSize * 7,
                  fontWeight: FontWeight.w400,
                  fontFamily: "poppins",
                  color: AppColors.black1),
              bodyMedium: TextStyle(
                  fontSize: fontSize * 8,
                  fontWeight: FontWeight.w500,
                  fontFamily: "poppins",
                  color: AppColors.black1),
              bodySmall: TextStyle(
                  fontSize: fontSize * 6.5,
                  fontWeight: FontWeight.w400,
                  fontFamily: "poppins",
                  color: AppColors.black2),
            ),
            scaffoldBackgroundColor: AppColors.offwhite),
        home:  OnBoardingView(),
      ),
    );
  }
}
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
