import 'package:diiabest/feature/doctor/presentation/widgets/image_of_doctor.dart';
import 'package:flutter/material.dart';

class EditProfileDoctorForm extends StatelessWidget {
  const EditProfileDoctorForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: const ImagePickerView()),
      ],
    );
  }
}