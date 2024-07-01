import 'package:diiabest/core/services/url_lancher.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomSocialIcons extends StatelessWidget {
  const CustomSocialIcons({super.key, required this.image, required this.url});
  final String image;
  final String url;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async{
await  launch(url: url);
      },
      child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(5),
          width: 50,
          height: 50,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Colors.black),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Image.asset(image)),
    );
  }
}
