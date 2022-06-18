import 'dart:async';
import 'package:flutter/material.dart';
import 'package:raccoonscoter/Extentions/color.dart';
import 'package:raccoonscoter/Extentions/screenSize.dart';
import 'package:get/get.dart';
import 'package:raccoonscoter/Views/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.kirmizi,
      body: Column(
        children: [
          SizedBox(
            height: screenSize(context).height * SizedComponent.height4,
          ),
          Center(
              child: Text(
            "RACCOON !",
            style: TextStyle(
                color: Color(0xffffffff),
                fontSize: 48,
                fontWeight: FontWeight.w800),
          )),
        ],
      ),
    );
  }
}
