import 'package:bloved/Controllers/darklightTheme.dart';
import 'package:bloved/Models/user_model.dart';
import 'package:bloved/Views/Profile.dart';
import 'package:bloved/Views/chat_screen.dart';
import 'package:bloved/utilities/ThemeManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:bloved/utilities/StorageManager.dart';

class MainHomePage extends StatefulWidget {
  MainHomePage({Key? key}) : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

Future<bool> _willPopCallback() async {
  print("Nithin");
  return true; // return true if the route to be popped
}

class _MainHomePageState extends State<MainHomePage> {
  bool showMore = false;
  final w = ScreenUtil().setWidth;
  final h = ScreenUtil().setHeight;
  final sp = ScreenUtil().setSp;
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);
  var themeColor;
  var controller = Get.put(ThemeValue());

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    print(controller.themeValue.toString());
    Dialog errorDialog = Dialog(
      insetPadding:
          EdgeInsets.only(left: w(20), right: w(20), top: 0.0, bottom: 0.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(15)),
        height: h(450.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: h(40),
            ),
            Center(
              child: Container(
                child: Text(
                  "It's a Match",
                  style: TextStyle(
                      fontSize: sp(18),
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: h(10),
            ),
            Center(
              child: Container(
                child: Text(
                  "You and Amanda have liked each other",
                  style: TextStyle(color: Theme.of(context).dividerColor),
                ),
              ),
            ),
            SizedBox(
              height: h(20),
            ),
            Center(
              child: Container(
                width: w(370),
                height: h(110),
                child: Stack(
                  // alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: w(200),
                      child: Container(
                        height: h(100),
                        width: w(100),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/img1.png"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(w(50)),
                            border:
                                Border.all(color: Colors.white, width: h(4)),
                            color: Colors.red),
                      ),
                    ),
                    Positioned(
                      left: w(60),
                      child: Container(
                        height: h(100),
                        width: w(100),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.white, width: h(4)),
                            image: DecorationImage(
                                image: AssetImage("assets/images/image2.png"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(w(50)),
                            color: Colors.blue),
                      ),
                    ),
                    Positioned(
                        left: w(150),
                        top: h(20),
                        child: Container(
                          // padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(30),
                              // border: Border.all(color: Colors.white)
                              ),
                          child: Container(
                            height: h(60),
                            width: w(60),
                            decoration: BoxDecoration(
                                color: Colors.pink,
                                border:
                                    Border.all(color: Colors.white, width: 3),
                                borderRadius: BorderRadius.circular(w(30))),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: h(20),
            ),
            Center(
                child: Container(
                    margin: EdgeInsets.only(left: w(50), right: w(30)),
                    child: Text(
                      "You can now send her a message using your phone",
                      style: TextStyle(color: Theme.of(context).dividerColor),
                    ))),
            SizedBox(
              height: h(20),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ChatScreen(
                      user: User(
                    id: 0,
                    name: 'Nick Fury',
                    imageUrl: 'assets/images/nick-fury.jpg',
                    isOnline: true,
                  ));
                }));
              },
              child: Container(
                margin: EdgeInsets.only(left: w(20)),
                height: h(
                  50,
                ),
                width: w(300),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(w(10)),
                    color: Colors.pink),
                child: Center(
                  child: Text(
                    "Send Messages",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: sp(18),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: h(20),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                margin: EdgeInsets.only(left: w(20)),
                height: h(
                  50,
                ),
                width: w(300),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.pink),
                  borderRadius: BorderRadius.circular(w(10)),
                ),
                child: Center(
                  child: Text(
                    "keep Swiping",
                    style: TextStyle(
                        color: Colors.pink,
                        fontSize: sp(18),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
    return Consumer<ThemeNotifier>(
        builder: (context, theme, _) => WillPopScope(
              onWillPop: _willPopCallback,
              child: Scaffold(
                  // backgroundColor: Colors.grey[100],
                  extendBodyBehindAppBar: true,
                  appBar: AppBar(
                    leading: Row(children: [
                      Container(
                        margin: EdgeInsets.only(left: w(20), top: h(10)),
                        height: h(25),
                        width: w(25),
                        decoration: BoxDecoration(
                            color: Colors.pink[400],
                            borderRadius: BorderRadius.circular(w(20))),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (conetx) {
                              return Profile();
                            }));
                          },
                          child: Icon(
                            Icons.person,
                            color: Colors.black,
                            size: w(20),
                          ),
                        ),
                      ),
                    ]),
                    centerTitle: true,
                    title: Container(
                      padding: EdgeInsets.only(top: h(10)),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  "b",
                                  style: GoogleFonts.ubuntu(
                                      fontSize: sp(26),
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "love",
                                  style: GoogleFonts.ubuntu(
                                      fontSize: sp(26),
                                      color: Colors.pink[300],
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "d",
                                  style: GoogleFonts.ubuntu(
                                      color: Colors.white,
                                      fontSize: sp(26),
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          Positioned(
                            left: w(143),
                            top: h(2),
                            child: RotationTransition(
                                turns: new AlwaysStoppedAnimation(15 / 360),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.pink[300],
                                  size: 4,
                                )),
                          ),
                          Positioned(
                            left: w(140),
                            // top: h(),
                            child: RotationTransition(
                                turns: new AlwaysStoppedAnimation(15 / 360),
                                child: Icon(Icons.favorite,
                                    color: Colors.pink[300], size: 2)),
                          ),
                          Positioned(
                            left: w(142),
                            top: h(7),
                            child: RotationTransition(
                                turns: new AlwaysStoppedAnimation(15 / 360),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.pink[300],
                                  size: 6,
                                )),
                          ),
                          Positioned(
                            left: w(147),
                            top: h(4),
                            child: RotationTransition(
                                turns: new AlwaysStoppedAnimation(330 / 360),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.pink[300],
                                  size: 5,
                                )),
                          )
                        ],
                      ),
                    ),
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    actions: [
                      Container(
                        padding: EdgeInsets.only(right: w(40), top: h(10)),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => errorDialog);
                          },
                          child: Icon(
                            Icons.forum,
                            color: Colors.pink[400],
                          ),
                        ),
                      )
                    ],
                  ),
                  // backgroundColor: Colors.grey[50],
                  body: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: h(680),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(

                                  // gradient: LinearGradient(
                                  //     colors: [Colors.white, Colors.white],
                                  //     // begin: Alignment.center,
                                  //     stops: [0.0, 0.9]),
                                  image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/profile.png",
                                ),
                                fit: BoxFit.cover,
                                // colorFilter: ColorFilter.mode(
                                //     Colors.black.withOpacity(0.7), BlendMode.dstATop),
                              )),
                            ),
                            Obx(
                              () => Positioned.fill(
                                  child: Container(
                                      padding: EdgeInsets.all(0.0),
                                      decoration: BoxDecoration(
                                          // borderRadius: BorderRadius.all(Radius.circular(0)),
                                          gradient: controller.themeValue
                                                      .toString() ==
                                                  "dark"
                                              ? LinearGradient(
                                                  colors: [
                                                    Colors.black,
                                                    Colors.transparent,
                                                    Colors.black12,
                                                    Colors.black
                                                  ],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  stops: [0, 0, 0.6, 1],
                                                )
                                              : LinearGradient(
                                                  colors: [
                                                    Colors.white,
                                                    Colors.transparent,
                                                    Colors.white30,
                                                    Colors.white
                                                  ],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  stops: [0, 0, 0.6, 1],
                                                )))),
                            ),
                            Positioned(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: h(550),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: w(20)),
                                        padding: EdgeInsets.only(
                                            left: w(10),
                                            right: w(10),
                                            top: h(10),
                                            bottom: h(10)),
                                        height: h(40),
                                        width: w(40),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(w(30))),
                                        child: Image.asset(
                                          "assets/images/Reverse.png",
                                          color: Colors.pink,
                                        ),
                                      ),
                                      Container(
                                          height: h(40),
                                          width: w(40),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(w(30))),
                                          child: Icon(Icons.thumb_down_outlined,
                                              size: w(20), color: Colors.pink)),
                                      Container(
                                        height: h(40),
                                        width: w(40),
                                        decoration: BoxDecoration(
                                            color: Colors.pink[300],
                                            borderRadius:
                                                BorderRadius.circular(w(30))),
                                        child: Image.asset(
                                          "assets/images/chat.png",
                                          color: Colors.white,
                                        ),
                                      ),
                                      Container(
                                        height: h(40),
                                        width: w(40),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(w(30))),
                                        child: Icon(Icons.thumb_up_outlined,
                                            size: 20, color: Colors.pink),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: w(20)),
                                        padding: EdgeInsets.only(
                                            left: w(12),
                                            top: h(12),
                                            bottom: w(12),
                                            right: w(12)),
                                        height: h(40),
                                        width: w(40),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(w(30))),
                                        child: Image.asset(
                                            "assets/images/flag.png",
                                            color: Colors.pink),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: h(20),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: w(20)),
                                        child: Text(
                                          "Kathryn, ",
                                          style: TextStyle(
                                              fontSize: sp(24),
                                              color:
                                                  Theme.of(context).accentColor,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: w(0)),
                                        child: Text(
                                          "21",
                                          style: TextStyle(
                                              fontSize: sp(24),
                                              color:
                                                  Theme.of(context).accentColor,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: w(5)),
                                        height: h(20),
                                        width: w(20),
                                        child: Image.asset(
                                            "assets/images/verifiedMark.png"),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: h(5),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: w(20)),
                                        child: Image.asset(
                                            "assets/images/student.png",
                                            color:
                                                Theme.of(context).accentColor),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: w(5)),
                                        child: Text(
                                          "Student",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .accentColor),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: w(5)),
                                        child: Icon(Icons.location_on_outlined,
                                            size: 18,
                                            color:
                                                Theme.of(context).accentColor),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: w(5)),
                                        child: Text(
                                          "2 miles away",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .accentColor),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: w(20),
                            ),
                            Container(
                                height: h(3),
                                width: w(80),
                                decoration:
                                    BoxDecoration(color: Colors.pink[300])),
                            SizedBox(
                              width: w(10),
                            ),
                            Obx(() => controller.themeValue.toString() == "dark"
                                ? Container(
                                    height: h(3),
                                    width: w(80),
                                    decoration:
                                        BoxDecoration(color: Colors.white38))
                                : Container(
                                    height: h(3),
                                    width: w(80),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300]))),
                            SizedBox(
                              width: w(10),
                            ),
                            Obx(() => controller.themeValue.toString() == "dark"
                                ? Container(
                                    height: h(3),
                                    width: w(80),
                                    decoration:
                                        BoxDecoration(color: Colors.white38))
                                : Container(
                                    height: h(3),
                                    width: w(80),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300]))),
                            SizedBox(
                              width: w(10),
                            ),
                            Obx(() => controller.themeValue.toString() == "dark"
                                ? Container(
                                    height: h(3),
                                    width: w(80),
                                    decoration:
                                        BoxDecoration(color: Colors.white38))
                                : Container(
                                    height: h(3),
                                    width: w(80),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300]))),
                          ],
                        ),
                        SizedBox(
                          height: h(30),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.only(),
                              height: h(10),
                              width: w(10),
                              decoration: BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            SizedBox(
                              width: w(5),
                            ),
                            Obx(
                              () => controller.themeValue.toString() == "dark"
                                  ? Container(
                                      padding: EdgeInsets.only(),
                                      height: h(10),
                                      width: w(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white30,
                                          borderRadius:
                                              BorderRadius.circular(w(10))),
                                    )
                                  : Container(
                                      padding: EdgeInsets.only(),
                                      height: h(10),
                                      width: w(10),
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(w(10))),
                                    ),
                            ),
                            SizedBox(
                              width: w(20),
                            ),
                            // Container(
                            //   margin: EdgeInsets.only(right: w(20)),
                            //   height: h(10),
                            //   width: w(10),
                            //   decoration: BoxDecoration(
                            //       color: Colors.grey,
                            //       borderRadius: BorderRadius.circular(10)),
                            // )
                          ],
                        ),
                        SizedBox(
                          height: h(10),
                        ),
                        Flexible(
                          child: Row(
                            // scrollDirection: Axis.horizontal,
                            children: [
                              SizedBox(
                                width: w(20),
                              ),
                              Container(
                                height: h(120),
                                width: w(110),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).backgroundColor,
                                    borderRadius: BorderRadius.circular(w(10))),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(top: h(10)),
                                        child: Image.asset(
                                          "assets/images/weight.png",
                                          color: Theme.of(context).accentColor,
                                        )),
                                    Container(
                                      child: Text(
                                        "Weight",
                                        style: TextStyle(
                                          color: Theme.of(context).accentColor,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(bottom: h(10)),
                                      child: Text(
                                        "30",
                                        style:
                                            TextStyle(color: Colors.pink[300]),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: w(10),
                              ),
                              Container(
                                height: h(120),
                                width: w(110),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).backgroundColor,
                                    borderRadius: BorderRadius.circular(w(10))),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(top: h(10)),
                                        child: Image.asset(
                                          "assets/images/height.png",
                                          color: Theme.of(context).accentColor,
                                        )),
                                    Container(
                                      child: Text(
                                        "Height",
                                        style: TextStyle(
                                          color: Theme.of(context).accentColor,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(bottom: h(10)),
                                      child: Text(
                                        "30",
                                        style:
                                            TextStyle(color: Colors.pink[300]),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: w(10),
                              ),
                              Container(
                                height: h(120),
                                width: w(110),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).backgroundColor,
                                    borderRadius: BorderRadius.circular(w(10))),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(top: h(10)),
                                        child: Icon(
                                          Icons.visibility,
                                          size: 30,
                                          color: Theme.of(context).accentColor,
                                        )),
                                    Container(
                                      child: Text(
                                        "Color",
                                        style: TextStyle(
                                          color: Theme.of(context).accentColor,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(bottom: h(10)),
                                      child: Text(
                                        "30",
                                        style:
                                            TextStyle(color: Colors.pink[300]),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: h(20),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(w(10))),
                          margin: EdgeInsets.only(
                            left: w(20),
                            right: w(20),
                          ),
                          child: Container(
                            padding: EdgeInsets.only(
                                left: w(20),
                                right: w(5),
                                top: h(20),
                                bottom: h(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    padding: EdgeInsets.only(left: w(0)),
                                    child: Text(
                                      "BIO",
                                      style: TextStyle(
                                          fontSize: sp(16),
                                          color: Theme.of(context).accentColor,
                                          fontWeight: FontWeight.bold),
                                    )),
                                SizedBox(
                                  height: h(20),
                                ),
                                Stack(
                                  children: [
                                    Obx(() =>
                                        controller.themeValue.toString() ==
                                                "dark"
                                            ? Text(
                                                "My name is Mary burgess and i enjoy meeting new people and finfing ways to help them have an uplifting experience. i enjoy reading, and the knowledge",
                                                style: TextStyle(
                                                    color: Colors.white24,
                                                    letterSpacing: 1),
                                              )
                                            : Text(
                                                "My name is Mary burgess and i enjoy meeting new people and finfing ways to help them have an uplifting experience. i enjoy reading, and the knowledge",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    letterSpacing: 1),
                                              )),
                                    Obx(
                                      () => Positioned.fill(
                                          child: Container(
                                              padding: EdgeInsets.all(0.0),
                                              decoration: BoxDecoration(
                                                // borderRadius: BorderRadius.all(Radius.circular(0)),
                                                gradient: controller.themeValue
                                                                .toString() ==
                                                            "dark" ||
                                                        controller.themeValue
                                                                .toString() ==
                                                            ""
                                                    ? LinearGradient(
                                                        colors: [
                                                          Colors.transparent,
                                                          Colors.transparent,
                                                          Colors.transparent,
                                                          Colors.transparent
                                                        ],
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment
                                                            .bottomCenter,
                                                        stops: [0, 0, 0, 1])
                                                    : LinearGradient(
                                                        colors: [
                                                          Colors.white70,
                                                          Colors.white10,
                                                          Colors.white10,
                                                          Colors.white70
                                                        ],
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment
                                                            .bottomCenter,
                                                        stops: [0, 0, 0, 1],
                                                      ),
                                              ))),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: h(10),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        "Show more",
                                        style: TextStyle(
                                            color: Colors.pink[300],
                                            fontSize: sp(16)),
                                      ),
                                      Icon(
                                        Icons.expand_more,
                                        color: Colors.pink,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h(10),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w(20), right: w(20)),
                          height: h(180),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Theme.of(context).backgroundColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.only(left: w(30), top: h(20)),
                                child: Text(
                                  "Interests",
                                  style: TextStyle(
                                      fontSize: sp(18),
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.bold),
                                ),
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
                                    height: h(35),
                                    width: w(100),
                                    decoration: BoxDecoration(
                                        color: Colors.pink[300],
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Astrology",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: sp(12)),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: w(10),
                                  ),
                                  Container(
                                    height: h(35),
                                    width: w(100),
                                    decoration: BoxDecoration(
                                        color: Colors.blue[50],
                                        borderRadius:
                                            BorderRadius.circular(w(20))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset("assets/images/gif.png"),
                                        SizedBox(
                                          width: w(5),
                                        ),
                                        Text(
                                          "Animator",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: sp(12)),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: w(10),
                                  ),
                                  Container(
                                    height: h(35),
                                    width: w(100),
                                    decoration: BoxDecoration(
                                        color: Colors.blue[50],
                                        borderRadius:
                                            BorderRadius.circular(w(20))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            "assets/images/animals.png"),
                                        SizedBox(
                                          width: w(5),
                                        ),
                                        Text(
                                          "Animals",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: sp(12)),
                                        )
                                      ],
                                    ),
                                  )
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
                                    height: h(35),
                                    width: w(100),
                                    decoration: BoxDecoration(
                                        color: Colors.blue[50],
                                        borderRadius:
                                            BorderRadius.circular(w(20))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset("assets/images/acting.png"),
                                        SizedBox(
                                          width: w(5),
                                        ),
                                        Text(
                                          "Acting",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: sp(12)),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: w(10),
                                  ),
                                  Container(
                                    height: h(35),
                                    width: w(100),
                                    decoration: BoxDecoration(
                                        color: Colors.pink[300],
                                        borderRadius:
                                            BorderRadius.circular(w(20))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Sleeping",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: sp(12)),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: w(10),
                                  ),
                                  Container(
                                    height: h(35),
                                    width: w(100),
                                    decoration: BoxDecoration(
                                        color: Colors.pink[300],
                                        borderRadius:
                                            BorderRadius.circular(w(20))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Dancing",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: sp(12)),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: h(10),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).backgroundColor,
                              borderRadius: BorderRadius.circular(10)),
                          margin: EdgeInsets.only(left: w(20), right: w(20)),
                          height: h(260),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(
                                          left: w(30), top: h(20)),
                                      child: Text(
                                        "City",
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).accentColor,
                                            fontSize: sp(16),
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(
                                              left: w(30),
                                              top: h(20),
                                              right: w(20)),
                                          child: Text(
                                            "Pakistan",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .accentColor,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Container(
                                          padding: EdgeInsets.only(
                                              left: w(30), right: h(20)),
                                          child: Text(
                                            "Jahara",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .accentColor,
                                                fontSize: sp(12)),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: h(10),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                ),
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: w(30), right: w(20)),
                                  height: h(170),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(w(30))),
                                  width: MediaQuery.of(context).size.width,
                                  child: GoogleMap(
                                    onMapCreated: _onMapCreated,
                                    initialCameraPosition: CameraPosition(
                                      target: _center,
                                      zoom: 11.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: h(10),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w(20), right: w(20)),
                          height: h(300),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Theme.of(context).backgroundColor,
                              borderRadius: BorderRadius.circular(w(10))),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: w(20), top: h(20)),
                                    child: Text("Instagram Photos",
                                        style: TextStyle(
                                            fontSize: sp(16),
                                            color:
                                                Theme.of(context).accentColor,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: h(20)),
                                        height: h(10),
                                        width: w(10),
                                        decoration: BoxDecoration(
                                            color: Colors.pink,
                                            borderRadius:
                                                BorderRadius.circular(w(10))),
                                      ),
                                      SizedBox(
                                        width: w(5),
                                      ),
                                      Obx(
                                        () => controller.themeValue
                                                    .toString() ==
                                                "dark"
                                            ? Container(
                                                margin:
                                                    EdgeInsets.only(top: h(20)),
                                                height: h(10),
                                                width: w(10),
                                                decoration: BoxDecoration(
                                                    color: Colors.white30,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            w(10))),
                                              )
                                            : Container(
                                                margin:
                                                    EdgeInsets.only(top: h(20)),
                                                height: h(10),
                                                width: w(10),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            w(10))),
                                              ),
                                      ),
                                      SizedBox(
                                        width: w(5),
                                      ),
                                      Obx(
                                        () => controller.themeValue
                                                    .toString() ==
                                                "dark"
                                            ? Container(
                                                margin: EdgeInsets.only(
                                                    top: h(20), right: w(20)),
                                                height: h(10),
                                                width: w(10),
                                                decoration: BoxDecoration(
                                                    color: Colors.white30,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            w(10))),
                                              )
                                            : Container(
                                                margin: EdgeInsets.only(
                                                    top: h(20), right: w(20)),
                                                height: h(10),
                                                width: w(10),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            w(10))),
                                              ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: h(100),
                                    width: w(100),
                                    margin: EdgeInsets.only(
                                        top: h(10), left: w(20)),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(w(10)),
                                        image: DecorationImage(
                                            image: AssetImage(
                                              "assets/images/img1.png",
                                            ),
                                            fit: BoxFit.cover)),
                                  ),
                                  Container(
                                    height: h(100),
                                    width: w(100),
                                    margin: EdgeInsets.only(
                                        top: h(10), left: w(10)),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(w(10)),
                                        image: DecorationImage(
                                            image: AssetImage(
                                              "assets/images/image2.png",
                                            ),
                                            fit: BoxFit.cover)),
                                  ),
                                  Container(
                                    height: h(100),
                                    width: w(100),
                                    margin: EdgeInsets.only(
                                        top: h(10), left: w(10)),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(w(10)),
                                        image: DecorationImage(
                                            image: AssetImage(
                                              "assets/images/image3.png",
                                            ),
                                            fit: BoxFit.cover)),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: h(100),
                                    width: w(100),
                                    margin: EdgeInsets.only(
                                        top: h(10), left: w(20)),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(w(10)),
                                        image: DecorationImage(
                                            image: AssetImage(
                                              "assets/images/image4.png",
                                            ),
                                            fit: BoxFit.cover)),
                                  ),
                                  Container(
                                    height: h(100),
                                    width: w(100),
                                    margin: EdgeInsets.only(
                                        top: h(10), left: w(10)),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(w(10)),
                                        image: DecorationImage(
                                            image: AssetImage(
                                              "assets/images/image2.png",
                                            ),
                                            fit: BoxFit.cover)),
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: h(100),
                                        width: w(100),
                                        margin: EdgeInsets.only(
                                            top: h(10), left: w(10)),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(w(10)),
                                            image: DecorationImage(
                                                colorFilter: ColorFilter.mode(
                                                    Colors.black
                                                        .withOpacity(0.7),
                                                    BlendMode.darken),
                                                image: AssetImage(
                                                  "assets/images/image4.png",
                                                ),
                                                fit: BoxFit.cover)),
                                      ),
                                      Positioned(
                                          top: h(40),
                                          left: w(40),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                "5",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: sp(20)),
                                              )
                                            ],
                                          ))
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: h(10),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).backgroundColor,
                              borderRadius: BorderRadius.circular(w(10))),
                          margin: EdgeInsets.only(left: w(20), right: w(20)),
                          height: h(160),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: w(20), top: h(20)),
                                    child: Text("My Top Spotify Tracks",
                                        style: TextStyle(
                                            fontSize: sp(16),
                                            color:
                                                Theme.of(context).accentColor,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: h(20)),
                                        height: h(10),
                                        width: w(10),
                                        decoration: BoxDecoration(
                                            color: Colors.pink,
                                            borderRadius:
                                                BorderRadius.circular(w(10))),
                                      ),
                                      SizedBox(
                                        width: w(5),
                                      ),
                                      Obx(
                                        () => controller.themeValue
                                                    .toString() ==
                                                "dark"
                                            ? Container(
                                                margin:
                                                    EdgeInsets.only(top: h(20)),
                                                height: h(10),
                                                width: w(10),
                                                decoration: BoxDecoration(
                                                    color: Colors.white30,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            w(10))),
                                              )
                                            : Container(
                                                margin: EdgeInsets.only(
                                                  top: h(20),
                                                ),
                                                height: h(10),
                                                width: w(10),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            w(10))),
                                              ),
                                      ),
                                      SizedBox(
                                        width: w(5),
                                      ),
                                      Obx(
                                        () => controller.themeValue
                                                    .toString() ==
                                                "dark"
                                            ? Container(
                                                margin: EdgeInsets.only(
                                                    top: h(20), right: w(20)),
                                                height: h(10),
                                                width: w(10),
                                                decoration: BoxDecoration(
                                                    color: Colors.white30,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            w(10))),
                                              )
                                            : Container(
                                                margin: EdgeInsets.only(
                                                    top: h(20), right: w(20)),
                                                height: h(10),
                                                width: w(10),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            w(10))),
                                              ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: h(100),
                                        width: w(100),
                                        margin: EdgeInsets.only(
                                            top: h(10), left: w(20)),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                colorFilter: ColorFilter.mode(
                                                    Colors.black
                                                        .withOpacity(0.6),
                                                    BlendMode.darken),
                                                image: AssetImage(
                                                  "assets/images/img1.png",
                                                ),
                                                fit: BoxFit.cover)),
                                      ),
                                      Positioned(
                                          top: h(40),
                                          left: w(40),
                                          child: Container(
                                            child: Icon(
                                              Icons.play_arrow_rounded,
                                              size: sp(40),
                                              color: Colors.grey[400],
                                            ),
                                          )),
                                      Positioned(
                                          top: h(90),
                                          left: w(40),
                                          child: Container(
                                            height: h(10),
                                            width: w(65),
                                            child: Text(
                                              "Russ-Best on the ",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: sp(10)),
                                            ),
                                          ))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: h(100),
                                            width: w(100),
                                            margin: EdgeInsets.only(
                                                top: h(10), left: w(10)),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(w(10)),
                                                image: DecorationImage(
                                                    colorFilter:
                                                        ColorFilter.mode(
                                                            Colors
                                                                .black
                                                                .withOpacity(
                                                                    0.7),
                                                            BlendMode.darken),
                                                    image: AssetImage(
                                                      "assets/images/image2.png",
                                                    ),
                                                    fit: BoxFit.cover)),
                                          ),
                                          Positioned(
                                              top: h(40),
                                              left: w(40),
                                              child: Container(
                                                child: Icon(
                                                  Icons.play_arrow_rounded,
                                                  size: sp(40),
                                                  color: Colors.grey[400],
                                                ),
                                              )),
                                          Positioned(
                                              top: h(90),
                                              left: w(40),
                                              child: Container(
                                                height: h(10),
                                                width: w(65),
                                                child: Text(
                                                  "Russ-Best on the ",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: sp(10)),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: h(100),
                                            width: w(100),
                                            margin: EdgeInsets.only(
                                                top: h(10), left: w(10)),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(w(10)),
                                                image: DecorationImage(
                                                    colorFilter:
                                                        ColorFilter.mode(
                                                            Colors
                                                                .black
                                                                .withOpacity(
                                                                    0.7),
                                                            BlendMode.darken),
                                                    image: AssetImage(
                                                      "assets/images/image3.png",
                                                    ),
                                                    fit: BoxFit.cover)),
                                          ),
                                          Positioned(
                                              top: h(40),
                                              left: w(40),
                                              child: Container(
                                                child: Icon(
                                                  Icons.play_arrow_rounded,
                                                  size: sp(40),
                                                  color: Colors.grey[400],
                                                ),
                                              )),
                                          Positioned(
                                              top: h(90),
                                              left: w(40),
                                              child: Container(
                                                height: h(10),
                                                width: w(65),
                                                child: Text(
                                                  "Russ-Best on the ",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: sp(10)),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: h(5),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(w(10)),
                            color: Theme.of(context).backgroundColor,
                          ),
                          padding: EdgeInsets.only(
                            top: h(20),
                            bottom: h(20),
                          ),
                          margin: EdgeInsets.only(left: w(20), right: w(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  left: w(20),
                                  top: h(10),
                                ),
                                child: Text(
                                  "Social Media",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).accentColor,
                                      fontSize: sp(16)),
                                ),
                              ),
                              SizedBox(
                                height: h(20),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(
                                          right: w(13),
                                          left: w(13),
                                          top: h(13),
                                          bottom: h(13)),
                                      margin: EdgeInsets.only(left: w(40)),
                                      height: h(60),
                                      width: w(60),
                                      decoration: BoxDecoration(
                                          color: Colors.pink[50],
                                          borderRadius:
                                              BorderRadius.circular(w(30))),
                                      child: Image.asset(
                                        "assets/images/snapchat.png",
                                        color: Colors.pink,
                                      )),
                                  Container(
                                      height: h(60),
                                      width: w(60),
                                      padding: EdgeInsets.only(
                                          right: w(13),
                                          left: w(13),
                                          top: h(13),
                                          bottom: h(13)),
                                      decoration: BoxDecoration(
                                          color: Colors.pink[50],
                                          borderRadius:
                                              BorderRadius.circular(w(30))),
                                      child: Image.asset(
                                        "assets/images/facebook.png",
                                        color: Colors.pink,
                                      )),
                                  Container(
                                      height: h(60),
                                      width: w(60),
                                      padding: EdgeInsets.only(
                                          right: w(13),
                                          left: w(13),
                                          top: h(13),
                                          bottom: h(13)),
                                      decoration: BoxDecoration(
                                          color: Colors.pink[50],
                                          borderRadius:
                                              BorderRadius.circular(w(30))),
                                      child: Image.asset(
                                        "assets/images/tiktok.png",
                                        color: Colors.pink,
                                      )),
                                  Container(
                                      margin: EdgeInsets.only(right: w(40)),
                                      padding: EdgeInsets.only(
                                          right: w(13),
                                          left: w(13),
                                          top: h(13),
                                          bottom: h(13)),
                                      height: h(60),
                                      width: w(60),
                                      decoration: BoxDecoration(
                                          color: Colors.pink[50],
                                          borderRadius:
                                              BorderRadius.circular(w(30))),
                                      child: Image.asset(
                                          "assets/images/instagram.png",
                                          color: Colors.pink))
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: h(20),
                        ),
                        Container(
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
                              color: Colors.pink[300],
                              borderRadius: BorderRadius.circular(w(10))),
                          child: Center(
                              child: Text(
                            "Share Profile",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                        ),
                        SizedBox(
                          height: h(20),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: w(0),
                          ),
                          child: Text(
                            "See What A Friend Thinks",
                            style: TextStyle(
                                fontSize: sp(20),
                                color: Theme.of(context).dividerColor),
                          ),
                        ),
                        SizedBox(
                          height: h(30),
                        ),
                      ],
                    ),
                  )),
            ));
  }
}

