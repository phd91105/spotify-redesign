import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_redesign/screens/homescreen.dart';
import 'package:spotify_redesign/utils/constants.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: primaryBlack,
        appBarTheme: AppBarTheme(
          elevation: 0,
          brightness: Brightness.dark,
        ),
      ),
    ),
  );
}
