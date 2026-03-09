import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pico_app/SplashScreen/SplashScreen.dart';

import 'colors.dart';
import 'myWidget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'System Skills',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
          ),
          textTheme: const TextTheme(
            labelLarge: TextStyle(
              fontWeight: FontWeight.w300,
              color: Colors.black,
              fontSize: 30,
            ),
            displaySmall: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 10.2,
              color: Color.fromARGB(255, 4, 37, 66),
            ),
            displayMedium: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20.2,
              color: Color.fromARGB(255, 4, 37, 66),
            ),
            displayLarge: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 50.2,
              color: Color.fromARGB(255, 4, 37, 66),
            ),
          ),
          colorScheme: const ColorScheme.light(),
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
//       routes: {
//         '1': (context) => const Screen1(),
//       },
        home: SplashScreen());
  }
}

double height = 0;
double width = 0;

class HomePage extends StatelessWidget {
  final String title;
  final pagecontroller = PageController(initialPage: 0);

  HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
//       extendBodyBehindAppBar: true,
      // debug:,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            if (pagecontroller.page == 0) {
              Navigator.pop(context);
            } else {
              pagecontroller.jumpToPage(0);
            }
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: Text(
          title,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: PageView(
        controller: pagecontroller,
        padEnds: false,
        children: <Widget>[Menu(controller: pagecontroller)] +
            pagesInfos.map((page) {
              // var idn = pagesInfos.indexOf(page);
              return Page(
                  headPage: headPage(page.title, context),
                  bodychildren: page.listParts,
                  controller: pagecontroller,
                  transition: (page.typePage == 1 || page.typePage == 2)
                      ? true
                      : false);
            }).toList(),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// first Page

class Menu extends StatelessWidget {
  final PageController controller;

  const Menu({Key? key, required this.controller}) : super(key: key);

  void animateTransition(index) {
    controller.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset("assets/images/logo1.png"),
          ButtonMenu(
            widthIcon: 60,
            heightIcon: 60,
            imageurl: 'assets/images/tools.png',
            onpressed: () => animateTransition(1),
            titleButton: 'Feelings Rating scale',
          ),
          ButtonMenu(
            widthIcon: 60,
            heightIcon: 60,
            imageurl: 'assets/images/tools.png',
            onpressed: () => animateTransition(2),
            titleButton: 'Categories of Skills',
          ),
          ButtonMenu(
            widthIcon: 60,
            heightIcon: 60,
            imageurl: 'assets/images/tools.png',
            onpressed: () => animateTransition(3),
            titleButton: 'Recipe for Skills',
          ),
          Card(
              elevation: 0,
              margin: const EdgeInsets.all(0.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)), //<-- SEE HERE
              ),
              color: AppColor().bacOrangeColors,
              child: Column(
                children: <Widget>[
                  ButtonMenu(
                    widthIcon: 60,
                    heightIcon: 60,
                    onpressed: () => animateTransition(4),
                    imageurl: 'assets/images/clearpic.png',
                    titleButton: '1. Clear Picture',
                    index: 1,
                  ),
                  ButtonMenu(
                    widthIcon: 60,
                    heightIcon: 60,
                    onpressed: () => animateTransition(5),
                    imageurl: 'assets/images/mindtrack.png',
                    titleButton: '2. On-Track Thinking',
                    index: 1,
                  ),
                  ButtonMenu(
                    widthIcon: 60,
                    heightIcon: 60,
                    onpressed: () => animateTransition(6),
                    imageurl: 'assets/images/trackaction.png',
                    titleButton: '3. On-Track Action',
                    index: 1,
                  ),
                  ButtonMenu(
                    widthIcon: 60,
                    heightIcon: 60,
                    onpressed: () => animateTransition(7),
                    imageurl: 'assets/images/safty.png',
                    titleButton: '4. Safety Plan',
                    index: 1,
                  ),
                  ButtonMenu(
                      widthIcon: 60,
                      heightIcon: 60,
                      onpressed: () => animateTransition(8),
                      imageurl: 'assets/images/activity.png',
                      titleButton: '5. New-Me Activities',
                      index: 1),
                ],
              )),
          Card(
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)), //<-- SEE HERE
              ),
              color: AppColor().bacBlueColors,
              margin: const EdgeInsets.all(0.0),
              child: Column(
                children: <Widget>[
                  ButtonMenu(
                    widthIcon: 60,
                    heightIcon: 60,
                    imageurl: 'assets/images/problem.png',
                    onpressed: () => animateTransition(9),
                    titleButton: '6. Problem Solving',
                    index: 2,
                  ),
                  ButtonMenu(
                      widthIcon: 60,
                      heightIcon: 60,
                      imageurl: 'assets/images/express.png',
                      onpressed: () => animateTransition(10),
                      titleButton: '7. Expressing Myself',
                      index: 2),
                  ButtonMenu(
                      widthIcon: 60,
                      heightIcon: 60,
                      imageurl: 'assets/images/getting.png',
                      onpressed: () => animateTransition(11),
                      titleButton: '8. Getting It Right',
                      index: 2),
                  ButtonMenu(
                    widthIcon: 64,
                    heightIcon: 64,
                    imageurl: 'assets/images/relation.png',
                    onpressed: () => animateTransition(12),
                    titleButton: '9. Relationship Care',
                    index: 2,
                  ),
                  footer(),
                ],
              )),
        ],
      ),
    );
  }
}

