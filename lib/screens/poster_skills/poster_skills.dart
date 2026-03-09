import 'dart:typed_data';
import 'dart:ui' as ui;
// import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart'; // NEW
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:pico_app/colors.dart';
import 'package:pico_app/models/poster_skill_model.dart';

class PosterSkills extends StatefulWidget {
  const PosterSkills({
    Key? key,
  }) : super(key: key);

  @override
  State<PosterSkills> createState() => _PosterSkillsState();
}

final GlobalKey<State<StatefulWidget>> annotatedImageKey = GlobalKey();

class _PosterSkillsState extends State<PosterSkills> {
  TextStyle headingStyle = TextStyle(
      color: AppColor().appBlueColors,
      fontWeight: FontWeight.bold,
      fontSize: 19);

  TextStyle normalStyle = TextStyle(
      color: AppColor().appBlueColors,
      fontWeight: FontWeight.normal,
      fontSize: 19);
  bool isOfferPositive = false;
  bool validate = false;
  bool follow = false;
  // Future<Uint8List?> _captureWidget() async {
  //   RenderRepaintBoundary boundary = annotatedImageKey.currentContext
  //       ?.findRenderObject() as RenderRepaintBoundary;
  //   ui.Image image =
  //       await boundary.toImage(pixelRatio: ui.window.devicePixelRatio);
  //   ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  //   return byteData?.buffer.asUint8List();
  // }

  Future<Uint8List?> _captureWidget() async {
    RenderRepaintBoundary boundary = annotatedImageKey.currentContext
        ?.findRenderObject() as RenderRepaintBoundary;
    ui.Image image =
        await boundary.toImage(pixelRatio: ui.window.devicePixelRatio);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData?.buffer.asUint8List();
  }

