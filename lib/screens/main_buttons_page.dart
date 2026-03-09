import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pico_app/colors.dart';
import 'package:pico_app/main.dart';
import 'package:pico_app/screens/checklist/check_list.dart';
import 'package:pico_app/screens/poster_skills/poster_skills.dart';
import 'package:pico_app/screens/widget.dart';

import 'quiz_app/screens/main_screen.dart';

class MainButtonPage extends StatefulWidget {
  const MainButtonPage({Key? key});

  @override
  State<MainButtonPage> createState() => _MainButtonPageState();
}

class _MainButtonPageState extends State<MainButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Image.asset("assets/images/logo1.png"),
              const SizedBox(
                height: 30,
              ),
              // CustomButton(
              //   text: "Track Builder\nQuiz Game\n(Coming Soon)",
              //   image: "assets/poster/button3.png",
              //   backGroundColor: const Color(0xFFB2D234),
              //   onPressed: () {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => QuizApp()));
              //   },
              // ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QuizApp()));
                },
                child: Container(
                  height: Get.height * 0.35,
                  width: Get.width * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(49),
                    image: const DecorationImage(
                        image: AssetImage(
                          'assets/poster/BUTTON31.jpg',
                        ),
                        fit: BoxFit.cover),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: Get.height * 0.12),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Track Builder\nQuiz Game',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xff01315E),
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // child: ClipRRect(
                  //   borderRadius: BorderRadius.circular(50),
                  //   child: Image.asset(
                  //     'assets/poster/BUTTON31.jpg',
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              CustomButton(
                text: "Skills Posters",
                image: "assets/poster/button1.png",
                backGroundColor: const Color(0xFF00285A),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(title: "")));
                },
              ),
              const SizedBox(
                height: 24,
              ),
              CustomButton(
                image: "assets/poster/button2.png",
                text: "Skills Coaching Checklist",
                backGroundColor: Color(0xFFBFE6F6),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PosterSkills()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget footer() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
            child: Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 8),
            child: Text(
              " @Copyright 2023, Skills System.",
              style:
                  TextStyle(fontSize: 9, color: Colors.black.withOpacity(.6)),
            ),
          ),
        )),
        SizedBox(
          width: 10,
        ),
        Image.asset(
          "assets/poster/logo.png",
          width: 60,
        )
      ],
    );
  }
}