class ButtonMenu extends StatelessWidget {
  final IconData? icon;
  final int index;
  final String? titleButton;
  final String? imageurl;
  final double size;
  final double widthIcon;
  final double heightIcon;
  final Color? color;
  final void Function()? onpressed;

  const ButtonMenu({
    Key? key,
    this.icon,
    this.titleButton,
    this.onpressed,
    this.index = 0,
    this.widthIcon = 40,
    this.heightIcon = 35,
    this.size = 20.2,
    this.color,
    this.imageurl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          Container(
            width: widthIcon,
            height: heightIcon,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            child: Image.asset('${imageurl}', height: 50, width: 50),
          ),
          const SizedBox(width: 20.2),
          Expanded(
            child: Text(
              titleButton!,
              softWrap: false,
              overflow: TextOverflow.clip,
              maxLines: 1,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: size,
                  color: (index == 2)
                      ? AppColor().textBlueColors
                      : (index == 1)
                          ? AppColor().textOrangeColors
                          : AppColor().appBlueColors),
            ),
          ),
        ]),
      ),
    );
  }
}

Widget headPage(String title, context) {
  return title == ""
      ? SizedBox()
      : Text(title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayMedium);
}

// Widget dividePage() {
//   return Padding(
//     padding: EdgeInsets.all(8.0),
//     child: Divider(
//         height: 12.0,
//         thickness: 5,
//         indent: 100,
//         endIndent: 100,
//         color: AppColor().textBlueColors),
//   );
// }

// class Screen1 extends StatelessWidget {
//   const Screen1({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         backgroundColor: Colors.transparent,
//         title: const Text(
//           'pico_App',
//           style: TextStyle(color: Colors.black),
//         ),
//         elevation: 0,
//       ),
//       body: ScreenBody(
//           headPage: headPage('Feelings Rating Scale', context),
//           bodyWidgets: <Widget>[
//             RichText(
//                 text: const TextSpan(children: [
//               TextSpan(
//                   text: 'Level5=',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.orange,
//                     fontSize: 20.0,
//                   )),
//               TextSpan(
//                   text: 'Hurting Self, Other, or Property',
//                   style: TextStyle(
//                     color: Colors.orange,
//                     fontSize: 20.0,
//                   ))
//             ])),
//             RichText(
//                 text: const TextSpan(children: [
//               TextSpan(
//                   text: 'Level4=',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.orange,
//                     fontSize: 20.0,
//                   )),
//               TextSpan(
//                 text:
//                     'Fuzzy Thinking; Unable to Talk, Listen & Have a 2-Way Street Relationship',
//                 style: TextStyle(
//                   color: Colors.orange,
//                   fontSize: 20.0,
//                 ),
//               )
//             ])),
//           ]),
//     );
//   }
// }

// class ScreenBody extends StatelessWidget {
//   const ScreenBody({Key? key, required this.headPage}) : super(key: key);

