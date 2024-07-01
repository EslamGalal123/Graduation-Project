import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:diiabest/feature/Register_your_information/cubit/register_patient_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CustomHeightWeight extends StatelessWidget {
  const CustomHeightWeight({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(AppStrings.weight,
                  // Applocalizations.of(context)!.translatetext("weight"),
                  style: CustomTextStyles.lohit500style20),
              ProfileFormFeild(
                label: '',
                mycontroller:
                    BlocProvider.of<RegisterPatientCubit>(context).weight,
                hint: AppStrings.enteryour,
                //  Applocalizations.of(context)!.translatetext("enteryour"),
                prefixIcon: Icons.fitness_center,
              ),
            ],
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                AppStrings.height,
                // Applocalizations.of(context)!.translatetext("height"),
                style: CustomTextStyles.lohit500style20,
              ),
              ProfileFormFeild(
                mycontroller:
                    BlocProvider.of<RegisterPatientCubit>(context).height,
                label: '',
                hint: AppStrings.enteryour,
                //  Applocalizations.of(context)!.translatetext("enteryour"),
                prefixIcon: Icons.height,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileFormFeild extends StatelessWidget {
  const ProfileFormFeild(
      {super.key,
      required this.label,
      required this.hint,
      required this.mycontroller,
      this.prefixIcon,
      this.obscureText});
  final String label;
  final String hint;
  final IconData? prefixIcon;
  final bool? obscureText;
  final TextEditingController mycontroller;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGrey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                if (prefixIcon != null) Icon(prefixIcon),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    obscureText: obscureText ?? false,
                    controller: mycontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "this field is required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: label,
                      hintText: hint,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
