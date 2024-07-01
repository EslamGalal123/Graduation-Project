import 'package:diiabest/feature/pregnancy/presentation/widget/custom_pregnancy_form.dart';
import 'package:flutter/material.dart';
class PregnancyView extends StatelessWidget {
  const PregnancyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomScrollView(
                  physics:  BouncingScrollPhysics(),
                  slivers: [
                   SliverToBoxAdapter( child:CustomPregnancyForm()),
                    
                    
                    ])),
        )) ;
  }
}