//   final Widget headPage;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: <Widget>[
//           headPage,
//           const LevelText(
//             title: 'Levels0-3=',
//             description:
//                 'Clear Thinking; Able To Talk, Listen & Have a 2-way Street Relationship',
//           ),
//           dividePage(),
//           const LevelText(
//             title: 'Level4=',
//             description:
//                 'Fuzzy Thinking; Unable to Talk, Listen & Have a 2-Way Street Relationship',
//           ),
//           const LevelText(
//               title: 'Level5=',
//               description: 'Hurting Self, Other, or Property'),
//         ],
//       ),
//     );
//   }
// }

// Page ONE Feeling Rating Scale
// class PageBody extends StatelessWidget {
//   const PageBody({Key? key, required this.headPage}) : super(key: key);

//   final Widget headPage;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: ,
//     );
//   }
// }

class LevelText extends StatelessWidget {
  final String title;
  final String description;

  const LevelText({Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8.5),
        child: Column(
          children: [
            Text(title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 20.0,
                )),
            Text(description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                ))
          ],
        ));
  }
}

// Page2 Categories of Scale
// class Page2Body extends StatelessWidget {
//   const Page2Body({Key? key, required this.headPage}) : super(key: key);

//   final Widget headPage;

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           headPage,
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 25.0),
//             child: Card(
//                 elevation: 0,
//                 margin: const EdgeInsets.all(50.0),
//                 shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.only(
//                       bottomRight: Radius.circular(20.0),
//                       topRight: Radius.circular(20.0)), //<-- SEE HERE
//                 ),
//                 color: Colors.amber,
//                 child: Column(
//                   children: <Widget>[
//                     ButtonMenu(
//                         onpressed: () {},
//                         icon: Icons.tv,
//                         titleButton: '1. Clear Picture',
// index: 1,
//                         size: 15,
//                         widthIcon: 30,
//                         heightIcon: 30),
//                     ButtonMenu(
//                         onpressed: () {},
//                         icon: Icons.headphones,
//                         titleButton: '2. On-Track Thinking',
//                         size: 15,
//                         widthIcon: 30,
//                         heightIcon: 30),
//                     ButtonMenu(
//                         onpressed: () {},
//                         icon: Icons.headphones,
//                         titleButton: '3. On-Track Action',
// index: 1,
//                         size: 15,
//                         widthIcon: 30,
//                         heightIcon: 30),
//                     ButtonMenu(
//                         onpressed: () {},
//                         icon: Icons.safety_divider,
//                         titleButton: '3. Safety Plan',
// index: 1,
//                         size: 15,
//                         widthIcon: 30,
//                         heightIcon: 30),
//                     ButtonMenu(
//                         onpressed: () {},
//                         icon: Icons.tv,
//                         titleButton: '4. New-Me Activate',
// index: 1,
//                         size: 15,
//                         widthIcon: 30,
//                         heightIcon: 30),
//                     ButtonMenu(
//                         onpressed: () {},
//                         icon: Icons.headphones,
//                         titleButton: '5. Problem Solving',
// index: 1,
//                         size: 15,
//                         widthIcon: 30,
//                         heightIcon: 30),
//                   ],
//                 )),
//           ),
//           dividePage(),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 25.0),
//             child: Card(
//                 elevation: 0,
//                 shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.only(
//                       bottomRight: Radius.circular(20.0),
//                       topRight: Radius.circular(20.0)), //<-- SEE HERE
//                 ),
//                 color: Colors.brown,
//                 margin: const EdgeInsets.all(50.0),
//                 child: Column(
//                   children: <Widget>[
//                     ButtonMenu(
//                         onpressed: () {},
//                         icon: Icons.train,
//                         titleButton: '6. Expressing Myself',
// index: 2,
// //                         size: 15,
//                         widthIcon: 30,
//                         heightIcon: 30),
//                     ButtonMenu(
//                         onpressed: () {},
//                         icon: Icons.safety_divider,
//                         titleButton: '7. Getting It Right',
// index: 2,
//                         size: 15,
//                         widthIcon: 30,
//                         heightIcon: 30),
//                     ButtonMenu(
//                         onpressed: () {},
//                         icon: Icons.coffee_sharp,
//                         titleButton: '8. Relationship Care',
// index: 2,
// //                         size: 15,
//                         widthIcon: 30,
//                         heightIcon: 30),
//                   ],
//                 )),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Page3 Reciape For Skills

