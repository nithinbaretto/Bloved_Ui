import 'package:bloved/Controllers/darklightTheme.dart';
import 'package:bloved/Models/user_model.dart';
import 'package:bloved/Views/Profile.dart';
import 'package:bloved/Views/chat_screen.dart';
import 'package:bloved/utilities/ThemeManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

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
  final r = ScreenUtil().radius;
  final scrollController = ScrollController();
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
            color: Theme.of(context).backgroundColor,
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
                      fontSize: sp(20),
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
                        left: w(195),
                        child: Obx(
                          () => Container(
                            height: h(95),
                            width: w(95),
                            decoration: BoxDecoration(
                                color:
                                    controller.themeValue.toString() == "dark"
                                        ? Colors.white
                                        : Color(0xfff7fafd),
                                borderRadius: BorderRadius.circular(w(50))),
                            child: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/img1.png"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(r(50)),
                              ),
                            ),
                          ),
                        )),
                    Positioned(
                        left: w(70),
                        child: Obx(
                          () => Container(
                            decoration: BoxDecoration(
                                color:
                                    controller.themeValue.toString() == "dark"
                                        ? Colors.white
                                        : Color(0xfff7fafd),
                                borderRadius: BorderRadius.circular(r(50))),
                            height: h(95),
                            width: w(95),
                            child: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  // border:
                                  //     Border.all(color: Colors.white, width: h(4)),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/image2.png"),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(r(50)),
                                  color: Colors.blue),
                            ),
                          ),
                        )),
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
                                color: Color(0xfffa5473),
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
                margin: EdgeInsets.only(left: w(30)),
                height: h(
                  58,
                ),
                width: w(295),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 10,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(w(10)),
                    color: Color(0xfffa5473)),
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
                margin: EdgeInsets.only(left: w(30)),
                height: h(
                  58,
                ),
                width: w(295),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.pink),
                  borderRadius: BorderRadius.circular(w(10)),
                ),
                child: Center(
                  child: Text(
                    "keep Swiping",
                    style: TextStyle(
                        color: Color(0xfffa5473),
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
                      SizedBox(
                        width: w(20),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: w(10), top: h(10)),
                        height: h(25),
                        width: w(25),
                        decoration: BoxDecoration(
                            color: Color(0xfffa5473), shape: BoxShape.circle),
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
                    title: Image.asset("assets/images/logo2.png"),
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    actions: [
                      Container(
                        padding: EdgeInsets.only(right: w(30), top: h(10)),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => errorDialog);
                          },
                          child: Icon(
                            Icons.forum,
                            color: Color(0xfffa5473),
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
                                  image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/profile.png",
                                ),
                                fit: BoxFit.cover,
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
                                            shape: BoxShape.circle),
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
                                              shape: BoxShape.circle),
                                          child: Icon(Icons.thumb_down_outlined,
                                              size: w(20), color: Colors.pink)),
                                      Container(
                                        height: h(40),
                                        width: w(40),
                                        decoration: BoxDecoration(
                                            color: Color(0xfffa5473),
                                            shape: BoxShape.circle),
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
                                            shape: BoxShape.circle),
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
                                            shape: BoxShape.circle),
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
                                              fontSize: sp(23),
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
                                              fontSize: sp(23),
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
                                              fontSize: sp(13),
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
                                              fontSize: sp(13),
                                              color: Theme.of(context)
                                                  .accentColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: h(10),
                                  ),
                                  Obx(
                                    () => Divider(
                                        color:
                                            controller.themeValue.toString() ==
                                                    "dark"
                                                ? Colors.black
                                                : Colors.white),
                                  )
                                ],
                              ),
                            ),
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
                              height: h(8),
                              width: w(8),
                              decoration: BoxDecoration(
                                  color: Color(0xffff61a1),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            SizedBox(
                              width: w(5),
                            ),
                            Obx(
                              () => controller.themeValue.toString() == "dark"
                                  ? Container(
                                      padding: EdgeInsets.only(),
                                      height: h(8),
                                      width: w(8),
                                      decoration: BoxDecoration(
                                          color: Colors.white30,
                                          borderRadius:
                                              BorderRadius.circular(w(10))),
                                    )
                                  : Container(
                                      padding: EdgeInsets.only(),
                                      height: h(8),
                                      width: w(8),
                                      decoration: BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius:
                                              BorderRadius.circular(w(10))),
                                    ),
                            ),
                            SizedBox(
                              width: w(20),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h(10),
                        ),
                        Obx(
                          () => Container(
                            height: h(120),
                            width: MediaQuery.of(context).size.width,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              children: [
                                Row(
                                  // scrollDirection: Axis.horizontal,
                                  children: [
                                    SizedBox(
                                      width: w(20),
                                    ),
                                    Container(
                                      height: h(120),
                                      width: w(110),
                                      decoration: BoxDecoration(
                                          color:
                                              Theme.of(context).backgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(w(10))),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                              padding:
                                                  EdgeInsets.only(top: h(10)),
                                              child: Image.asset(
                                                "assets/images/weight.png",
                                                color: controller.themeValue
                                                            .toString() ==
                                                        "dark"
                                                    ? Color(0XFF4F5258)
                                                    : Color(0XFF4F5258),
                                              )),
                                          Container(
                                            child: Text(
                                              "Weight",
                                              style: TextStyle(
                                                fontSize: sp(10),
                                                color: Theme.of(context)
                                                    .accentColor,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsets.only(bottom: h(10)),
                                            child: Text(
                                              "30",
                                              style: TextStyle(
                                                  fontSize: sp(13),
                                                  color: Color(0xfffa5473)),
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
                                          color:
                                              Theme.of(context).backgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(w(10))),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                              padding:
                                                  EdgeInsets.only(top: h(10)),
                                              child: Image.asset(
                                                "assets/images/height.png",
                                                color: controller.themeValue
                                                            .toString() ==
                                                        "dark"
                                                    ? Color(0XFF4F5258)
                                                    : Color(0XFF4F5258),
                                              )),
                                          Container(
                                            child: Text(
                                              "Height",
                                              style: TextStyle(
                                                fontSize: sp(10),
                                                color: Theme.of(context)
                                                    .accentColor,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsets.only(bottom: h(10)),
                                            child: Text(
                                              "30",
                                              style: TextStyle(
                                                  fontSize: sp(13),
                                                  color: Color(0xfffa5473)),
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
                                          color:
                                              Theme.of(context).backgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(w(10))),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                              padding:
                                                  EdgeInsets.only(top: h(10)),
                                              child: Icon(
                                                Icons.visibility,
                                                size: 30,
                                                color: controller.themeValue
                                                            .toString() ==
                                                        "dark"
                                                    ? Color(0XFF4F5258)
                                                    : Color(0XFF4F5258),
                                              )),
                                          Container(
                                            child: Text(
                                              "Color",
                                              style: TextStyle(
                                                fontSize: sp(10),
                                                color: Theme.of(context)
                                                    .accentColor,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsets.only(bottom: h(10)),
                                            child: Text(
                                              "BLACK",
                                              style: TextStyle(
                                                  fontSize: sp(13),
                                                  color: Color(0xfffa5473)),
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
                                          color:
                                              Theme.of(context).backgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(w(10))),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                              padding:
                                                  EdgeInsets.only(top: h(10)),
                                              child: Image.asset(
                                                "assets/images/hair.png",
                                                color: controller.themeValue
                                                            .toString() ==
                                                        "dark"
                                                    ? Color(0XFF4F5258)
                                                    : Color(0XFF4F5258),
                                              )),
                                          Container(
                                            child: Text(
                                              "Hair",
                                              style: TextStyle(
                                                fontSize: sp(10),
                                                color: Theme.of(context)
                                                    .accentColor,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsets.only(bottom: h(10)),
                                            child: Text(
                                              "Brown",
                                              style: TextStyle(
                                                  fontSize: sp(13),
                                                  color: Color(0xfffa5473)),
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
                                          color:
                                              Theme.of(context).backgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(w(10))),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                              padding:
                                                  EdgeInsets.only(top: h(10)),
                                              child: Image.asset(
                                                "assets/images/children.png",
                                                color: controller.themeValue
                                                            .toString() ==
                                                        "dark"
                                                    ? Color(0XFF4F5258)
                                                    : Color(0XFF4F5258),
                                              )),
                                          Container(
                                            child: Text(
                                              "Children",
                                              style: TextStyle(
                                                fontSize: sp(10),
                                                color: Theme.of(context)
                                                    .accentColor,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsets.only(bottom: h(10)),
                                            child: Text(
                                              "No",
                                              style: TextStyle(
                                                  fontSize: sp(13),
                                                  color: Color(0xfffa5473)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: w(20),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h(20),
                        ),
                        Card(
                          color: Theme.of(context).backgroundColor,
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
                                      "Bio",
                                      style: TextStyle(
                                          fontSize: sp(15),
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
                                                    color: Color(0xff555557),
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
                                            color: Color(0xfffa5473),
                                            fontSize: sp(15)),
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
                                        color: Color(0xfffa5473),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            "assets/images/astrology.png"),
                                        SizedBox(
                                          width: w(5),
                                        ),
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
                                        color: Color(0xfffa5473),
                                        borderRadius:
                                            BorderRadius.circular(w(20))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            "assets/images/sleeping.png"),
                                        SizedBox(
                                          width: w(5),
                                        ),
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
                                        color: Color(0xfffa5473),
                                        borderRadius:
                                            BorderRadius.circular(w(20))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            "assets/images/dancing.png"),
                                        SizedBox(
                                          width: w(5),
                                        ),
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
                                            fontSize: sp(18),
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
                                                fontSize: sp(13),
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
                                                fontSize: sp(11)),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: h(10),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: w(20),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(r(15)),
                                    child: Container(
                                      height: h(190),
                                      // decoration: BoxDecoration(
                                      //     borderRadius:
                                      //         BorderRadius.circular(w(30))),
                                      width: w(315),
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
                                            fontSize: sp(18),
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
                                        height: h(8),
                                        width: w(8),
                                        decoration: BoxDecoration(
                                            color: Color(0xffff61a1),
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
                                                height: h(8),
                                                width: w(8),
                                                decoration: BoxDecoration(
                                                    color: Colors.white30,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            w(10))),
                                              )
                                            : Container(
                                                margin:
                                                    EdgeInsets.only(top: h(20)),
                                                height: h(8),
                                                width: w(8),
                                                decoration: BoxDecoration(
                                                    color: Colors.black12,
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
                                                height: h(8),
                                                width: w(8),
                                                decoration: BoxDecoration(
                                                    color: Colors.white30,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            w(10))),
                                              )
                                            : Container(
                                                margin: EdgeInsets.only(
                                                    top: h(20), right: w(20)),
                                                height: h(8),
                                                width: w(8),
                                                decoration: BoxDecoration(
                                                    color: Colors.black12,
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
                                            fontSize: sp(18),
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
                                        height: h(8),
                                        width: w(8),
                                        decoration: BoxDecoration(
                                            color: Color(0xffff61a1),
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
                                                height: h(8),
                                                width: w(8),
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
                                                height: h(8),
                                                width: w(8),
                                                decoration: BoxDecoration(
                                                    color: Colors.black12,
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
                                                height: h(8),
                                                width: w(8),
                                                decoration: BoxDecoration(
                                                    color: Colors.white30,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            w(10))),
                                              )
                                            : Container(
                                                margin: EdgeInsets.only(
                                                    top: h(20), right: w(20)),
                                                height: h(8),
                                                width: w(8),
                                                decoration: BoxDecoration(
                                                    color: Colors.black12,
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
                                      fontSize: sp(18)),
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
                                          right: w(15),
                                          left: w(15),
                                          top: h(15),
                                          bottom: h(15)),
                                      margin: EdgeInsets.only(left: w(40)),
                                      height: h(60),
                                      width: w(60),
                                      decoration: BoxDecoration(
                                          color: Color(0xfffff3f3),
                                          shape: BoxShape.circle),
                                      child: Image.asset(
                                        "assets/images/snapchat.png",
                                        color: Color(0xfffa5473),
                                      )),
                                  Container(
                                      height: h(60),
                                      width: w(60),
                                      padding: EdgeInsets.only(
                                          right: w(15),
                                          left: w(15),
                                          top: h(15),
                                          bottom: h(15)),
                                      decoration: BoxDecoration(
                                          color: Color(0xfffff3f3),
                                          shape: BoxShape.circle),
                                      child: Image.asset(
                                        "assets/images/facebook.png",
                                        color: Color(0xfffa5473),
                                      )),
                                  Container(
                                      height: h(60),
                                      width: w(60),
                                      padding: EdgeInsets.only(
                                          right: w(15),
                                          left: w(15),
                                          top: h(15),
                                          bottom: h(15)),
                                      decoration: BoxDecoration(
                                          color: Color(0xfffff3f3),
                                          shape: BoxShape.circle),
                                      child: Image.asset(
                                        "assets/images/tiktok.png",
                                        color: Color(0xfffa5473),
                                      )),
                                  Container(
                                      margin: EdgeInsets.only(right: w(40)),
                                      padding: EdgeInsets.only(
                                          right: w(15),
                                          left: w(15),
                                          top: h(15),
                                          bottom: h(15)),
                                      height: h(60),
                                      width: w(60),
                                      decoration: BoxDecoration(
                                          color: Color(0xfffff3f3),
                                          shape: BoxShape.circle),
                                      child: Image.asset(
                                        "assets/images/instagram.png",
                                        color: Color(0xfffa5473),
                                      ))
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
                              color: Color(0xfffa5473),
                              borderRadius: BorderRadius.circular(w(10))),
                          child: Center(
                              child: Text(
                            "Share Profile",
                            style: TextStyle(
                                fontSize: sp(18),
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
                                fontSize: sp(18),
                                color:
                                    controller.themeValue.toString() == "dark"
                                        ? Color(0xff4f5258)
                                        : Colors.black),
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
