import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.onPressed,
      required this.backGroundColor,
        required this.image,
        required this.text,});
  final Color backGroundColor;
  final VoidCallback onPressed;
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Image.asset(image,width: MediaQuery.of(context).size.width * .70,),
    );
  }
}