// class Page3Body extends StatelessWidget {
//   const Page3Body({Key? key, required this.headPage}) : super(key: key);

//   final Widget headPage;

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           headPage,
//         ],
//       ),
//     );
//   }
// }

// class PAGES
class Page extends StatelessWidget {
  final Widget headPage;
  final PageController? controller;
  final List<Widget> bodychildren;
  final bool transition;

  const Page(
      {Key? key,
      required this.headPage,
      required this.bodychildren,
      this.controller,
      this.transition = false})
      : super(key: key);

  void implementDivider() {
//     for (var i = 1; i < le; i+=2) {
//       Widget wid = dividePage();
//       bodychildren.insert(i, wid) ;
//       print(bodychildren);
//     }
//     Widget wid = dividePage();
//     bodychildren.insert(0, wid);
  }

  @override
  Widget build(BuildContext context) {
    // implementDivider();
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
          child: Column(
        children: <List<Widget>>[
          [headPage],
          if (transition)
            [TapTransitionInkWell(controller: controller, path: '')],
          bodychildren
        ].expand((x) => x).toList(),
      )),
    );
  }
}

// Model

class PageInfo {
  final String title;

  final List<Widget> listParts;
  final int typePage;
  // final PageController controller;

  const PageInfo(
      {required this.title, required this.listParts, this.typePage = 1});
}

// data
final pagesInfos = <PageInfo>[
  // Page 1
  PageInfo(
    title: 'Feeling Rating Scale',
    typePage: 0,
    listParts: <Widget>[
      Image.asset('assets/images/rating1.PNG'),
      Image.asset('assets/images/rating2.PNG'),
      footer(),
      SizedBox(
        height: 10,
      ),
    ],
  ),
  // Page 2
  PageInfo(
    title: 'Categories of Skills',
    typePage: 0,
    listParts: [
      Image.asset('assets/images/category1.PNG'),
      Image.asset('assets/images/category2.PNG'),
      footer(),
      SizedBox(
        height: 10,
      ),
    ],
  ),
  // Page 3
  PageInfo(
    title: '',
    typePage: 0,
    listParts: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Image.asset(
          'assets/images/recipipe.png',
          fit: BoxFit.fill,
          height: height + 100,
          width: width,
        ),
      ),
      // Image.asset(

      //   fit: BoxFit.cover,
      // ),
      const SizedBox(height: 10),
      // AvatarBottomText(
      //   image: 'assets/images/RelationShipCare1.PNG',
      //   index: 0,
      //   positionButtonColor: AppColor().textBlueColors,
      // ),
      // AvatarBottomText(
      //     image: 'assets/images/RelationShipCare1.PNG',
      //     index: 1,
      //     positionButtonColor: AppColor().textBlueColors),
      // AvatarBottomText(
      //     image: 'assets/images/RelationShipCare1.PNG',
      //     index: 2,
      //     positionButtonColor: AppColor().textBlueColors),
      // AvatarBottomText(
      //     image: 'assets/images/RelationShipCare1.PNG',
      //     index: 3,
      //     positionButtonColor: AppColor().textBlueColors),
      // AvatarBottomText(
      //     image: 'assets/images/RelationShipCare1.PNG',
      //     index: 4,
      //     showrest: true,
      //     positionButtonColor: AppColor().textOrangeColors),
      // AvatarBottomText(
      //     image: 'assets/images/RelationShipCare1.PNG',
      //     index: 5,
      //     showrest: false,
      //     positionButtonColor: AppColor().textOrangeColors),
    ],
  ),
  // Page 4
  PageInfo(
    title: '',
    typePage: 0,
    listParts: <Widget>[
      Image.asset('assets/images/clearpic0.PNG'),
      SizedBox(
        height: 10,
      ),
      Image.asset('assets/images/clearpic1.PNG'),
      Image.asset('assets/images/clearpic2.PNG'),
      Image.asset('assets/images/clearpic3.PNG'),
      Image.asset('assets/images/clearpic4.PNG'),
      Image.asset('assets/images/clearpic5.PNG'),
      Image.asset('assets/images/clearpic6.PNG'),
      footer(),
      SizedBox(
        height: 10,
      )
    ],
  ),
  // Page 5
  PageInfo(
    title: '',
    typePage: 0,
    listParts: <Widget>[
      //----------------------------------------------------------------------------//
      Image.asset('assets/images/mindtrack0.PNG'),
      SizedBox(
        height: 10,
      ),
      Image.asset('assets/images/mindtrack1.PNG'),
      Image.asset('assets/images/mindtrack2.PNG'),
      Image.asset('assets/images/mindtrack3.PNG'),
      Image.asset('assets/images/mindtrack4.PNG'),
      Image.asset('assets/images/mindtrack5.PNG'),
      footer(),
      SizedBox(
        height: 10,
      ),
    ],
  ),
