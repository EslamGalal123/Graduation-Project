part of 'time_cubit.dart';

@immutable
abstract class TimeState {}

class TimeInitial extends TimeState {}
class SuccessShowTimerPicker extends TimeState {
  String? time;
  int? notificationHour;
  int? notificationMinute;
  SuccessShowTimerPicker({required this.time,required this.notificationHour, required this.notificationMinute});
}
