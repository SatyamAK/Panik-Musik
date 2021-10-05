import 'package:flutter/material.dart';

ThemeData lightTheme(){
  return ThemeData(
    primaryColor: Colors.deepPurpleAccent,
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
        fontSize:18
      ),
      headline5: TextStyle(  
        fontSize: 24,
        fontWeight: FontWeight.bold
      ),
      headline6: TextStyle(
        fontSize: 22
      )
    ),
    cardTheme: CardTheme(
      elevation:12,
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      shadowColor: Colors.deepPurpleAccent
    ), 
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.deepPurpleAccent),
    inputDecorationTheme: InputDecorationTheme(  
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),  
        borderSide: BorderSide(
          color: Colors.deepPurple,
          width: 1.8
        )
      ),
      focusedBorder: OutlineInputBorder(  
        borderRadius: BorderRadius.circular(14),  
        borderSide: BorderSide(
          color: Colors.deepPurple,
          width: 2
        )
      )
    )
  );
}

ThemeData darkTheme(){
  return ThemeData(
    primaryColor: Colors.purpleAccent,
    scaffoldBackgroundColor: Colors.black,
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
        primary:Colors.purpleAccent,
        textStyle: TextStyle(
          fontSize: 13
        )
      )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(  
      style: ElevatedButton.styleFrom(
        primary:Colors.purpleAccent,
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
        fontSize:12,
        color: Colors.white
      ),
      bodyText2:TextStyle(  
        fontSize:13,
        color: Colors.white
      ),
      caption: TextStyle(
        color: Colors.white
      ),
      subtitle1: TextStyle(
        color:Colors.white
      ),
      headline5: TextStyle(  
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white
      ),
      headline6: TextStyle(
        fontSize: 22,
        color: Colors.white
      )
    ),
    cardTheme: CardTheme(
      elevation:12,
      color: Colors.black87,
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      shadowColor: Colors.purpleAccent
    ), 
    inputDecorationTheme: InputDecorationTheme(  
      hintStyle: TextStyle(  
        color: Colors.white
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),  
        borderSide: BorderSide(
          color: Colors.deepPurple,
          width: 1.8
        )
      ),
      focusedBorder: OutlineInputBorder(  
        borderRadius: BorderRadius.circular(14),  
        borderSide: BorderSide(
          color: Colors.deepPurple,
          width: 2
        )
      )
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.purpleAccent),
  );
}