// Page 6
  PageInfo(
    title: '',
    typePage: 0,
    listParts: <Widget>[
      Image.asset('assets/images/trackaction0.PNG'),
      SizedBox(
        height: 10,
      ),
      Image.asset('assets/images/trackaction1.PNG'),
      Image.asset('assets/images/trackaction2.PNG'),
      Image.asset('assets/images/trackaction3.PNG'),
      Image.asset('assets/images/trackaction4.PNG'),
      Image.asset('assets/images/trackaction5.PNG'),
      footer(),
      SizedBox(
        height: 10,
      ),
    ],
  ),
  // page 7
  PageInfo(
    title: '',
    typePage: 0,
    listParts: <Widget>[
      Image.asset('assets/images/safty0.PNG'),
      SizedBox(
        height: 10,
      ),
      Image.asset('assets/images/plan1.PNG'),
      Image.asset('assets/images/plan2.PNG'),
      Image.asset('assets/images/plan3.PNG'),
      Image.asset('assets/images/plan4.PNG'),
      footer(),
      SizedBox(
        height: 10,
      ),
    ],
  ),
  // page 8
  PageInfo(
    title: '',
    typePage: 0,
    listParts: <Widget>[
      Image.asset('assets/images/activity0.PNG'),
      SizedBox(
        height: 10,
      ),
      Image.asset('assets/images/activity1.PNG'),
      Image.asset('assets/images/activity2.PNG'),
      Image.asset('assets/images/activity3.PNG'),
      Image.asset('assets/images/activity4.PNG'),
      footer(),
      SizedBox(
        height: 10,
      ),
    ],
  ),
  // page 9
  PageInfo(
    title: '',
    typePage: 0,
    listParts: <Widget>[
      Image.asset('assets/images/problem0.PNG'),
      Image.asset('assets/images/CalmOnlySkill.PNG'),
      Image.asset('assets/images/problem1.PNG'),
      Image.asset('assets/images/problem2.PNG'),
      Image.asset('assets/images/problem3.PNG'),
      footer(),
      SizedBox(
        height: 10,
      ),
    ],
  ),
  // page 10
  PageInfo(
    title: '',
    typePage: 0,
    listParts: <Widget>[
      Image.asset('assets/images/express0.PNG'),
      Image.asset('assets/images/CalmOnlySkill.PNG'),
      Image.asset('assets/images/express1.PNG'),
      Image.asset('assets/images/express2.PNG'),
      Image.asset('assets/images/express3.PNG'),
      Image.asset('assets/images/express4.PNG'),
      Image.asset('assets/images/express5.PNG'),
      footer(),
      SizedBox(
        height: 10,
      ),
    ],
  ),
  // page 11
  PageInfo(
    title: '',
    typePage: 0,
    listParts: <Widget>[
      Image.asset('assets/images/getting0.PNG'),
      Image.asset('assets/images/CalmOnlySkill.PNG'),
      Image.asset('assets/images/getting1.PNG'),
      Image.asset('assets/images/getting2.PNG'),
      Image.asset('assets/images/getting3.PNG'),
      Image.asset('assets/images/getting4.PNG'),
      footer(),
      SizedBox(
        height: 10,
      ),
    ],
  ),
  PageInfo(
    title: '',
    typePage: 0,
    listParts: <Widget>[
      Image.asset('assets/images/relation0.PNG'),
      Image.asset('assets/images/CalmOnlySkill.PNG'),
      Image.asset('assets/images/relation1.PNG'),
      Image.asset('assets/images/relation2.PNG'),
      Image.asset('assets/images/relation3.PNG'),
      Image.asset('assets/images/relation4.PNG'),
      footer(),
      SizedBox(
        height: 10,
      ),
    ],
  )
];

