import 'package:bloved/Controllers/darklightTheme.dart';
import 'package:bloved/Views/MessageActivityScreen.dart';
import 'package:bloved/Views/Settings.dart';
import 'package:bloved/Views/UpdateProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final w = ScreenUtil().setWidth;
  final h = ScreenUtil().setHeight;
  final sp = ScreenUtil().setSp;
  var themeController = Get.put(ThemeValue());
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(h(90.0)),
          child: AppBar(
            leading: Row(children: [
              Container(
                  margin: EdgeInsets.only(left: w(20), top: h(30)),
                  height: h(25),
                  width: w(25),
                  decoration: BoxDecoration(
                      color: Color(0xffff61a1),
                      borderRadius: BorderRadius.circular(w(20))),
                  child: themeController.themeValue.toString() == "dark"
                      ? Icon(
                          Icons.person,
                          color: Colors.black,
                          size: 20,
                        )
                      : Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 20,
                        )),
            ]),
            centerTitle: true,
            title: Container(
              padding: EdgeInsets.only(top: h(30)),
              child: Image.asset("assets/images/logo.png"),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            elevation: 5,
            backgroundColor: Theme.of(context).backgroundColor,
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return MessageActivityScreen();
                  }));
                },
                child: Container(
                  padding: EdgeInsets.only(right: w(40), top: h(30)),
                  child: Icon(
                    Icons.forum,
                    color: Colors.grey[400],
                  ),
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Card(
                  color: Theme.of(context).backgroundColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(w(10))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: h(10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Obx(() => Container(
                                padding: EdgeInsets.only(left: w(30)),
                                child: Column(
                                  children: [
                                    Card(
                                      color: themeController.themeValue
                                                  .toString() ==
                                              "dark"
                                          ? Color(0xff373638)
                                          : Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(w(30))),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return Settings();
                                          }));
                                        },
                                        child: Container(
                                          height: h(47),
                                          width: w(47),
                                          decoration: BoxDecoration(),
                                          child: Icon(
                                            Icons.settings,
                                            color: Colors.grey[500],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "SETTINGS",
                                        style: TextStyle(
                                            fontSize: sp(11),
                                            color:
                                                Theme.of(context).dividerColor),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(w(60)),
                                    border: Border.all(
                                        color: Colors.pink, width: 3.0)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(w(60)),
                                  child: Container(
                                    height: h(121),
                                    width: w(121),
                                    decoration:
                                        BoxDecoration(color: Colors.blue),
                                    child: Image.network(
                                      "https://i.pinimg.com/originals/19/cf/78/19cf789a8e216dc898043489c16cec00.jpg",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: h(90),
                                  left: w(85),
                                  child: Container(
                                    height: h(30),
                                    width: w(30),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(w(30))),
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(w(30)),
                                        child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Image.asset(
                                              "assets/images/verifiedMark.png",
                                              color: Colors.blue,
                                            ))),
                                  ))
                            ],
                          ),
                          Obx(() => Container(
                                padding: EdgeInsets.only(right: w(30)),
                                child: Column(
                                  children: [
                                    Card(
                                      color: themeController.themeValue
                                                  .toString() ==
                                              "dark"
                                          ? Color(0xff373638)
                                          : Colors.white,
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(w(30))),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return ProfileScreen();
                                          }));
                                        },
                                        child: Container(
                                          height: h(47),
                                          width: w(47),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(w(30)),
                                          ),
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.grey[500],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "PROFILE",
                                        style: TextStyle(
                                            fontSize: sp(11),
                                            color:
                                                Theme.of(context).dividerColor),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: h(30),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Obx(
                            () => Container(
                              margin: EdgeInsets.only(
                                left: w(20),
                              ),
                              height: h(100),
                              width: w(90),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      themeController.themeValue.toString() ==
                                              "dark"
                                          ? Color(0xff373638)
                                          : Color(0xfffff3f3)),
                              child: Column(
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(top: h(10)),
                                      child: Image.asset(
                                        "assets/images/watch.png",
                                        color: Color(0xfffa5473),
                                      )),
                                  SizedBox(
                                    height: h(5),
                                  ),
                                  Text(
                                    "Visibility",
                                    style: TextStyle(
                                        fontSize: sp(12),
                                        color: Theme.of(context).accentColor),
                                  ),
                                  SizedBox(
                                    height: h(10),
                                  ),
                                  Text(
                                    "HIGH",
                                    style: TextStyle(
                                        fontSize: sp(12),
                                        color: Color(0xfffa5473),
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Obx(
                            () => Container(
                              height: h(100),
                              width: w(90),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      themeController.themeValue.toString() ==
                                              "dark"
                                          ? Color(0xff373638)
                                          : Color(0xfffff3f3)),
                              child: Column(
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(top: h(10)),
                                      child: Image.asset(
                                        "assets/images/watch.png",
                                        color: Color(0xfffa5473),
                                      )),
                                  SizedBox(
                                    height: h(
                                      5,
                                    ),
                                  ),
                                  Text(
                                    "Activity",
                                    style: TextStyle(
                                        fontSize: sp(12),
                                        color: Theme.of(context).accentColor),
                                  ),
                                  SizedBox(
                                    height: h(10),
                                  ),
                                  Text(
                                    "CLIMBING",
                                    style: TextStyle(
                                        fontSize: sp(12),
                                        color: Color(0xfffa5473),
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Obx(() => Container(
                                margin: EdgeInsets.only(right: w(20)),
                                height: h(100),
                                width: w(90),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        themeController.themeValue.toString() ==
                                                "dark"
                                            ? Color(0xff373638)
                                            : Color(0xfffff3f3)),
                                child: Column(
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(
                                          top: h(10),
                                        ),
                                        child: Image.asset(
                                          "assets/images/watch.png",
                                          color: Color(0xfffa5473),
                                        )),
                                    SizedBox(
                                        height: h(
                                      5,
                                    )),
                                    Text(
                                      "Popularity",
                                      style: TextStyle(
                                          fontSize: sp(12),
                                          color: Theme.of(context).accentColor),
                                    ),
                                    SizedBox(
                                      height: h(10),
                                    ),
                                    Text(
                                      "VERY HIGH",
                                      style: TextStyle(
                                          fontSize: sp(12),
                                          color: Color(0xfffa5473),
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: h(20),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: w(20), right: w(20)),
                        height: h(50),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.pink.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 10,
                              ),
                            ],
                            color: Color(0xfffa5473),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                            child: Text(
                          "My bloved VIP",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                      ),
                      SizedBox(
                        height: h(20),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: h(20),
                ),
                Container(
                  margin: EdgeInsets.only(left: 0, right: 0),
                  height: h(50),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 10,
                        ),
                      ],
                      color: Color(0xfffa5473),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Boosts ",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: sp(18)),
                      ),
                      Container(
                        height: h(20),
                        width: w(20),
                        child: Image.asset(
                          "assets/images/fire.png",
                          color: Colors.white,
                        ),
                      )
                    ],
                  )),
                ),
                SizedBox(
                  height: h(20),
                ),
                Card(
                  color: Theme.of(context).backgroundColor,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    margin: EdgeInsets.only(left: 0, right: 0),
                    height: h(50),
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                        child: Text(
                      "Tickets",
                      style: TextStyle(
                          color: Color(0xfffa5473),
                          fontWeight: FontWeight.bold,
                          fontSize: sp(18)),
                    )),
                  ),
                ),
                SizedBox(
                  height: h(20),
                ),
                Card(
                  color: Theme.of(context).backgroundColor,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    margin: EdgeInsets.only(left: 0, right: 0),
                    height: h(50),
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                        child: Text(
                      "Remove Ads",
                      style: TextStyle(
                          color: Color(0xfffa5473),
                          fontWeight: FontWeight.bold,
                          fontSize: sp(18)),
                    )),
                  ),
                ),
                SizedBox(
                  height: h(20),
                ),
                Card(
                  color: Theme.of(context).backgroundColor,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    margin: EdgeInsets.only(left: 0, right: 0),
                    height: h(50),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(),
                    child: Center(
                        child: Text(
                      "Refill Likes",
                      style: TextStyle(
                          color: Color(0xfffa5473),
                          fontWeight: FontWeight.bold,
                          fontSize: sp(18)),
                    )),
                  ),
                ),
                SizedBox(
                  height: h(20),
                ),
                Card(
                  color: Theme.of(context).backgroundColor,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    margin: EdgeInsets.only(left: 0, right: 0),
                    height: h(50),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: w(10), right: 0),
                          child: Image.asset("assets/images/badge.png"),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: w(30), right: 0),
                          child: Text(
                            "Refill Rewinds",
                            style: TextStyle(
                                color: Color(0xfffa5473),
                                fontWeight: FontWeight.bold,
                                fontSize: sp(18)),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "45 % OFF",
                              style: TextStyle(
                                fontSize: sp(10),
                                color: Color(0xfffa5473),
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                  right: w(10),
                                ),
                                child: Row(
                                  children: [
                                    Text("\$",
                                        style: TextStyle(
                                            fontSize: sp(10),
                                            color:
                                                Theme.of(context).accentColor)),
                                    Text("25/MONTH",
                                        style: TextStyle(
                                            fontSize: sp(10),
                                            color:
                                                Theme.of(context).accentColor)),
                                  ],
                                ))
                          ],
                        )
                      ],
                    )),
                  ),
                ),
                SizedBox(
                  height: h(20),
                ),
                Card(
                  color: Theme.of(context).backgroundColor,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    margin: EdgeInsets.only(left: 0, right: 0),
                    height: h(50),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(),
                    child: Center(
                        child: Text(
                      "Refill Charms",
                      style: TextStyle(
                          color: Color(0xfffa5473),
                          fontWeight: FontWeight.bold,
                          fontSize: sp(18)),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
