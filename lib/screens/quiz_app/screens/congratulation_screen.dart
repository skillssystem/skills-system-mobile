import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:pico_app/screens/quiz_app/modle/questions.dart';
import 'package:pico_app/screens/quiz_app/screens/question_screen.dart';

class CongratulationScreen extends StatefulWidget {
  CongratulationScreen({Key? key, required this.track});
  final int track;

  @override
  State<CongratulationScreen> createState() => _CongratulationScreenState();
}

class _CongratulationScreenState extends State<CongratulationScreen> {
  ConfettiController controller = ConfettiController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (countQuestionAnswer(true) == allQuestions[widget.track].length) {
      controller.play();
      Future.delayed(Duration(seconds: 3)).then((value) => controller.stop());
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 450,
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        "assets/quiz_app/congratulation.png",
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        top: 130,
                        child: Text(
                          countQuestionAnswer(true) ==
                                  allQuestions[widget.track].length
                              ? "Congratulation"
                              : "Almost Done",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Positioned(
                        top: 160,
                        child: Text(
                          countQuestionAnswer(true) ==
                                  allQuestions[widget.track].length
                              ? "You Have Successfully Completed Game ${widget.track + 1}."
                              : "Please try again Game ${widget.track + 1}.",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
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
                      Positioned(
                          bottom: 140,
                          child: Image.asset(
                            "assets/quiz_app/star_badge.png",
                            height: 100,
                          )),
                      Positioned(
                          bottom: 30,
                          child: Image.asset(
                            "assets/quiz_app/game_${widget.track + 1}.png",
                            height: 100,
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QuestionScreen(
                                          gameIndex: widget.track)));
                            },
                            child: Text(
                              "Game ${widget.track + 1} Restart",
                              style: TextStyle(fontSize: 16),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Back to Track Builder",
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                widget.track <= 3
                    ? SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QuestionScreen(
                                        gameIndex: widget.track + 1)));
                          },
                          child: const Text(
                            "Next Game",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),
                        ),
                      )
                    : SizedBox(),
                const SizedBox(
                  height: 30,
                ),
                Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 210,
                    width: 260,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Total Right Answers    ${countQuestionAnswer(true)}/${allQuestions[widget.track].length}",
                          style: const TextStyle(
                              color: Color(0xFF1DA6D7),
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 125,
                          width: 125,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10, color: Colors.yellowAccent),
                              color: const Color(0xFFD5DFAD)),
                          child: Center(
                              child: Text(
                            formatDuration(
                              gamesTime[widget.track],
                            ),
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          )),
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
        ),
        ConfettiWidget(
          confettiController: controller,
          blastDirection: -pi / 2,
          colors: const [Colors.blue, Colors.yellow],
          gravity: 0.01,
          maxBlastForce: 50,
          emissionFrequency: 0.1,
        ),
      ],
    );
  }
}