class TapTransitionInkWell extends StatelessWidget {
  final PageController? controller;
  final String path;

  const TapTransitionInkWell({
    Key? key,
    this.controller,
    required this.path,
  }) : super(key: key);

  void animateTransition(index) {
    controller!.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => animateTransition(1),
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: Image.asset(
              'assets/images/CalmOnlySkill.PNG',
              height: 100,
              width: 100,
            )));
  }
}

// ignore: must_be_immutable
class AvatarBottomText extends StatelessWidget {
  final String? image;
  final int index;
  final bool showrest;
  var positionButtonColor;
//   final String description;

  AvatarBottomText(
      {Key? key,
      required this.index,
      this.image,
      this.showrest = true,
      this.positionButtonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius = 32;
    return Container(
      height: 100,
      width: 400,
      padding: EdgeInsets.only(left: 20),
      child: Stack(children: [
        SizedBox(
          width: 70,
          height: 70,
          child: Stack(alignment: AlignmentDirectional.topStart, children: [
            CircleAvatar(
              radius: radius + 2,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: radius,
                backgroundImage: AssetImage('$image'),
              ),
            ),
            Positioned(
              right: 0.0,
              bottom: 0.0,
              child: Container(
                width: 30.0,
                height: 30.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: positionButtonColor),
                child: Center(
                    child: Text('$index',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontSize: 15.0, color: Colors.white))),
              ),
            ),
          ]),
        ),
        Positioned(
            top: 35.0,
            left: 80.0,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Use at least',
                    style: TextStyle(
                        color: index < 4
                            ? AppColor().textBlueColors
                            : AppColor().textOrangeColors)
                    //  Theme.of(context)
                    //     .textTheme
                    //     .bodySmall!
                    //     .copyWith(color: Colors.blue, fontSize: 20.0)
                    ),
                TextSpan(
                    text: ' ${index + 1} skills',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: (index < 4)
                            ? AppColor().textBlueColors
                            : AppColor().textOrangeColors))
              ])),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Use any ',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColor().appBlueColors)),
                TextSpan(
                    text: 'All-The-Time Skills ',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColor().textOrangeColors)),
              ])),
              index < 4
                  ? RichText(
                      text: TextSpan(children: [
                      TextSpan(
                          text: 'and ',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: AppColor().appBlueColors)),
                      TextSpan(
                          text: 'Calm Only Skills',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: AppColor().textBlueColors)),
                    ]))
                  : SizedBox()
            ])),
      ]),
    );
  }
}

class TvImage extends StatelessWidget {
  final String? image;
  final String title;
  final String description;
//   final String description;

  const TvImage(
      {Key? key,
      required this.image,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(title,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: AppColor().appBlueColors,
              fontSize: 18,
              fontWeight: FontWeight.bold)),
      Stack(alignment: Alignment.center, children: [
        Container(
            height: 200,
            width: 200,
            child: Image.asset(
              "assets/new/tv.png",
              cacheHeight: 200,
              cacheWidth: 200,
            )),
        // const Icon(Icons.tv, size: 200.0),
        Positioned(
            top: 28.0,
            child: Container(
              width: 175.0,
              height: 113.0,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  image: DecorationImage(
                      image: AssetImage(image!), fit: BoxFit.cover)),
            )),
      ]),
      SizedBox(
        width: 200,
        child: Text(description,
            textAlign: TextAlign.center,
            softWrap: true,
            style: TextStyle(
                color: AppColor().appBlueColors,
                fontSize: 13,
                fontWeight: FontWeight.bold)),
      )
    ]);
  }
}

class ItemOnTrackAction extends StatelessWidget {
  final String title;
  final String description;
  final String text;
  final String path;
//   final String description;

