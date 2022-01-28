import 'package:flutter/material.dart';
import 'package:panik_musik/constants/day_color.dart';
import 'package:panik_musik/constants/night_color.dart';
import 'package:panik_musik/constants/values.dart';

ThemeData lightTheme() {
  return ThemeData(
    primaryColorLight: DayColor.primaryColor,
    scaffoldBackgroundColor: DayColor.backGround,
    primarySwatch: DayColor.primarySwatch,

    textTheme: const TextTheme(
      headline1: TextStyle(  
        color: DayColor.textColor,
        fontSize: Values.headSize,
        fontWeight: FontWeight.w700
      ),
      headline2: TextStyle(
        color: DayColor.textColor,
        fontSize: Values.appBarTitle,
        fontWeight: FontWeight.w700
      ),
      button: TextStyle(
        color: DayColor.buttonTextColor,
        fontSize: Values.buttonTitle,
        fontWeight: FontWeight.w600
      ),
      bodyText1: TextStyle(
        color: DayColor.textColor,
        fontSize: Values.normalTextSize,
        fontWeight: FontWeight.normal
      ),
      subtitle1: TextStyle(
        color: DayColor.textColor,
        fontSize: Values.subTitleSize,
        fontWeight: FontWeight.normal
      )
    ),
    tabBarTheme: const TabBarTheme(  
      labelColor: Colors.black
    ),
    appBarTheme: const AppBarTheme(  
      titleTextStyle: TextStyle(
        color: DayColor.textColor,
        fontSize: Values.appBarTitle
      ),
      backgroundColor: DayColor.backGround,
      elevation: 0
    )
  );
}

ThemeData darkTheme() {
  return ThemeData(
    primaryColorLight: NightColor.primaryColor,
    scaffoldBackgroundColor: NightColor.backGround,
    primarySwatch: NightColor.primarySwatch,

    textTheme: const TextTheme(
      headline1: TextStyle(  
        color: NightColor.textColor,
        fontSize: Values.headSize,
        fontWeight: FontWeight.w700
      ),
      headline2: TextStyle(
        color: NightColor.textColor,
        fontSize: Values.appBarTitle,
        fontWeight: FontWeight.w700
      ),
      button: TextStyle(
        color: NightColor.buttonTextColor,
        fontSize: Values.buttonTitle,
        fontWeight: FontWeight.w600
      ),
      bodyText1: TextStyle(
        color: NightColor.textColor,
        fontSize: Values.normalTextSize,
        fontWeight: FontWeight.normal
      ),
      subtitle1: TextStyle(
        color: NightColor.textColor,
        fontSize: Values.subTitleSize,
        fontWeight: FontWeight.normal
      )
    ),

    appBarTheme: const AppBarTheme(  
      titleTextStyle: TextStyle(
        color: NightColor.textColor,
        fontSize: Values.appBarTitle
      ),
      backgroundColor: NightColor.backGround,
      elevation: 0
    )
  );
}
