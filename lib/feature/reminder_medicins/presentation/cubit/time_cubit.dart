import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
part 'time_state.dart';

class TimeCubit extends Cubit<TimeState> {
  TimeCubit() : super(TimeInitial());
  TimeOfDay timeOfDay = TimeOfDay.now();
  String? time;
  int? notificationHour;
  int? notificationMinute;
  void showTimerPicker({required BuildContext context}) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      timeOfDay = value!;
      notificationHour = timeOfDay.hour;
      notificationMinute = timeOfDay.minute;
      print("notification hour --->$notificationHour");
      print("notification minute --->$notificationMinute");
      time = timeOfDay.format(context);
      emit(SuccessShowTimerPicker(time: time, notificationHour: notificationHour, notificationMinute: notificationMinute));
    });
  }
}