  const ItemOnTrackAction({
    Key? key,
    required this.title,
    required this.description,
    required this.text,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
        // margin: const EdgeInsets.symmetric(horizontal: 8.0),
        // height: 100,
        child: Column(
      children: [
        Container(
          // height: h * 0.4 ,
          width: w,
          // color: Colors.red,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    // height: h * 0.15 ,
                    width: w,
                    // color: Colors.green,
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                  color: AppColor().appBlueColors,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              description,
                              style: TextStyle(
                                color: Color.fromARGB(255, 67, 226, 72),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              width: w * 0.7,
                              child: Text(
                                text,
                                style: TextStyle(
                                  color: AppColor().appBlueColors,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ItemImage(
                              title: '',
                              path: path,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Text(title , ),
        // Text(description, style: Theme.of(context).textTheme.displaySmall),
        // Row(children: [
        //   Expanded(
        //     child: Text(
        //       text,
        //       softWrap: true,
        //       style: Theme.of(context).textTheme.titleSmall,
        //     ),
        //   ),
        // ItemImage(
        //   title: '',
        //   path: path,
        // )
        // Container(
        //     margin: const EdgeInsets.symmetric(horizontal: 8.0),
        //     width: 50,
        //     height: 50,
        //     decoration: BoxDecoration(
        //         image: DecorationImage(
        //             image: AssetImage(path), fit: BoxFit.cover)))
        // ]
        // )
        SizedBox(
          height: 15,
        ),
        //dividePage(),

        SizedBox(
          height: 30,
        )
      ],
    ));
  }
}

class ItemSafetyPlan extends StatelessWidget {
  final String title;
  final List<List> items;
//   final String description;

  const ItemSafetyPlan({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
//         height: 200,
        child: Column(
          children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                      color: AppColor().appBlueColors,
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),

                  //  Theme.of(context)
                  //     .textTheme
                  //     .displaySmall!
                  //     .copyWith(fontWeight: FontWeight.bold)
                ),
                SizedBox(
                  height: 10,
                )
              ] +
              items
                  .map((m) {
                    var index = items.indexOf(m);
                    return [
                      Text(
                        m[0],
                        style: TextStyle(
                            color: (index == 0)
                                ? Colors.green
                                : (index == 1)
                                    ? Colors.amber
                                    : Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),

                        //  Theme.of(context)
                        //     .textTheme
                        //     .displaySmall!
                        //     .copyWith(
                        //         fontWeight: FontWeight.bold,

                        // )
                      ),
                      m[1] != ''
                          ? Container(
                              width: 80,
                              height: 80,
                              clipBehavior: Clip.antiAlias,
                              margin: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // image: DecorationImage(
                                //     image: AssetImage(m[1]), fit: BoxFit.cover),
                                color: Color.fromARGB(255, 1, 4, 38),
                              ),
                              child: Image.asset(m[1],
                                  cacheHeight: 200, cacheWidth: 200),
                            )
                          : Container(
                              width: 80,
                              height: 80,
                              margin: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // image: DecorationImage(image : AssetImage(m[1])),
                                color: Color.fromARGB(255, 1, 4, 38),
                              ),
                              // child: Text(m[1])
                            )
                    ];
                  })
                  .expand((x) => x)
                  .toList(),
        ));
  }
}

class ItemMeNewActivaty extends StatelessWidget {
  final String title;
  final String text1;
  final String text2;
  final bool showrest;
  final List items;
//   final String description;

  const ItemMeNewActivaty({
    Key? key,
    required this.title,
    required this.text1,
    required this.text2,
    required this.items,
    this.showrest = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        height: 150,
        // width: MediaQuery.of(context).size.width * 0.7,
        width: 230,
        // color: Colors.red,
        child: Column(
          children: <Widget>[
            Text(title,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColor().appBlueColors)),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  children: showrest
                      ? [
                          TextSpan(
                              text: text1,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      color: AppColor().textOrangeColors)),
                          TextSpan(
                              text: ' to ',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(color: AppColor().appBlueColors)),
                          TextSpan(
                              text: text2,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(color: Colors.green))
                        ]
                      : <InlineSpan>[
                          TextSpan(
                              text: text2,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold))
                        ]),
            ),
            const SizedBox(height: 12),
            Expanded(
                child: Container(
                    // color: Colors.amber,
                    child: ListView.builder(
              itemCount: items.length,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      clipBehavior: Clip.antiAlias,
//                               color: Colors.black,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 1, 4, 38),
                        // image: DecorationImage(
                        //     image: AssetImage(items[index]), fit: BoxFit.cover)
                      ),
                      child: Image.asset(items[index],
                          cacheHeight: 200, cacheWidth: 200),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                );
              },
            )))
