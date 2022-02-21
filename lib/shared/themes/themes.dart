import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var lightTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    color: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    elevation: 0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
);

var darkTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: Color(0xff111111),
  appBarTheme: AppBarTheme(
    color: Color(0xff111111),
    iconTheme: IconThemeData(color: Colors.white),
    elevation: 0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xff111111), unselectedItemColor: Colors.grey),
);
