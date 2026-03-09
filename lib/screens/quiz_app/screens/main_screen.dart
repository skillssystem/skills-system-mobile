import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as img;

import '../modle/questions.dart';
import 'question_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Color> colors = [
    Color(0xFF87E324),
    Color(0xFFF5D93B),
    Color(0xFF98D5F5),
    Color(0xFFF77D38),
    Color(0xFFCAED95),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 350,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(150),
                          bottomRight: Radius.circular(150)),
                      child: Image.asset(
                        "assets/quiz_app/home_screen.png",
                        height: 350,
                        fit: BoxFit.fitHeight,
                        // specify your SVG asset and size here
                      ),
                    ),
                  ),
                  const Positioned(
                      bottom: 150,
                      child: Column(
                        children: [
                          Text(
                            "Build Your Skills",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 25),
                          ),
                          Text(
                            "Play And Learn",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 25),
                          ),
                        ],
                      )),
                  Positioned(
                      bottom: 30,
                      child:
                          Image.asset("assets/quiz_app/main_screen_star.png")),
                  Positioned(
                      top: 30,
                      left: -10,
                      child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            "assets/quiz_app/back_button.png",
                            height: 100,
                          ))),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Image.asset('assets/quiz_app/${progressLevel}_level.png'),
            ),
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Game For Track 1",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 8),
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: 170,
                width: 1000,
                child: Stack(
                  children: [
                    Container(
                        height: 170,
                        width: 1000,
                        color: Colors.white,
                        child: Image.asset('assets/quiz_app/game_track.png')),
                    Row(
                      children: List.generate(
                          5,
                          (index) => Expanded(
                              child: InkWell(
                                  onTap: () async {
                                    if (gameLevelStatus[index]) {
                                      await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  QuestionScreen(
                                                    gameIndex: index,
                                                  )));
                                      setState(() {});
                                    }
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: gameLevelStatus[index]
                                            ? Colors.transparent
                                            : Colors.grey[100]!
                                                .withOpacity(.5)),
                                  )))),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Session Best Time",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 8),
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: 170,
                width: 1000,
                child: Stack(
                  children: [
                    Container(
                      height: 170,
                      width: 1000,
                      color: Colors.white,
                    ),
                    Row(
                      children: List.generate(
                          5,
                          (index) => Expanded(
                                  child: Container(
                                height: 170,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: colors[index],
                                ),
                                child: Center(
                                  child: Text(
                                    formatDuration(gamesTime[index]),
                                    style: const TextStyle(
                                        color: Colors.blue,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ))),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
                child: Image.asset(
              "assets/quiz_app/logo.png",
              width: 250,
            )),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
