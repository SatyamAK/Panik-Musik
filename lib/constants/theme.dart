import 'package:flutter/material.dart';

ThemeData lightTheme(){
  return ThemeData(
    primaryColor: Colors.deepPurple[400],
    accentColor: Colors.deepPurpleAccent,
    appBarTheme: AppBarTheme(  
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold
      )
    ),
    textButtonTheme: TextButtonThemeData(  
      style: TextButton.styleFrom(
        primary:Colors.deepPurpleAccent,
        textStyle: TextStyle(
          fontSize: 13
        )
      )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(  
      style: ElevatedButton.styleFrom(
        primary:Colors.deepPurpleAccent,
        textStyle: TextStyle(  
          color: Colors.white,
          fontSize: 16
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        )
      )
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(  
        fontSize:12
      ),
      bodyText2:TextStyle(  
        fontSize:14
      ),
      headline5: TextStyle(  
        fontSize: 24,
        fontWeight: FontWeight.bold
      )
    ),
    cardTheme: CardTheme(
      elevation:12,
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      )
    )
  );
}