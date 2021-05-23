import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_redesign/screens/login.dart';
import 'package:spotify_redesign/utils/constants.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: LoginScreen(),
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