//             Wrap(
//                 spacing: 8.0,
//                 children: items
//                     .map((m) => [
//                           Container(
//                             width: 70,
//                             height: 70,
// //                               color: Colors.black,
//                             decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Color.fromARGB(255, 1, 4, 38),
//                                 image: DecorationImage(
//                                     image: AssetImage(m), fit: BoxFit.cover)),
//                           )
//                         ])
//                     .expand((x) => x)
//                     .toList())
          ],
        ));
  }
}

class ItemExpressingMySelf extends StatelessWidget {
  final String title;
  final List<List<String>> items;

  const ItemExpressingMySelf({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        width: 350,
//         height: extra ? 500 : ,
        child: Column(
          children: <Widget>[
            Text(title,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: AppColor().appBlueColors)),
            const SizedBox(height: 20),
            Wrap(
                alignment: WrapAlignment.center,
                spacing: 8.0,
                children: items
                    .map((m) => [
                          SizedBox(
                              width: 100,
                              height: (m.length > 2) ? 150 : 106,
                              child: Column(children: [
                                m[1] != ''
                                    ? Container(
                                        margin: EdgeInsets.all(4.0),
                                        width: 80,
                                        height: 80,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,

                                          // color: AppColor().appBlueColors,
                                        ),
                                        child: Image.asset(
                                          m[1],
                                          cacheHeight: 200,
                                          cacheWidth: 200,
                                        ),
                                      )
                                    : Container(
                                        margin: EdgeInsets.all(4.0),
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          //   image : DecorationImage(image: AssetImage(m[1]) , fit: BoxFit.cover),
                                          color: AppColor().appBlueColors,
                                        ),
                                      ),
                                Text(m[0],
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(
                                            color: AppColor().appBlueColors)),
                                if (m.length > 2)
                                  Text(m[2],
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .copyWith(color: Colors.green))
                              ]))
                        ])
                    .expand((x) => x)
                    .toList())
          ],
        ));
  }
}

class ItemImage extends StatelessWidget {
  final String title;
  final String path;

  const ItemImage({
    Key? key,
    required this.title,
    this.path = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: const EdgeInsets.symmetric(horizontal: 8.0),
        // width: 350,
        // height: 500,
        child: Column(children: [
      Text(title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayMedium),
      Image.asset(
        path,
        height: 80,
        fit: BoxFit.fill,
      )
    ]));
  }
}

Widget footer() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Expanded(
          child: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            bottom: 8,
          ),
          child: Text(
            " @Copyright 2023, Skills System.",
            style: TextStyle(fontSize: 9, color: Colors.black.withOpacity(.6)),
          ),
        ),
      )),
      SizedBox(
        width: 10,
      ),
      Image.asset(
        "assets/poster/logo.png",
        width: 100,
      ),
      SizedBox(
        width: 10,
      )
    ],
  );
}

// Stack(
//       children: [
//         CircleAvatar(
//           radius: radius + 2,
//           backgroundColor: Colors.white,
//           child: CircleAvatar(
//             radius: radius,
//             backgroundImage: AssetImage('$image'),
//           ),
//         ),
//         Positioned(
//           right: 0.0,
//           bottom: 0.0,
//           child: Row(children: [
//             Container(
//               width: 15,
//               height: 16,
//               decoration: const BoxDecoration(
//                   shape: BoxShape.circle, color: Color.fromARGB(255, 1, 4, 38)),
//               child: Text('$index'),
//             ),
//             Column(children: [
//               RichText(
//                   text: TextSpan(children: [
//                 const TextSpan(text: 'Use at least'),
//                 TextSpan(text: '$index skills'),
//               ])),
//               RichText(
//                   text: const TextSpan(children: [
//                 TextSpan(text: 'Use any'),
//                 TextSpan(text: 'All-The-Time Skills'),
//                 TextSpan(text: 'and'),
//                 TextSpan(text: 'Calm Only Skills'),
//               ]))
//             ])
//           ]),
//         ),
//       ],
//     )
