import 'package:flutter/material.dart';

import '../main.dart';
import '../screens/main_buttons_page.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3))
        .whenComplete(() => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainButtonPage()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    height: h * .12,
                    width: w * .2,
                    // color: Colors.amber,
                    child: Image.asset(
                      "assets/images/2374104F-DDA3-43FE-9A05-D41C6DF886BF.jpg",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                      height: h * .05,
                      width: w,
                      // color: Colors.amber,
                      child: const Center(
                        child: Text(
                          "SkillsSystem",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                      //  appText(
                      //     myText: "SkillsSystem",
                      //     isbold: true,
                      //     myColors: Colors.black,
                      //     myfontSize: 25

                      )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
