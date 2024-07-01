import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:diiabest/core/Widgets/custom_btn.dart';
import 'package:diiabest/core/Widgets/custom_text_field.dart';
import 'package:diiabest/feature/doctor/cubit/doctor_cubit.dart';
import 'package:diiabest/feature/doctor/presentation/views/profile_doctor.dart';
import 'package:diiabest/feature/doctor/presentation/widgets/checked_container.dart';
import 'package:diiabest/feature/doctor/presentation/widgets/doctor_adresses.dart';
import 'package:diiabest/feature/doctor/presentation/widgets/time_work.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: must_be_immutable
class DoctorView extends StatelessWidget {
  const DoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorCubit(),
      child: const Scaffold(
        body: DoctorViewBody(),
      ),
    );
  }
}

class DoctorViewBody extends StatelessWidget {
  const DoctorViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Form(
      key: BlocProvider.of<DoctorCubit>(context).formKey,
      child: BlocListener<DoctorCubit, DoctorState>(
        listener: (context, state) {
          if (state is RegisterDoctorSuccess) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileDoctorView(),
            
              ),
              (route) => false,
            );
          } else if (state is RegisterDoctorFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMessage),
            ));
          } else if (state is GetProfileFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMessage),
            ));
          }
        },
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                        child: SizedBox(
                      height: height * 0.04,
                    )),
                    SliverToBoxAdapter(
                        child: Text(
                      AppStrings.registernow,
                      // Applocalizations.of(context)!.translatetext("registernow"),
                      style: CustomTextStyles.lohit500style24.copyWith(
                          fontWeight: FontWeight.w700, color: AppColors.black2),
                    )),
                    SliverToBoxAdapter(
                        child: SizedBox(
                      height: height * 0.02,
                    )),
                    SliverToBoxAdapter(
                        child: DoctorAdress(
                      text: AppStrings.specialization,
                      // Applocalizations.of(context)!.translatetext("specialization"),
                    )),
                    SliverToBoxAdapter(
                        child: SizedBox(
                      height: height * 0.01,
                    )),
                    const SliverToBoxAdapter(child: CheckedContainer()),
                    SliverToBoxAdapter(
                        child: SizedBox(
                      height: height * 0.01,
                    )),
                    SliverToBoxAdapter(
                        child: DoctorAdress(
                      text: AppStrings.clinicaddress,
                      //  Applocalizations.of(context)!.translatetext("clinicaddress"),
                    )),
                    SliverToBoxAdapter(
                        child: SizedBox(
                      height: height * 0.01,
                    )),
                    SliverToBoxAdapter(
                        child: CustomTextFormField(
                      mycontroller: BlocProvider.of<DoctorCubit>(context)
                          .citystreetblocknumber,
                      labelText: AppStrings.citystreetblocknumber,
                      //  Applocalizations.of(context)!.translatetext("citystreetblocknumber"),
                      prefixIcon: const Icon(Icons.location_city_rounded),
                    )),
                    SliverToBoxAdapter(
                        child: CustomTextFormField(
                      mycontroller:
                          BlocProvider.of<DoctorCubit>(context).phoneNumbe,
                      labelText: AppStrings.phoneNumbe,
                      //  Applocalizations.of(context)!.translatetext("phoneNumbe"),
                      prefixIcon: const Icon(Icons.phone),
                    )),
                    SliverToBoxAdapter(
                        child: CustomTextFormField(
                      mycontroller:
                          BlocProvider.of<DoctorCubit>(context).facebook,
                      labelText: "Link Of Facebook",
                      //  Applocalizations.of(context)!.translatetext("Link Of Facebook"),
                      prefixIcon: const Icon(Icons.facebook),
                    )),
                    SliverToBoxAdapter(
                        child: CustomTextFormField(
                      mycontroller:
                          BlocProvider.of<DoctorCubit>(context).whatsApp,
                      labelText: "Link Of WhatsApp",
                      //  Applocalizations.of(context)!.translatetext("Link Of WhatsApp"),
                      prefixIcon: const Icon(Icons.chat),
                    )),
                    SliverToBoxAdapter(
                        child: SizedBox(
                      height: height * 0.02,
                    )),
                    SliverToBoxAdapter(
                        child: Row(
                      children: [
                        const Icon(Icons.punch_clock),
                        DoctorAdress(
                          text: AppStrings.timework,
                          // Applocalizations.of(context)!.translatetext("timework"),
                        )
                      ],
                    )),
                    SliverToBoxAdapter(
                        child: SizedBox(
                      height: height * 0.01,
                    )),
                    SliverToBoxAdapter(
                      child: Row(
                        children: [
                          const TimeWork(
                            date: AppStrings.start,
                            isStartTime: true,
                            // Applocalizations.of(context)!.translatetext("start")
                          ),
                          SizedBox(
                            width: width * 0.2,
                          ),
                          const TimeWork(
                            date: AppStrings.end,
                            isStartTime: false,
                            // Applocalizations.of(context)!.translatetext("end")
                          ),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                        child: SizedBox(
                      height: height * 0.06,
                    )),
                    SliverToBoxAdapter(
                        child: CustomBtn(
                      text: AppStrings.saveprofile,
                      // Applocalizations.of(context)!.translatetext("saveprofile"),
                      onPressed: () {
                        var formKey =
                            BlocProvider.of<DoctorCubit>(context).formKey;
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<DoctorCubit>(context)
                              .registerDoctor();
                        }

                        // customNavigate(context, "/ProfileDoctorView");
                      },
                    )),
                  ])),
        ),
      ),
    );
  }
}
