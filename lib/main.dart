// @dart=2.9
import 'dart:async';
import 'package:provider/provider.dart';
import 'package:bloved/Views/signupPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import 'utilities/ThemeManager.dart';

void main() {
  return runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (_) => new ThemeNotifier(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(392.72727272727275, 781.8181818181819),
        builder: () => Consumer<ThemeNotifier>(
            builder: (context, theme, child) => GetMaterialApp(
                  theme: theme.getTheme(),
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  // theme: ThemeData(
                  //     primarySwatch: Colors.blue,
                  //     fontFamily: GoogleFonts.ubuntu().fontFamily),
                  home: MyHomePage(),
                )));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final w = ScreenUtil().setWidth;
  final h = ScreenUtil().setHeight;
  final sp = ScreenUtil().setSp;
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 8),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignupPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/splashImage.png",
                  ),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              SizedBox(
                height: h(300),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "b",
                      style: GoogleFonts.ubuntu(
                          fontSize: sp(60),
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text(
                      "love",
                      style: GoogleFonts.ubuntu(
                          fontSize: sp(60),
                          color: Colors.pink[300],
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text(
                      "d",
                      style: GoogleFonts.ubuntu(
                          color: Colors.white,
                          fontSize: sp(60),
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Container(
                child: Text(
                  "Find the perfect people",
                  style: GoogleFonts.ubuntu(color: Colors.white),
                ),
              ),
              SizedBox(
                height: h(3),
              ),
              Container(
                child: Text(
                  "around you",
                  style: GoogleFonts.ubuntu(color: Colors.white),
                ),
              ),
              SizedBox(
                height: h(300),
              ),
              Container(
                child: Text(
                  "Terms & Conditions",
                  style: TextStyle(fontSize: sp(10), color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// AssetImage("assets/images/splashImage.png"),
