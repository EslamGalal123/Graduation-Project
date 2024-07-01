import 'package:cached_network_image/cached_network_image.dart';
import 'package:diiabest/core/Utils/App-Assets.dart';
import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Widgets/custom_btn_profile.dart';
import 'package:diiabest/feature/auth/Presentation/Views/sign_in.dart';
import 'package:diiabest/feature/profile/Presentation/view/edit_profile_view.dart';
import 'package:diiabest/feature/profile/Presentation/widget/custom_profile_form.dart';
import 'package:diiabest/feature/profile/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getPatientData(),
      child: Scaffold(
        appBar: AppBar(
          leading: const SizedBox(),
          title: const Text(AppStrings.patient),
          centerTitle: true,
          actions: const [
            SingOutButton(),
          ],
        ),
        body: const ProfileBody(),
      ),
    );
  }
}

class SingOutButton extends StatelessWidget {
  const SingOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: const Icon(Icons.logout),
      onPressed: () {
        BlocProvider.of<ProfileCubit>(context).signOut();
      },
    );
  }
}

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is GetProfileSuccess) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(children: [
                BlocListener<ProfileCubit, ProfileState>(
                  listener: (context, state) {
                    if (state is SignOut) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInView(),
                          ),
                          (route) => false);
                    }
                    if (state is SignOut) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInView(),
                          ),
                          (route) => false);
                    }
                  },
                  child: Column(children: [
                    const SizedBox(
                      height: 30,
                    ),
                    CachedNetworkImage(
                      imageUrl: '',
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, error, stackTrace) => Image.asset(
                        Assets.imagesImageProfilDoctor,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width * 0.35,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(state.user.name,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomProfileForm(
                  user: state.user,
                ),
                const SizedBox(
                  height: 35,
                ),
                CustomBtnProfile(
                  text: AppStrings.editprofile,
                  //  Applocalizations.of(context)!.translatetext("editprofile"),
                  onPressed: () {
                    // customNavigate(context, "/editprofile");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfileView()));
                  },
                ),
              ]),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
