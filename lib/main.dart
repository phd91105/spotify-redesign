import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_redesign/screens/home.dart';
import 'package:spotify_redesign/utils/constants.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: primaryBlack,
        appBarTheme: AppBarTheme(
          color: primaryBlue,
          elevation: 0,
          brightness: Brightness.light,
        ),
      ),
    ),
  );
}
