import 'package:cached_network_image/cached_network_image.dart';
import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Widgets/custom_btn_profile.dart';
import 'package:diiabest/feature/auth/auth_cubit/auth_cubit.dart';
import 'package:diiabest/feature/doctor/cubit/doctor_cubit.dart';
import 'package:diiabest/feature/doctor/presentation/views/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileDoctorForm extends StatelessWidget {
  const ProfileDoctorForm({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return BlocBuilder<DoctorCubit, DoctorState>(
      builder: (context, state) {
        if (state is GetProfileSuccess) {
          return Column(
            children: [
              SizedBox(
                height: height * 0.3,
                child: CachedNetworkImage(
                  imageUrl: BlocProvider.of<AuthCubit>(context)
                      .currentUser
                      .profileImage,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, error, stackTrace) =>
                      const Center(child: CircularProgressIndicator()),
                ),
              ),
              Row(
                children: [
                  Text(
                    "Name:  ",
                    // Applocalizations.of(context)!.translatetext("Name  "),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Text(
                    state.doctor.fullName,
                    // Applocalizations.of(context)!.translatetext("eslamgalal"),
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  Text(
                    'specialization:',
                    // Applocalizations.of(context)!.translatetext("specialization"),
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.clip,
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Text(
                    state.doctor.specialization,
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  Text(
                    AppStrings.phoneNumbe,
                    // Applocalizations.of(context)!.translatetext("phoneNumbe"),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Text(
                    state.doctor.phoneNumber,
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  Text(
                    "Address:",
                    // Applocalizations.of(context)!.translatetext("citystreetblocknumber"),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Text(
                    state.doctor.clinicAddress,
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 1,
                  )
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  Text(
                    "WhatsApp",
                    // Applocalizations.of(context)!.translatetext("Link Of WhatsApp"),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Expanded(
                    child: Text(
                      state.doctor.whatsappLink,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 1,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  Text(
                    "Facebook",
                    //  Applocalizations.of(context)!.translatetext("Link Of Facebook"),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Expanded(
                    child: Text(
                      state.doctor.facebookLink,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 1,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.09,
              ),
              CustomBtnProfile(
                text: AppStrings.editprofile,
                // Applocalizations.of(context)!.translatetext("editprofile"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditProfileDoctor()));
                  // customNavigate(context, "/EditProfileDoctor");
                },
              )
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