  Future<void> _saveImageToGallery(Uint8List imageBytes) async {
    final result = await ImageGallerySaverPlus.saveImage(imageBytes);
    print("Image saved to gallery: $result");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        actions: [
          ElevatedButton(
            onPressed: () async {
              await _captureWidget().then((value) {
                Get.to(Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    actions: [
                      TextButton(
                        onPressed: () {
                          _saveImageToGallery(value!).then((value) =>
                              Get.snackbar("Saved",
                                  "Image Has been saved successfully"));
                        },
                        child: const Text(
                          'Save Image',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  body: PhotoView(
                    imageProvider: MemoryImage(value!),
                    backgroundDecoration:
                        const BoxDecoration(color: Colors.white),
                  ),
                ));
              });
            },
            child: Text(
              'Preview Image',
              style: normalStyle,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                RepaintBoundary(
                  key: annotatedImageKey,
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CircleAvatar(
                              radius: 55,
                              backgroundColor: Color(0xFF5a9fcf),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(0.0),
                                  child: Row(
                                    children: [
                                      Text("* ",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      Text(
                                        "Coatching\nStrategies",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      Text(" *",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                                child: Text(
                              "Skills Coaching Strategies Checklist",
                              style: TextStyle(
                                  color: AppColor().appBlueColors,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900),
                            ))
                          ],
                        ),
                        const SizedBox(height: 20),
                        Center(
                            child: Image.asset(
                          "assets/poster/1.png",
                          height: 250,
                        )),
                        const SizedBox(height: 20),
                        Center(
                          child: Text(
                            "Column A – Person A’s Perspectives",
                            style: headingStyle,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: personList.length,
                          itemBuilder: ((context, index) {
                            return Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                        value: personList[index].value,
                                        onChanged: (value) {
                                          setState(() {
                                            personList[index].value = value!;
                                          });
                                        }),
                                    const SizedBox(width: 0),
                                    Expanded(
                                      child: Text(
                                        personList[index].title,
                                        style: TextStyle(
                                          color: index == 3
                                              ? Colors.orange
                                              : AppColor().appBlueColors,
                                          fontWeight: index == 0
                                              ? FontWeight.bold
                                              : FontWeight.w500,
                                          fontSize: 19,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // checkBoxItem(
                                //   personList[index].title,
                                //   normalStyle,
                                //   personList[index].value,
                                //   (value) {
                                //     setState(
                                //         () => personList[index].value = value);
                                //   },
                                //   index == 0 ? true : false,
                                // ),
                                const SizedBox(height: 10),
                              ],
                            );
                          }),
                        ),
                        const SizedBox(height: 10),
                        Center(
                            child: Image.asset(
                          "assets/poster/2.png",
                        )),
                        const SizedBox(height: 10),
                        // Text(
                        //   "(See the Helpful Hints below for ideas about how to adjust coaching strategies.)",
                        //   style: normalStyle,
                        // ),
                        // const SizedBox(height: 20),
                        // Text(
                        //   "Use Validation Strategies throughout the coaching conversation",
                        //   style: headingStyle,
                        // ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Container(
                            color: Colors.yellow.shade100,
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                Text(
                                  'D O N ’ T F O R G E T',
                                  style: headingStyle,
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "assets/images/CoachChecklist_Validation_Icon.png",
                                        height: 70,
                                      ),
                                      const SizedBox(width: 20),
                                      Flexible(
                                        child: Text(
                                          '''Use Validation Strategies throughout the coaching conversation''',
                                          style: headingStyle,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: validationList.length,
                                  itemBuilder: ((context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          checkBoxItem(
                                            validationList[index].title,
                                            normalStyle,
                                            validationList[index].value,
                                            (value) {
                                              setState(() =>
                                                  validationList[index].value =
                                                      value);
                                            },
                                            iscenter: false,
                                          ),
                                          const SizedBox(height: 10),
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/CoachChecklist_QSA_Icon.png",
                                        height: 70,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        "Always: Use the Quick-Step to\nreduce cognitive load",
                                        style: headingStyle,
                                      ),
                                    ],
                                  ),
                                ),
                                // Text(
                                //   "(Adjust strategies to reduce cognitive load)",
                                //   style: normalStyle,
                                // ),
                                // const SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // const SizedBox(width: 20),
                                    Expanded(
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: quickStepList.length,
                                        itemBuilder: ((context, index) {
                                          return Column(
                                            children: [
                                              checkBoxItem(
                                                quickStepList[index].title,
                                                normalStyle,
                                                quickStepList[index].value,
                                                (value) {
                                                  setState(() =>
                                                      quickStepList[index]
                                                          .value = value);
                                                },
                                              ),
                                            ],
                                          );
                                        }),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                        value: isOfferPositive,
                                        onChanged: (value) {
                                          setState(() {
                                            isOfferPositive = value!;
                                          });
                                        }),
                                    Flexible(
                                      child: RichText(
                                        textAlign: TextAlign.left,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  'When possible: Offer positive\nreinforcement for On-Track skill use',
                                              style: headingStyle,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        const SizedBox(height: 20),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/poster/5.png",
                              height: 70,
                            ),
                            const SizedBox(width: 5),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Invite Person A to Continue Getting a Clear Picture",
                                    style: headingStyle,
                                  ),
                                  Text(
                                    '(“Would you like to go through the Clear Picture Do’s together?”)',
                                    style: TextStyle(
                                        color: AppColor().appBlueColors,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: Get.height * 0.43,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: clearPictureList.length,
                            itemBuilder: ((context, index) {
                              return Column(
                                children: [
                                  checkBoxItem(
                                    clearPictureList[index].title,
                                    normalStyle,
                                    clearPictureList[index].value,
                                    (value) {
                                      setState(() => clearPictureList[index]
                                          .value = value);
                                    },
                                  ),
                                ],
                              );
                            }),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: Text(
                            "Assess Person A’s Plan-Goal Alignment",
                            style: TextStyle(
                                color: AppColor().appBlueColors,
                                fontWeight: FontWeight.bold,
                                fontSize: 19),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: assessPersonList.length,
                          itemBuilder: ((context, index) {
                            return Column(
                              children: [
                                checkBoxItem(
                                  assessPersonList[index].title,
                                  normalStyle,
                                  assessPersonList[index].value,
                                  (value) {
                                    setState(() =>
                                        assessPersonList[index].value = value);
                                  },
                                  iscenter: false,
                                ),
                                const SizedBox(height: 10),
                              ],
                            );
                          }),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '(Shift to Column B if plan/goal NOT aligned or reachable)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColor().textBlueColors,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 10),
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: [
                              TextSpan(
                                text: 'Column A: Wrap-Up',
                                style: TextStyle(
                                    color: AppColor().appBlueColors,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ),
                              TextSpan(
                                text:
                                    ' When the Plan-Goal are Aligned and Reachable',
                                style: TextStyle(
                                  color: AppColor().appBlueColors,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ])),
                        // Text(
                        //   "If the Plan-Goal are Aligned",
                        //   style: headingStyle,
                        // ),
                        // const SizedBox(height: 10),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Image.asset(
                        //       "assets/poster/6.png",
                        //       height: 70,
                        //     ),
                        //   ],
                        // ),
                        const SizedBox(height: 10),
                        Center(
                          child: Image.asset(
                            "assets/poster/6.png",
                            height: 70,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: planGoalList.length,
                          itemBuilder: ((context, index) {
                            return Column(
                              children: [
                                SizedBox(
                                  width: Get.width,
                                  child: SizedBox(
                                    child: checkBoxItem(
                                        planGoalList[index].title,
                                        normalStyle,
                                        planGoalList[index].value, (value) {
                                      setState(() =>
                                          planGoalList[index].value = value);
                                    }, iscenter: false),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                        const Divider(
                          thickness: 4,
                          color: Colors.blueAccent,
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: Image.asset(
                            "assets/poster/7.png",
                            height: 200,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: Text(
                            "Column B – The Coach Asks\nto Share Their Perspectives",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColor().appBlueColors,
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: Text(
                            'If the plans/goals are\nnot aligned or reachable',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColor().textBlueColors,
                                fontWeight: FontWeight.bold,
                                fontSize: 19),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Row(
                        //   children: [
                        //     const SizedBox(
                        //       height: 20,
                        //     ),
                        //     Expanded(
                        //       child: Image.asset(
                        //         "assets/poster/8.png",
                        //         height: 70,
                        //       ),
                        //     ),
                        //   ],
                        // ),

                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Image.asset(
                            "assets/poster/8.png",
                            height: 70,
                            // width: 100,
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: columnBList.length,
                          itemBuilder: ((context, index) {
                            return Column(
                              children: [
                                SizedBox(
                                  child: checkBoxItem(
                                    columnBList[index].title,
                                    normalStyle,
                                    columnBList[index].value,
                                    (value) {
                                      setState(() =>
                                          columnBList[index].value = value);
                                    },
                                    iscenter: false,
                                  ),
                                ),
                                const SizedBox(width: 10),
                              ],
                            );
                          }),
                        ),
                        const Divider(
                          thickness: 4,
                          color: Colors.blueAccent,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Image.asset(
                            "assets/poster/9.png",
                            height: 200,
                          ),
                        ),
                        Center(
                          child: Text(
                            "Column C - Collaboration",
                            style: headingStyle,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: columnCList.length,
                          itemBuilder: ((context, index) {
                            return Column(
                              children: [
                                checkBoxItem(
                                  columnCList[index].title,
                                  normalStyle,
                                  columnCList[index].value,
                                  (value) {
                                    setState(
                                        () => columnCList[index].value = value);
                                  },
                                  iscenter: index == 0 ? false : true,
                                ),
                                const SizedBox(height: 10),
                              ],
                            );
                          }),
                        ),
                        const Divider(
                          thickness: 4,
                          color: Colors.blueAccent,
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: Text(
                            "Helpful Hints",
                            style: headingStyle,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: helpList.length,
                          itemBuilder: ((context, index) {
                            return Column(
                              children: [
                                checkBoxItem(
                                  helpList[index].title,
                                  normalStyle,
                                  helpList[index].value,
                                  (value) {
                                    setState(
                                        () => helpList[index].value = value);
                                  },
                                ),
                                const SizedBox(height: 10),
                              ],
                            );
                          }),
                        ),
                        const SizedBox(height: 10),
                        Text("When Person A is not engaged:",
                            style: headingStyle),
                        const SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: increaseList.length,
                          itemBuilder: ((context, index) {
                            return Column(
                              children: [
                                checkBoxItem(
                                  increaseList[index].title,
                                  normalStyle,
                                  increaseList[index].value,
                                  (value) {
                                    setState(() =>
                                        increaseList[index].value = value);
                                  },
                                ),
                                const SizedBox(height: 10),
                              ],
                            );
                          }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            '** When Person A is OVER a Level 3 Feeling',
                            style: TextStyle(
                                fontSize: 19,
                                color: AppColor().textOrangeColors,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        checkBoxItem(
                          'Validate + Orient to All-the-Time Skills',
                          normalStyle,
                          validate,
                          (value) {
                            setState(() => validate = value);
                          },
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Checkbox(
                                value: follow,
                                onChanged: (value) {
                                  setState(() {
                                    follow = value!;
                                  });
                                }),
                            const SizedBox(width: 0),
                            Expanded(
                              child: Text(
                                'Follow de-escalation & safety procedures',
                                style: TextStyle(
                                    color: AppColor().appBlueColors,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 19,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                        // const Divider(
                        //   thickness: 4,
                        //   color: Colors.blueAccent,
                        // ),
                        // const SizedBox(height: 20),
                        // Text(
                        //   "If Person A is Escalating Over a Level 3 Feeling:",
                        //   style: headingStyle,
                        // ),
                        // const SizedBox(height: 10),
                        // ListView.builder(
                        //   shrinkWrap: true,
                        //   physics: const NeverScrollableScrollPhysics(),
                        //   itemCount: levelList.length,
                        //   itemBuilder: ((context, index) {
                        //     return Column(
                        //       children: [
                        //         checkBoxItem(
                        //           levelList[index].title,
                        //           normalStyle,
                        //           levelList[index].value,
                        //           (value) {
                        //             setState(
                        //                 () => levelList[index].value = value);
                        //           },
                        //         ),
                        //         const SizedBox(height: 10),
                        //       ],
                        //     );
                        //   }),
                        // ),
                        const SizedBox(height: 20),
                        Text(
                          'Note',
                          style: normalStyle,
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          maxLines: 10,
                          decoration: InputDecoration(
                            hintText: 'Write your note here ...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        footer(),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
        const SizedBox(width: 10),
        Image.asset(
          "assets/poster/logo.png",
          width: 60,
        )
      ],
    );
  }

  Widget checkBoxItem(
    text,
    style,
    value,
    onChanged, {
    bool isShortWidth = false,
    bool isBold = false,
    bool iscenter = true,
  }) {
    return Row(
      crossAxisAlignment:
          iscenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Checkbox(value: value, onChanged: onChanged),
        // const SizedBox(width: 20),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
                color: AppColor().appBlueColors,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                fontSize: 19),
          ),
        ),
      ],
    );
  }
}