// ShaderMask(
//   shaderCallback: (rect) {
//     return LinearGradient(
//       begin: Alignment.topCenter,
//       end: Alignment.bottomCenter,
//       colors: [Colors.black, Colors.transparent],
//     ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
//   },
//   blendMode: BlendMode.dstIn,
//   child: Image.asset(
//     'assets/chrome.png',
//     height: 400,
//     fit: BoxFit.contain,
//   ),
// ),



// Container(
//                 margin: EdgeInsets.only(left: w(20), right: w(20)),
//                 height: h(200),
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       padding: EdgeInsets.only(left: w(20), top: h(20)),
//                       child: Text(
//                         "Bio",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: sp(16)),
//                       ),
//                     ),
//                     SizedBox(
//                       height: h(20),
//                     ),
//                     Container(
//                       padding: EdgeInsets.only(left: w(20), right: w(20)),
//                       child: Text(
                        // "My name is Mary burgess and i enjoy meeting new people and finfing ways to help them have an uplifting experience. i enjoy reading, and the knowledge",
//                         style:
//                             TextStyle(letterSpacing: 2, color: Colors.black54),
//                       ),
//                     ),
//                     SizedBox(
//                       height: h(20),
//                     ),
//                     Row(
//                       children: [
//                         Container(
//                           padding: EdgeInsets.only(
//                             left: w(20),
//                           ),
//                           child: Text(
//                             "Show more",
//                             style:
//                                 TextStyle(color: Colors.pink, fontSize: sp(16)),
//                           ),
//                         ),
//                         Container(
//                           child: Icon(
//                             Icons.expand_more,
//                             color: Colors.pink,
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),



                                      


