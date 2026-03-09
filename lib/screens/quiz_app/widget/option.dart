import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  const Option({Key? key, required this.isTap,required this.title});
  final bool isTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF1DA6D7)),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Expanded(
               child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
             ),
            CircleAvatar(
              radius: 10,
              backgroundColor: isTap ? const Color(0xFF1DA6D7) : Colors.grey[300],
              child: Center(
                child: Icon(
                  Icons.check,
                  color: isTap ? Colors.white : Colors.transparent,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
