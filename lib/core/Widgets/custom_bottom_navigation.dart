import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:diiabest/feature/Home/presentatio/views/home_views.dart';
import 'package:diiabest/feature/contact_us/Presentation/views/contact_us.dart';
import 'package:diiabest/feature/doctor/presentation/views/profile_doctor.dart';
import 'package:diiabest/feature/doctors_patient/Presentation/view/doctor_patient.dart';
import 'package:diiabest/feature/profile/Presentation/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/auth/auth_cubit/auth_cubit.dart';

class CustomBtnNavigation extends StatefulWidget {
  const CustomBtnNavigation({super.key});

  @override
  State<CustomBtnNavigation> createState() => _CustomBtnNavigationState();
}

class _CustomBtnNavigationState extends State<CustomBtnNavigation> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List widgetPages = [
      const HomeViews(),
      const DoctorPatientView(),
      // const MyWatchView(),
      const ContactUsView(),
      BlocProvider.of<AuthCubit>(context).currentUser.role == "Doctor"
          ? const ProfileDoctorView()
          : const ProfileView(),
    ];
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        elevation: 0,
        selectedItemColor: AppColors.primarycolor,
        unselectedItemColor: AppColors.black1,
        iconSize: 35,
        selectedFontSize: 20,
        unselectedFontSize: 20,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"
              // Applocalizations.of(context)!.translatetext("Home"),
              ),
          BottomNavigationBarItem(
              icon: Icon(Icons.medical_services), label: "Doctor"

              //  Applocalizations.of(context)!.translatetext("doctor"),
              ),
          BottomNavigationBarItem(icon: Icon(Icons.watch), label: "Diabest"
              //  Applocalizations.of(context)!.translatetext("Diabest"),
              ),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_phone_sharp), label: "Contact Us"
              // Applocalizations.of(context)!.translatetext("Contact Us"),
              ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"
              // Applocalizations.of(context)!.translatetext("Profile"),
              ),
        ],
      ),
      body: widgetPages[selectedIndex],
    );
  }
}