import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/feature/Register_your_information/cubit/register_patient_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CustomMaritalState extends StatefulWidget {
  const CustomMaritalState({super.key});

  @override
  State<CustomMaritalState> createState() => _CustomMaritalStateState();
}

class _CustomMaritalStateState extends State<CustomMaritalState> {
  String maritalStatus = 'Single';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          AppStrings.maritalStatus,
          // Applocalizations.of(context)!.translatetext("maritalStatus"),
          style: CustomTextStyles.lohit500style20,
        ),
        DropdownButton<String>(
          value: maritalStatus,
          onChanged: (String? newValue) {
            BlocProvider.of<RegisterPatientCubit>(context).status = newValue!;
            setState(() {
              maritalStatus = newValue;
            });
          },
          items: <String>[
            AppStrings.single,
            AppStrings.married,
            AppStrings.divorced,
            AppStrings.widowed
            //  Applocalizations.of(context)!.translatetext("single"),
            //  Applocalizations.of(context)!.translatetext("married"),
            //  Applocalizations.of(context)!.translatetext("divorced"),
            //  Applocalizations.of(context)!.translatetext("widowed"),
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: Theme.of(context).textTheme.bodySmall),
            );
          }).toList(),
        ),
      ],
    );
  }
}
