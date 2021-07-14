import 'package:bloved/Controllers/darklightTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool status = false;
  String selected = "Males";
  final w = ScreenUtil().setWidth;
  final h = ScreenUtil().setHeight;
  final sp = ScreenUtil().setSp;
  late GoogleMapController mapController;
  bool statusForGender = false;
  var themeController = Get.put(ThemeValue());

  @override
  void didUpdateWidget(covariant oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("object");
  }

  Future<bool> _willPopCallback() async {
    Navigator.of(context).pop("dark");
    return true; // return true if the route to be popped
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: h(40),
                padding: EdgeInsets.only(bottom: h(20)),
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).backgroundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Profile",
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: sp(17),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: w(110),
                    ),
                    Text(
                      "Done",
                      style: TextStyle(
                          color: Color(0xfffa5473),
                          fontSize: sp(17),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: w(20),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: h(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => (Container(
                        padding: EdgeInsets.only(
                          left: w(20),
                        ),
                        child: Text(
                          "PICTURES",
                          style: TextStyle(
                              fontSize: sp(15),
                              color: themeController.themeValue.toString() ==
                                      "dark"
                                  ? Color(0xff555557)
                                  : Colors.black),
                        ),
                      ))),
                  Obx(
                    () => Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(),
                          height: h(8),
                          width: w(8),
                          decoration: BoxDecoration(
                              color: Color(0xffff61a1),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(
                          width: w(5),
                        ),
                        Container(
                          padding: EdgeInsets.only(),
                          height: h(8),
                          width: w(8),
                          decoration: BoxDecoration(
                              color: themeController.themeValue.toString() ==
                                      "dark"
                                  ? Colors.white12
                                  : Colors.black12,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(
                          width: w(5),
                        ),
                        Obx(() => Container(
                              margin: EdgeInsets.only(right: w(20)),
                              height: h(8),
                              width: w(8),
                              decoration: BoxDecoration(
                                  color:
                                      themeController.themeValue.toString() ==
                                              "dark"
                                          ? Colors.white12
                                          : Colors.black12,
                                  borderRadius: BorderRadius.circular(10)),
                            ))
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: h(20),
              ),
              Container(
                padding: EdgeInsets.all(w(10)),
                color: Theme.of(context).backgroundColor,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: w(15)),
                      height: h(100),
                      width: w(110),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/img1.png",
                            ),
                            fit: BoxFit.cover,
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: w(10)),
                      height: h(100),
                      width: w(110),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          image: DecorationImage(
                              image: AssetImage(
                                "assets/images/image2.png",
                              ),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: w(10)),
                      child: DottedBorder(
                        radius: Radius.circular(15),
                        dashPattern: [8, 3],
                        color: Colors.pink,
                        child: ClipRRect(
                          child: Container(
                            height: h(100),
                            width: w(110),
                            decoration: BoxDecoration(
                                color: Theme.of(context).toggleableActiveColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.pink,
                                size: w(40),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: h(20),
              ),
              Container(
                color: Theme.of(context).backgroundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: h(20), left: w(20), bottom: h(20)),
                      child: Text(
                        "Smart Photos",
                        style: TextStyle(
                            fontFamily: "SFProText-Regular",
                            fontSize: sp(17),
                            color: Theme.of(context).accentColor),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: w(20)),
                      child: FlutterSwitch(
                        activeColor: Colors.pink,
                        width: 51.0,
                        height: 30.0,
                        valueFontSize: 25.0,
                        toggleSize: 35.0,
                        value: status,
                        borderRadius: 25.0,
                        padding: 0.0,
                        showOnOff: false,
                        onToggle: (val) {
                          setState(() {
                            status = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h(10),
              ),
              Container(
                padding: EdgeInsets.only(left: w(20)),
                child: Text(
                  "Smart Photos continuously tests all your profile photos to find the best one",
                  style: TextStyle(color: Color(0xffa5a5a5), fontSize: sp(11)),
                ),
              ),
              SizedBox(
                height: h(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: w(20)),
                    child: Text("CONNECT SOCIAL MEDIA",
                        style: TextStyle(
                          fontSize: sp(15),
                          color: themeController.themeValue.toString() == "dark"
                              ? Colors.white
                              : Color(0xff4f5258),
                        )),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(),
                        height: h(8),
                        width: w(8),
                        decoration: BoxDecoration(
                            color: Color(0xffff61a1), shape: BoxShape.circle),
                      ),
                      SizedBox(
                        width: w(5),
                      ),
                      Container(
                        padding: EdgeInsets.only(),
                        height: h(8),
                        width: w(8),
                        decoration: BoxDecoration(
                            color:
                                themeController.themeValue.toString() == "dark"
                                    ? Color(0xff555557)
                                    : Colors.black12,
                            shape: BoxShape.circle),
                      ),
                      SizedBox(
                        width: w(5),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: w(20)),
                        height: h(8),
                        width: w(8),
                        decoration: BoxDecoration(
                            color:
                                themeController.themeValue.toString() == "dark"
                                    ? Color(0xff555557)
                                    : Colors.black12,
                            shape: BoxShape.circle),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: h(5),
              ),
              Obx(
                () => Container(
                  color: Theme.of(context).backgroundColor,
                  padding: EdgeInsets.only(top: h(20), bottom: h(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: w(40)),
                          height: h(60),
                          width: w(60),
                          decoration: BoxDecoration(
                              color: themeController.themeValue.toString() ==
                                      "dark"
                                  ? Colors.white12
                                  : Color(0xffcecece),
                              shape: BoxShape.circle),
                          child: Container(
                            margin: EdgeInsets.only(
                                left: w(15),
                                right: w(15),
                                top: h(15),
                                bottom: h(15)),
                            child:
                                themeController.themeValue.toString() == "dark"
                                    ? Image.asset(
                                        "assets/images/snapchat.png",
                                        color: Colors.white70,
                                      )
                                    : Image.asset(
                                        "assets/images/snapchat.png",
                                        color: Colors.grey[400],
                                      ),
                          )),
                      Container(
                          height: h(60),
                          width: w(60),
                          decoration: BoxDecoration(
                              color: themeController.themeValue.toString() ==
                                      "dark"
                                  ? Colors.white12
                                  : Color(0xffcecece),
                              shape: BoxShape.circle),
                          child: Container(
                              margin: EdgeInsets.only(
                                  left: w(15),
                                  right: w(15),
                                  top: h(15),
                                  bottom: h(15)),
                              child: themeController.themeValue.toString() ==
                                      "dark"
                                  ? Image.asset(
                                      "assets/images/facebook.png",
                                      color: Colors.white70,
                                    )
                                  : Image.asset(
                                      "assets/images/facebook.png",
                                      color: Colors.grey[400],
                                    ))),
                      Container(
                          height: h(60),
                          width: w(60),
                          decoration: BoxDecoration(
                              color: themeController.themeValue.toString() ==
                                      "dark"
                                  ? Colors.white12
                                  : Color(0xffcecece),
                              shape: BoxShape.circle),
                          child: Container(
                            margin: EdgeInsets.only(
                                left: w(15),
                                right: w(15),
                                top: h(15),
                                bottom: h(15)),
                            child:
                                themeController.themeValue.toString() == "dark"
                                    ? Image.asset(
                                        "assets/images/tiktok.png",
                                        height: h(20),
                                        width: w(20),
                                        color: Colors.white70,
                                      )
                                    : Image.asset(
                                        "assets/images/tiktok.png",
                                        height: h(20),
                                        width: w(20),
                                        color: Colors.grey[400],
                                      ),
                          )),
                      Container(
                          margin: EdgeInsets.only(right: w(40)),
                          height: h(60),
                          width: w(60),
                          decoration: BoxDecoration(
                              color: themeController.themeValue.toString() ==
                                      "dark"
                                  ? Color(0xfffa5473)
                                  : Color(0xfffff3f3),
                              shape: BoxShape.circle),
                          child: Container(
                              margin: EdgeInsets.only(
                                  left: w(15),
                                  right: w(15),
                                  top: h(15),
                                  bottom: h(15)),
                              child: themeController.themeValue.toString() ==
                                      "dark"
                                  ? Image.asset(
                                      "assets/images/instagram.png",
                                      color: Colors.white,
                                    )
                                  : Image.asset(
                                      "assets/images/instagram.png",
                                      color: Color(0xfffa5473),
                                    )))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: h(20),
              ),
              Container(
                padding: EdgeInsets.only(left: w(20)),
                child: Text(
                  "BIO",
                  style: TextStyle(
                      fontSize: sp(15), color: Theme.of(context).accentColor),
                ),
              ),
              SizedBox(
                height: h(5),
              ),
              Stack(
                children: [
                  Container(
                    height: h(100),
                    width: MediaQuery.of(context).size.width,
                    color: Theme.of(context).backgroundColor,
                    child: TextField(
                      style: TextStyle(color: Theme.of(context).accentColor),
                      cursorColor: Colors.pink,
                      cursorHeight: h(22),
                      maxLength: 500,
                      maxLines: 8,
                      scrollPadding: EdgeInsets.all(0),
                      decoration: InputDecoration(
                          counterText: "",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              top: h(5), left: w(5), bottom: 0, right: 10)),
                    ),
                  ),
                  Positioned.fill(
                      child: Container(
                          padding: EdgeInsets.only(right: w(10), bottom: h(10)),
                          alignment: Alignment.bottomRight,
                          child: Obx(
                            () => Text(
                              "500",
                              style: TextStyle(
                                  fontSize: 15,
                                  color:
                                      themeController.themeValue.toString() ==
                                              "dark"
                                          ? Color(0xff555557)
                                          : Color(0xffa5a5a5)),
                            ),
                          )))
                ],
              ),
              SizedBox(
                height: h(20),
              ),
              Container(
                padding: EdgeInsets.only(left: w(20)),
                child: Text(
                  "ABOUT VERIFICATION",
                  style: TextStyle(
                      color: Theme.of(context).accentColor, fontSize: sp(15)),
                ),
              ),
              SizedBox(
                height: h(10),
              ),
              Container(
                padding: EdgeInsets.only(left: w(20)),
                child: Text(
                  "verified users get more attentions- take 2 minutes to stand out",
                  style: TextStyle(color: Colors.grey, fontSize: sp(11)),
                ),
              ),
              SizedBox(
                height: h(20),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return VerificationScreen();
                  // }
                  // ));
                },
                child: Container(
                  margin: EdgeInsets.only(left: w(20)),
                  height: h(60),
                  width: w(350),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                        ),
                      ],
                      color: Color(0xfffa5473),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    "Verify by Photo",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                ),
              ),
              SizedBox(
                height: h(20),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: w(20),
                ),
                child: Text(
                  "PROFILE QS",
                  style: TextStyle(
                      color: Theme.of(context).accentColor, fontSize: sp(15)),
                ),
              ),
              SizedBox(
                height: h(10),
              ),
              Container(
                padding: EdgeInsets.only(left: w(20), right: w(20)),
                child: Text(
                  "answer just three questions to cut the crap and get down to the real stuff",
                  style: TextStyle(color: Color(0xffa5a5a5), fontSize: sp(11)),
                ),
              ),
              SizedBox(
                height: h(20),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return VerificationScreen();
                  // }
                  // ));
                },
                child: Container(
                  margin: EdgeInsets.only(left: w(20)),
                  height: h(60),
                  width: w(350),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xfffa5473)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    "Add My profile Qs",
                    style: TextStyle(
                        fontSize: sp(18),
                        fontWeight: FontWeight.bold,
                        color: Color(0xfffa5473)),
                  )),
                ),
              ),
              SizedBox(
                height: h(20),
              ),
              Container(
                padding: EdgeInsets.only(left: w(20)),
                child: Text(
                  "APPEARANCE",
                  style: TextStyle(
                      color: Theme.of(context).accentColor, fontSize: sp(15)),
                ),
              ),
              SizedBox(
                height: h(5),
              ),
              appearance(Icons.favorite, "Relationship"),
              SizedBox(
                height: h(3),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: h(5),
                  left: w(10),
                ),
                height: h(50),
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).backgroundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                            height: h(20),
                            width: w(20),
                            child: Container(
                              padding: EdgeInsets.only(
                                left: w(5),
                              ),
                              child: Image.asset(
                                "assets/images/Sexuality2.png",
                                color: Color(0xfffa5473),
                              ),
                            )),
                        Container(
                          padding: EdgeInsets.only(
                            left: w(10),
                          ),
                          child: Text(
                            "Sexuality",
                            style: TextStyle(
                                fontSize: sp(17),
                                color: Theme.of(context).accentColor),
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        right: w(10),
                      ),
                      child: Icon(
                        Icons.navigate_next,
                        color: Color(0xfffa5473),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: h(3),
              ),
              appearance(Icons.height, "Height"),
              SizedBox(
                height: h(3),
              ),
              appearance(Icons.visibility, "Eyes"),
              SizedBox(
                height: h(3),
              ),
              appearance2("assets/images/hair2.png", "Hair"),
              SizedBox(
                height: h(3),
              ),
              appearance2("assets/images/Sexuality.png", "Body Type"),
              SizedBox(
                height: h(3),
              ),
              appearance2("assets/images/Living.png", "Living"),
              SizedBox(
                height: h(3),
              ),
              appearance2("assets/images/GroupType.png", "Body Type"),
              SizedBox(
                height: h(3),
              ),
              appearance2("assets/images/Kids.png", "Kids"),
              SizedBox(
                height: h(3),
              ),
              appearance(Icons.smoking_rooms, "Smoking"),
              SizedBox(
                height: h(3),
              ),
              appearance(Icons.wine_bar, "Drinking"),
              SizedBox(
                height: h(3),
              ),
              appearance(Icons.volume_up, "I Speak"),
              SizedBox(
                height: h(3),
              ),
              appearance(Icons.thumb_up, "What I Honest Want"),
              SizedBox(
                height: h(3),
              ),
              appearance2("assets/images/work.png", "Work"),
              SizedBox(
                height: h(3),
              ),
              appearance2(
                "assets/images/education.png",
                "Education",
              ),
              SizedBox(
                height: h(10),
              ),
              Container(
                padding: EdgeInsets.only(left: w(20)),
                child: Text(
                  "GENDER",
                  style: TextStyle(
                      color: Theme.of(context).accentColor, fontSize: sp(15)),
                ),
              ),
              SizedBox(
                height: h(5),
              ),
              Container(
                color: Theme.of(context).backgroundColor,
                height: h(100),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: w(110)),
                          child: Text(
                            "Male",
                            style: TextStyle(
                                fontSize: sp(17),
                                color: Theme.of(context).accentColor),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: w(100),
                          ),
                          child: Text("Female",
                              style: TextStyle(
                                  fontSize: sp(17),
                                  color: Theme.of(context).accentColor)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: h(10),
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: w(115),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              statusForGender = false;
                            });
                          },
                          child: statusForGender == false
                              ? Container(
                                  height: h(25),
                                  width: w(25),
                                  decoration: BoxDecoration(
                                    color: Color(0xfffa5473),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: w(20),
                                  ),
                                )
                              : Container(
                                  height: h(25),
                                  width: w(25),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Theme.of(context).accentColor),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                        ),
                        SizedBox(
                          width: w(124),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              statusForGender = true;
                            });
                          },
                          child: statusForGender == false
                              ? Container(
                                  height: h(25),
                                  width: w(25),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Theme.of(context).accentColor),
                                    shape: BoxShape.circle,
                                  ),
                                )
                              : Container(
                                  height: h(25),
                                  width: w(25),
                                  // margin: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xfffa5473),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: w(20),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: w(20)),
                    child: Text(
                      "INTERESTS",
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: sp(15)),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(),
                        height: h(8),
                        width: w(8),
                        decoration: BoxDecoration(
                            color: Color(0xffff61a1),
                            borderRadius: BorderRadius.circular(w(10))),
                      ),
                      SizedBox(
                        width: w(5),
                      ),
                      Container(
                        padding: EdgeInsets.only(),
                        height: h(8),
                        width: w(8),
                        decoration: BoxDecoration(
                            color:
                                themeController.themeValue.toString() == "dark"
                                    ? Color(0xff555557)
                                    : Colors.black12,
                            borderRadius: BorderRadius.circular(w(10))),
                      ),
                      SizedBox(
                        width: w(5),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: w(20)),
                        height: h(8),
                        width: w(8),
                        decoration: BoxDecoration(
                            color:
                                themeController.themeValue.toString() == "dark"
                                    ? Color(0xff555557)
                                    : Colors.black12,
                            borderRadius: BorderRadius.circular(w(10))),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: h(20),
              ),
              Row(
                children: [
                  SizedBox(
                    width: w(20),
                  ),
                  Container(
                    height: h(30),
                    width: w(100),
                    decoration: BoxDecoration(
                        color: Color(0xfffa5473),
                        borderRadius: BorderRadius.circular(w(30))),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/astrology.png"),
                        SizedBox(
                          width: w(5),
                        ),
                        Text(
                          "Astrology",
                          style:
                              TextStyle(color: Colors.white, fontSize: sp(12)),
                        ),
                      ],
                    )),
                  ),
                  SizedBox(
                    width: w(5),
                  ),
                  Container(
                    height: h(30),
                    width: w(100),
                    decoration: BoxDecoration(
                        color: Color(0xfffa5473),
                        borderRadius: BorderRadius.circular(w(30))),
                    child: Center(
                        child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: h(7)),
                            child: Image.asset("assets/images/gif.png",
                                height: h(20),
                                width: w(20),
                                color: Colors.white)),
                        SizedBox(
                          width: w(5),
                        ),
                        Text(
                          "Animator",
                          style:
                              TextStyle(color: Colors.white, fontSize: sp(12)),
                        ),
                      ],
                    )),
                  ),
                  SizedBox(
                    width: w(5),
                  ),
                  Container(
                    height: h(30),
                    width: w(100),
                    decoration: BoxDecoration(
                        color: Color(0xfffa5473),
                        borderRadius: BorderRadius.circular(w(30))),
                    child: Center(
                        child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: h(7)),
                            child: Image.asset("assets/images/animals.png",
                                height: h(20),
                                width: w(20),
                                color: Colors.white)),
                        SizedBox(width: w(5)),
                        Text(
                          "Animals",
                          style:
                              TextStyle(color: Colors.white, fontSize: sp(12)),
                        ),
                      ],
                    )),
                  ),
                  SizedBox(
                    width: w(20),
                  ),
                  Container(
                    height: h(30),
                    width: w(30),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xfffa5473),
                        ),
                        borderRadius: BorderRadius.circular(w(30))),
                    child: Icon(
                      Icons.add,
                      size: 24,
                      color: Color(0xfffa5473),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: h(20),
              ),
              Container(
                padding: EdgeInsets.only(left: w(20)),
                child: Text(
                  "INSTAGRAM PHOTOS",
                  style: TextStyle(
                      color: Theme.of(context).accentColor, fontSize: sp(15)),
                ),
              ),
              SizedBox(
                height: h(5),
              ),
              Container(
                height: h(50),
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).backgroundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: w(20)),
                            child: Image.asset(
                              "assets/images/instagram.png",
                              color: Colors.pink,
                              height: h(30),
                              width: w(30),
                            )),
                        Container(
                            padding: EdgeInsets.only(left: w(10)),
                            child: Text(
                              "Connect Instagram",
                              style: TextStyle(
                                  fontSize: sp(17),
                                  color: Theme.of(context).accentColor),
                            ))
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.only(right: w(20)),
                        child: Text(
                          "CONNECT",
                          style: TextStyle(
                              color: Color(0xfffa5473), fontSize: sp(15)),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: h(20),
              ),
              Container(
                padding: EdgeInsets.only(left: w(20)),
                child: Text(
                  "SPOTIFY TRACKS",
                  style: TextStyle(
                      color: Theme.of(context).accentColor, fontSize: sp(15)),
                ),
              ),
              SizedBox(
                height: h(5),
              ),
              Container(
                height: h(50),
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).backgroundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                            height: h(50),
                            width: w(50),
                            padding: EdgeInsets.only(left: w(20)),
                            child: Image.network(
                              "https://www.freepnglogos.com/uploads/spotify-logo-png/file-spotify-logo-png-4.png",
                            )),
                        Container(
                            padding: EdgeInsets.only(left: w(10)),
                            child: Text(
                              "Connect Spotify",
                              style: TextStyle(
                                  fontSize: sp(17),
                                  color: Theme.of(context).accentColor),
                            ))
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.only(right: w(20)),
                        child: Text(
                          "CONNECT",
                          style: TextStyle(
                              color: Color(0xfffa5473), fontSize: sp(15)),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: h(30),
              ),
              Container(
                height: h(60),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "b",
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontFamily: "Antipasto Pro Demibold",
                                  fontWeight: FontWeight.bold,
                                  fontSize: sp(60)),
                            ),
                            Text("love",
                                style: TextStyle(
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Antipasto Pro Demibold",
                                    fontSize: sp(60),
                                    color: Colors.pink[300])),
                            SizedBox(
                              width: w(3),
                            ),
                            Text("d",
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Pridi",
                                    fontSize: sp(60)))
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: w(250),
                      top: h(9),
                      child: RotationTransition(
                          turns: new AlwaysStoppedAnimation(15 / 360),
                          child: Icon(
                            Icons.favorite,
                            color: Colors.pink[300],
                            size: 7,
                          )),
                    ),
                    Positioned(
                      left: w(245),
                      top: h(3),
                      child: RotationTransition(
                          turns: new AlwaysStoppedAnimation(15 / 360),
                          child: Icon(Icons.favorite,
                              color: Colors.pink[300], size: 5)),
                    ),
                    Positioned(
                      left: w(243),
                      top: h(18),
                      child: RotationTransition(
                          turns: new AlwaysStoppedAnimation(15 / 360),
                          child: Icon(
                            Icons.favorite,
                            color: Colors.pink[300],
                            size: 10,
                          )),
                    ),
                    Positioned(
                      left: w(255),
                      top: h(15),
                      child: RotationTransition(
                          turns: new AlwaysStoppedAnimation(330 / 360),
                          child: Icon(
                            Icons.favorite,
                            color: Colors.pink[300],
                            size: 8,
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: h(30),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appearance(var ion, String txt) {
    return Container(
      padding: EdgeInsets.only(
        top: h(5),
        left: w(10),
      ),
      height: h(50),
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                child: Icon(
                  ion,
                  color: Color(0xfffa5473),
                  size: 20,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: w(10),
                ),
                child: Text(
                  txt,
                  style: TextStyle(
                      fontSize: sp(17), color: Theme.of(context).accentColor),
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(
              right: w(10),
            ),
            child: Icon(
              Icons.navigate_next,
              color: Color(0xfffa5473),
            ),
          ),
        ],
      ),
    );
  }

  Widget appearance2(var img, String txt) {
    return Container(
      padding: EdgeInsets.only(
        top: h(5),
        left: w(10),
      ),
      height: h(50),
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  child: Container(
                padding: EdgeInsets.only(
                  left: w(5),
                ),
                child: Image.asset(
                  img,
                  color: Color(0xfffa5473),
                ),
              )),
              Container(
                padding: EdgeInsets.only(
                  left: w(10),
                ),
                child: Text(
                  txt,
                  style: TextStyle(
                      fontSize: sp(17), color: Theme.of(context).accentColor),
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(
              right: w(10),
            ),
            child: Icon(
              Icons.navigate_next,
              color: Color(0xfffa5473),
            ),
          )
        ],
      ),
    );
  }
}
