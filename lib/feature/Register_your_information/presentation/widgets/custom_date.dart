import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:diiabest/feature/Register_your_information/cubit/register_patient_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class DateButton extends StatefulWidget {
  const DateButton({super.key});

  @override
  _DateButtonState createState() => _DateButtonState();
}

class _DateButtonState extends State<DateButton> {
  late DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1960),
      lastDate: DateTime(2030),
    ))!;
    if (picked != _selectedDate) {
      var age = DateTime.now().year - picked.year ;
      // ignore: use_build_context_synchronously
      BlocProvider.of<RegisterPatientCubit>(context).age = age.toString();
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          AppStrings.date,
          // Applocalizations.of(context)!.translatetext("date"),
          style: CustomTextStyles.lohit500style20,
        ),
        Container(
          width: 140,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ElevatedButton(
            onPressed: () => _selectDate(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: AppColors.black1,
            ),
            child: Text(
              ' ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
      ],
    );
  }
}
