import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:circular_countdown_timer/countdown_text_format.dart';
import 'package:flutter/material.dart';

import '../modle/questions.dart';
import '../widget/option.dart';
import 'congratulation_screen.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key, required this.gameIndex});
  final int gameIndex;
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  CountDownController controller = CountDownController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    questions = pickRandomQuestions(
        allQuestions[widget.gameIndex].length, widget.gameIndex);
    controller.restart(duration: questionTime);
    questionRecord = [];
    totalTime = 0;
  }

  Question? question;

  List<Question> questions = [];

  int questionNo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 310,
              width: double.infinity,
              child: Stack(
                clipBehavior: Clip.none, // This is what you need.
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: -60,
                    left: 0,
                    right: 0,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      child: Image.asset(
                        "assets/quiz_app/main_screen_illastration.png",
                        height: 370,
                        fit: BoxFit.fill,
                        // specify your SVG asset and size here
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -60,
                    child: Stack(
                      children: [
                        Material(
                          elevation: 3,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 150,
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                            top: 15,
                            left: 15,
                            child: countWriteQuestion(Colors.lightGreenAccent,
                                countQuestionAnswer(true).toString())),
                        Positioned(
                            top: 15,
                            right: 15,
                            child: countWriteQuestion(Colors.redAccent,
                                countQuestionAnswer(false).toString())),
                        questions[questionNo]
                                .questionText
                                .toLowerCase()
                                .contains("what skill is this?")
                            ? Positioned(
                                bottom: 20,
                                left: 10,
                                right: 10,
                                child: SizedBox(
                                    width: 250,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Q${questionNo + 1}: ${questions[questionNo].questionText.split("(")[0]}",
                                          maxLines: 10,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Center(
                                            child: Image.asset(
                                          "assets/quiz_app/${questions[questionNo].questionText.split("(")[1].toString().toLowerCase().replaceAll(")", "")}.png",
                                          height: 50,
                                        ))
                                      ],
                                    )))
                            : Positioned(
                                bottom: 20,
                                left: 10,
                                right: 10,
                                child: SizedBox(
                                  width: 250,
                                  child: Text(
                                    "Q${questionNo + 1}: ${questions[questionNo].questionText.replaceAll("(", " ").replaceAll(")", " ")}",
                                    maxLines: 10,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              )
                      ],
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
                  Positioned(bottom: 50, child: countdown())
                ],
              ),
            ),
            const SizedBox(height: 100),
            Column(
              children: questions[questionNo].isImage
                  ? [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                3,
                                (index) => GridItem(
                                    image:
                                        "assets/quiz_app/${questions[questionNo].options[index]}.png",
                                    index: index))),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                2,
                                (index) => GridItem(
                                    image:
                                        "assets/quiz_app/${questions[questionNo].options[index + 3]}.png",
                                    index: index + 3))),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              4,
                              (index) => GridItem(
                                  image:
                                      "assets/quiz_app/${questions[questionNo].options[index + 5]}.png",
                                  index: index + 5))),
                    ]
                  : List.generate(
                      questions[questionNo].options.length,
                      (index) => InkWell(
                          onTap: () {
                            onTap(index);
                          },
                          child: Option(
                              isTap: false,
                              title:
                                  "${questions[questionNo].options[index]}"))),
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

  onTap(index) {
    if (questionNo == allQuestions[widget.gameIndex].length - 1) {
      if (questions[questionNo].correctAnswerIndex == index) {
        questionRecord.add(true);
      } else {
        questionRecord.add(false);
      }
      if (countQuestionAnswer(true) == allQuestions[widget.gameIndex].length) {
        gameLevelStatus[widget.gameIndex + 1] = true;
        progressLevel++;
      }
      gamesTime[widget.gameIndex] = int.parse(controller.getTime()!);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => CongratulationScreen(
                    track: widget.gameIndex,
                  )));
    } else {
      if (questions[questionNo].correctAnswerIndex == index) {
        questionRecord.add(true);
      } else {
        questionRecord.add(false);
      }
      questionNo++;
      setState(() {});
    }
  }

  Widget countWriteQuestion(color, no) {
    return Row(
      children: [
        Text(
          no.toString(),
          style: TextStyle(
              color: color, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 5,
        ),
        Card(
          color: color,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3),
            child: Container(),
          ),
        ),
      ],
    );
  }

  Widget countdown() {
    return CircularCountDownTimer(
      duration: questionTime,
      initialDuration: 0,
      controller: controller,
      width: 70,
      height: 70,
      ringColor: Colors.grey[300]!,
      ringGradient: null,
      fillColor: Colors.blue,
      fillGradient: null,
      backgroundColor: Colors.grey[200],
      backgroundGradient: null,
      strokeWidth: 5.0,
      strokeCap: StrokeCap.round,
      textStyle: const TextStyle(
          fontSize: 25.0, color: Colors.lightBlue, fontWeight: FontWeight.bold),
      textFormat: CountdownTextFormat.SS,
      isReverse: false,
      isReverseAnimation: true,
      isTimerTextShown: true,
      autoStart: true,
      onStart: () {
        debugPrint('Countdown Started');
      },
      onComplete: () {
        if (countQuestionAnswer(true) ==
            allQuestions[widget.gameIndex].length) {
          progressLevel++;
          if (widget.gameIndex == gameLevelStatus.length - 1) {
            gameLevelStatus[widget.gameIndex] = true;
            gameLevelStatus[widget.gameIndex + 1] = true;
          } else {
            gameLevelStatus[widget.gameIndex] = true;
          }
        }
        gamesTime[widget.gameIndex] = int.parse(controller.getTime()!);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => CongratulationScreen(
                      track: widget.gameIndex,
                    )));
      },
      onChange: (String timeStamp) {
        debugPrint('Countdown Changed $timeStamp');
      },
      timeFormatterFunction: (defaultFormatterFunction, duration) {
        return Function.apply(defaultFormatterFunction, [duration]);
      },
    );
  }

  Widget GridItem({image, index}) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onTap(index);
        },
        child: Container(
            margin: const EdgeInsets.all(8),
            height: 80,
            width: 80,
            child: Image.asset(image)),
      ),
    );
  }
}
