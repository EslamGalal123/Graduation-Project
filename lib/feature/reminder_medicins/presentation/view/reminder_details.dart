

import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:diiabest/core/Widgets/custom_btn.dart';
import 'package:diiabest/feature/reminder_medicins/data/add_task_component.dart';
import 'package:diiabest/feature/reminder_medicins/presentation/view/reminder_medicin.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// class ReminderDetails extends StatelessWidget {
//   const ReminderDetails({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         elevation: 0.0,
//         centerTitle: false,
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(Icons.arrow_back_ios_new_outlined)),
//         title: Text(
//           AppStrings.addareminder,
//           style: Theme.of(context).textTheme.bodySmall,
//         ),
//       ),
//       body:  Padding(
//           padding: const EdgeInsets.all(24),
//           child: BlocConsumer<TaskCubit, TaskState>(
//             listener: (context, state) {
//               if (state is InsertTaskSucessState) {
//                 showToast(
//                     message: 'Added Sucessfully', state: ToastStates.success);
//                 Navigator.pop(context);
//               }
//             },
//             builder: (context, state) {
//               final cubit = BlocProvider.of<TaskCubit>(context);
//               return Form(
//                 key: BlocProvider.of<TaskCubit>(context).formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     //! Title
//                     AddReminderComponent(
//                       controller:
//                           BlocProvider.of<TaskCubit>(context).titleController,
//                       tilte: AppStrings.tilte,
//                       hintText: AppStrings.tilteHint,
//                       validator: (val) {
//                         if (val!.isEmpty) {
//                           return AppStrings.tilteErrorMsg;
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 24),
//                     //! Note
//                     AddReminderComponent(
//                       controller:
//                           BlocProvider.of<TaskCubit>(context).noteController,
//                       tilte: AppStrings.reminder,
//                       hintText: AppStrings.reminderhint,
//                       validator: (val) {
//                         if (val!.isEmpty) {
//                           return AppStrings.reminderErrorMsg;
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 24),
//                     //! Date
//                     AddReminderComponent(
//                       tilte: AppStrings.date,
//                       hintText: DateFormat.yMd().format(cubit.currentDate),
//                       suffixIcon: IconButton(
//                         onPressed: () async {
//                           BlocProvider.of<TaskCubit>(context).getDate(context);
//                         },
//                         icon: Icon(
//                           Icons.calendar_month_rounded,
//                           color: AppColors.white,
//                         ),
//                       ),
//                       readOnly: true,
//                     ),
//                     const SizedBox(height: 24),
//                     //! Start - End Time
//                     Row(
//                       children: [
//                         // Start
//                         Expanded(
//                           child: AddReminderComponent(
//                             readOnly: true,
//                             tilte: AppStrings.start,
//                             hintText:
//                                 BlocProvider.of<TaskCubit>(context).startTime,
//                             suffixIcon: IconButton(
//                               onPressed: () async {
//                                 BlocProvider.of<TaskCubit>(context)
//                                     .getStartTime(context);
//                               },
//                               icon: Icon(
//                                 Icons.timer_outlined,
//                                 color: AppColors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 26,
//                         ),
//                         //! end
//                         Expanded(
//                           child: AddReminderComponent(
//                             readOnly: true,
//                             tilte: AppStrings.end,
//                             hintText:
//                                 BlocProvider.of<TaskCubit>(context).endTime,
//                             suffixIcon: IconButton(
//                               onPressed: () async {
//                                 BlocProvider.of<TaskCubit>(context)
//                                     .getEndTime(context);
//                               },
//                               icon: Icon(
//                                 Icons.timer_outlined,
//                                 color: AppColors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 24),

//                     //! add Task Button

//                     const SizedBox(height: 90),

//                     state is InsertTaskLoadingState
//                         ? Center(
//                             child: CircularProgressIndicator(
//                             color: AppColors.primarycolor,
//                           ))
//                         : SizedBox(
//                             height: 48,
//                             width: double.infinity,
//                             child: CustomButton(
//                               text: AppStrings.cerate,
//                               onPressed: () {
//                                 if (BlocProvider.of<TaskCubit>(context)
//                                     .formKey
//                                     .currentState!
//                                     .validate()) {
//                                   BlocProvider.of<TaskCubit>(context)
//                                       .insertTask();
//                                 }
//                               },
//                             ),
//                           )
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
      
//     );
//   }
// }

class ReminderDetailsView extends StatefulWidget {
  const ReminderDetailsView({super.key});

  @override
  State<ReminderDetailsView> createState() => _ReminderDetailsViewState();
}

class _ReminderDetailsViewState extends State<ReminderDetailsView> {
  DateTime currentDate = DateTime.now();
  String timestart = DateFormat('hh:mm a').format(DateTime.now());
int currentindex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        centerTitle: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: Text(
          AppStrings.addareminder,
          style: CustomTextStyles.lohit500style22,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //! Title
            AddReminderComponent(
              tilte: AppStrings.tilte,
              hintText: "Name",
              validator: (val) {
                if (val!.isEmpty) {
                  return AppStrings.tilteErrorMsg;
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            //! Note
            AddReminderComponent(
              tilte: AppStrings.reminder,
              hintText: "Description",
              validator: (val) {
                if (val!.isEmpty) {
                  return AppStrings.reminderErrorMsg;
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            //! Date
            AddReminderComponent(
              tilte: AppStrings.date,
              hintText: DateFormat.yMd().format(currentDate),
              suffixIcon: IconButton(
                onPressed: () async {
                  DateTime? pickeddate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2025));
                  setState(() {
                    if (pickeddate != null) {
                      currentDate = pickeddate;
                    } else {
              
                    }
                  });
                },
                icon: const Icon(
                  Icons.calendar_month_rounded,
                ),
              ),
              readOnly: true,
            ),
            const SizedBox(height: 24),
            Row(children: [
              // Start
              Expanded(
                child: AddReminderComponent(
                  readOnly: true,
                  tilte: AppStrings.start,
                  hintText: DateFormat('hh:mm a').format(DateTime.now()),
                  suffixIcon: IconButton(
                    onPressed: () async {
                      TimeOfDay? pickedtime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(DateTime.now()),
                      );
                      setState(() {
                        if (pickedtime != null) {
                          timestart = pickedtime.format(context);
                        } else {
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.timer_outlined,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 26,
              ),
              const Spacer()
            ]),
          
            
          
            
          const SizedBox(height: 105,),
            //buttn
            SizedBox(
              height: 48,
              width: double.infinity,
              child: CustomBtn(text: AppStrings.cerate,
              color: AppColors.primarycolor,
              onPressed: (){
               Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ReminderMedicinsView()));
              },),
            )
          ]),
        ),
      ),
    );
  }
}
