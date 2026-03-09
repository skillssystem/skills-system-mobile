import 'package:flutter/material.dart';
import 'package:pico_app/colors.dart';

Widget imageWithTopNameWidget({
  required name,
}) {
  return Container(
    height: 120,
    width: 55,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColor().appBlueColors, fontSize: 12),
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: AppColor().appBlueColors, shape: BoxShape.circle),
        ),
      ],
    ),
  );
}   

   Widget clamDownWidget() {
  return Container(
    child: Column(
      children: [
        Text(
          "Calm-Only Skill",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor().appBlueColors,
              fontSize: 28),
        ),
        Container(
          height: 60,
          width: 160,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < 4; i++) ...{
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: i == 0
                          ? AppColor().textBlueColors.withOpacity(0.7)
                          : i == 1
                              ? AppColor().textBlueColors.withOpacity(0.8)
                              : AppColor().textBlueColors,
                      shape: BoxShape.circle),
                  child: Center(
                    child: Text(
                      "${(i + 1).toString()}",
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 14),
                    ),
                  ),
                )
              }
            ],
          ),
        ),
        Text(
          "FEELINGS",
          // textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor().appBlueColors,
              fontSize: 14),
        ),
      ],
    ),
  );
}




Widget allTimeSillWidget() {
  return Container(
    child: Column(
      children: [
        Text(
          "All-the-Time- Skill",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor().textOrangeColors,
              fontSize: 28),
        ),
        Container(
          height: 60,
          width: 160,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < 5; i++) ...{
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: i == 0
                          ? AppColor().textBlueColors.withOpacity(0.7)
                          : i == 1
                              ? AppColor().textBlueColors.withOpacity(0.8):
                              i == 2 ?  AppColor().textBlueColors
                              //  i == 3 ?  AppColor().textBlueColors
                              : AppColor().textOrangeColors,
                      shape: BoxShape.circle),
                  child: Center(
                    child: Text(
                      "${(i + 1).toString()}",
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 14),
                    ),
                  ),
                )
              }
            ],
          ),
        ),
        Text(
          "FEELINGS",
          // textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor().appBlueColors,
              fontSize: 14),
        ),
      ],
    ),
  );
}



 Widget pageEightWidget({
  required String firstLetter,
   required String secondWord,
   required String image,
 }){


  return  Container(
              height: 70,
              width: 250,
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                    
                        shape: BoxShape.circle,
                        color: AppColor().appBlueColors),
                         child: Image.asset(image , cacheHeight: 200, cacheWidth: 200,),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                   Text(firstLetter,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        fontStyle: FontStyle.italic,
                        color: AppColor().appBlueColors,
                      )),
                        Text(secondWord,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        
                        color: AppColor().textGreenColorss,
                      )),
                ],
              ),
            );
 }