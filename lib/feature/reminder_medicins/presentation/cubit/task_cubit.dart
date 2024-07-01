


// class TaskCubit extends Cubit<TaskState> {
//   TaskCubit() : super(TaskInitial());
//   DateTime currentDate = DateTime.now();
//   DateTime selctedDate = DateTime.now();
//   String startTime = DateFormat('hh:mm a').format(DateTime.now());
//   String endTime = DateFormat('hh:mm a')
//       .format(DateTime.now().add(const Duration(minutes: 45)));
//   int currentIndex = 0;
//   TextEditingController titleController = TextEditingController();

//   TextEditingController noteController = TextEditingController();
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   //get Date From User
//   void getDate(context) async {
//     emit(GetDateLoadingState());
//     DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2025),
//       // initialDatePickerMode: DatePickerMode.day,
//       // initialEntryMode: DatePickerEntryMode.inputOnly,
//     );

//     if (pickedDate != null) {
//       currentDate = pickedDate;
//       emit(GetDateSucessState());
//     } else {
      
//       emit(GetDateErrorState());
//     }
//   }

//   late TimeOfDay schduledTime;
//   void getStartTime(context) async {
//     emit(GetStartTimeLoadingState());

//     TimeOfDay? pickedStartTime = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.fromDateTime(DateTime.now()),
//     );
//     if (pickedStartTime != null) {
//       startTime = pickedStartTime.format(context);
//       schduledTime = pickedStartTime;
//       emit(GetStartTimeSucessState());
//     } else {
      
//       schduledTime =
//           TimeOfDay(hour: currentDate.hour, minute: currentDate.minute);
//       emit(GetStartTimeErrorState());
//     }
//   }

//   void getEndTime(context) async {
//     emit(GetEndTimeLoadingState());

//     TimeOfDay? pickedEndTime = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.fromDateTime(DateTime.now()),
//     );
//     if (pickedEndTime != null) {
//       endTime = pickedEndTime.format(context);
//       emit(GetEndTimeSucessState());
//     } else {
      
//       emit(GetEndTimeErrorState());
//     }
//   }

//   Color getColor(index) {
//     switch (index) {
//       case 0:
//         return AppColors.red;
//       case 1:
//         return AppColors.green;
//       case 2:
//         return AppColors.blueGrey;
//       case 3:
//         return AppColors.blue;
//       case 4:
//         return AppColors.orange;
//       case 5:
//         return AppColors.purple;
//       default:
//         return AppColors.grey;
//     }
//   }

//   void changeCheckMarkIndex(index) {
//     currentIndex = index;
//     emit(ChangeCheckMarkIndexState());
//   }

//   void getSelectedDate(date) {
//     emit(GetSelectedDateLoadingState());
//     selctedDate = date;

//     emit(GetSelectedDateSucessState());
//     getTasks();
//   }

//   List<ReminderModel> tasksList = [];
//   void insertTask() async {
//     emit(InsertTaskLoadingState());

//     try {
//       await getIt<SqfliteHelper>().insertToDB(
//         ReminderModel(
//           date: DateFormat.yMd().format(currentDate),
//           title: titleController.text,
//           note: noteController.text,
//           startTime: startTime,
//           endTime: endTime,
//           isCompleted: 0,
//           color: currentIndex,
//         ),
//       );
//       LocalNotificationService.showSchduledNotification(
//         curretDate: currentDate,
//         schduledTime:schduledTime,
//         taskModel: ReminderModel(
//           date: DateFormat.yMd().format(currentDate),
//           title: titleController.text,
//           note: noteController.text,
//           startTime: startTime,
//           endTime: endTime,
//           isCompleted: 0,
//           color: currentIndex,
//         ),
//       );
//       //! to make screen wait 1 second
//       //  await  Future.delayed(const Duration(seconds: 3));
//       //   tasksList.add(TaskModel(
//       //     id: '1',
//       //     date: DateFormat.yMd().format(currentDate),
//       //     title: titleController.text,
//       //     note: noteController.text,
//       //     startTime: startTime,
//       //     endTime: endTime,
//       //     isCompleted: false,
//       //     color: currentIndex,
//       //   ));
//       titleController.clear();
//       noteController.clear();
//       emit(InsertTaskSucessState());
//       getTasks();
//     } catch (e) {
//       emit(InsertTaskErrorState());
//     }
//   }

// //!get Tasks
//   void getTasks() async {
//     emit(GetDateLoadingState());
//     await getIt<SqfliteHelper>().getFromDB().then((value) {
//       tasksList = value
//           .map((e) => ReminderModel.fromJson(e))
//           .toList()
//           .where(
//             (element) => element.date == DateFormat.yMd().format(selctedDate),
//           )
//           .toList();
//       emit(GetDateSucessState());
//     }).catchError((e) {
     
//       emit(GetDateErrorState());
//     });
//   }

//   //update Task
//   void updateTask(id) async {
//     emit(UpdateTaskLoadingState());

//     await getIt<SqfliteHelper>().updatedDB(id).then((value) {
//       emit(UpdateTaskSucessState());
//       getTasks();
//     }).catchError((e) {
      
//       emit(UpdateTaskErrorState());
//     });
//   }

// //delete task
//   void deleteTask(id) async {
//     emit(DeleteTaskLoadingState());

//     await getIt<SqfliteHelper>().deleteFromDB(id).then((value) {
//       emit(DeleteTaskSucessState());
//       getTasks();
//     }).catchError((e) {
//       print(e.toString());
//       emit(DeleteTaskErrorState());
//     });
//   }

//   // bool isDark = false;
//   // void changeTheme() async {
//   //   isDark = !isDark;
//   //   await getIt<CacheHelper>().saveData(key: 'isDark', value: isDark);
//   //   emit(ChangeThemeState());
//   // }

//   // void getTheme() async {
//   //   isDark = await getIt<CacheHelper>().getData(key: 'isDark');
//   //   emit(GetThemeState());
//   // }
// }
