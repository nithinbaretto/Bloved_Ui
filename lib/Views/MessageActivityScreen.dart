import 'package:bloved/Controllers/MessageController.dart';
import 'package:bloved/Controllers/darklightTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MessageActivityScreen extends StatefulWidget {
  const MessageActivityScreen({Key? key}) : super(key: key);

  @override
  _MessageActivityScreenState createState() => _MessageActivityScreenState();
}

class _MessageActivityScreenState extends State<MessageActivityScreen> {
  final messageController = Get.put(MessageController());
  final w = ScreenUtil().setWidth;
  final h = ScreenUtil().setHeight;
  final sp = ScreenUtil().setSp;
  var images = [
    "assets/images/img1.png",
    "assets/images/image2.png",
    "assets/images/image3.png",
    "assets/images/image4.png"
  ];
  String selected = "Messages";
  var themeController = Get.put(ThemeValue());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: Row(children: [
          SizedBox(width: w(31)),
          Obx(() => themeController.themeValue.toString() == "dark"
              ? Container(
                  margin: EdgeInsets.only(top: h(30)),
                  height: h(25),
                  width: w(25),
                  decoration: BoxDecoration(
                      color: selected == "Messages"
                          ? Colors.white30
                          : Colors.pink[400],
                      borderRadius: BorderRadius.circular(w(20))),
                  child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.person,
                        color: Colors.black,
                        size: w(20),
                      )),
                )
              : Container(
                  margin: EdgeInsets.only(top: h(30)),
                  height: h(25),
                  width: w(25),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(w(20))),
                  child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: w(20),
                      )),
                ))
        ]),
        centerTitle: true,
        title: themeController.themeValue.toString() == "dark"
            ? Container(
                padding: EdgeInsets.only(
                  top: h(25),
                ),
                child: selected == "Messages"
                    ? Image.asset("assets/images/logo.png",
                        color: Colors.white30)
                    : Image.asset("assets/images/logo2.png"))
            : Container(
                padding: EdgeInsets.only(
                  top: h(30),
                ),
                child: Image.asset("assets/images/logo.png")),
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        actions: [
          Container(
            padding: EdgeInsets.only(right: w(40), top: h(30)),
            child: GestureDetector(
              // onTap: () {
              //   showDialog(
              //       context: context,
              //       builder: (BuildContext context) => errorDialog);
              // },
              child: Icon(
                Icons.forum,
                color: Colors.pink[400],
              ),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            margin: EdgeInsets.all((0)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            child: Container(
              height: h(100),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Card(
                        shadowColor: Colors.pink,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        margin: EdgeInsets.only(left: w(30), top: h(20)),
                        child: Container(
                          height: h(47),
                          width: w(47),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.pink.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                ),
                              ],
                              color: Color(0xfffa5473),
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Icon(
                              Icons.visibility,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: w(25), top: h(5)),
                        child: Text(
                          "Visitors",
                          style: TextStyle(
                              fontSize: sp(10),
                              color: Theme.of(context).accentColor),
                        ),
                      )
                    ],
                  ),
                  Obx(() => (Column(
                        children: [
                          Card(
                            // shadowColor: Colors.pink,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            margin: EdgeInsets.only(left: w(20), top: h(20)),
                            child: Container(
                              height: h(47),
                              width: w(47),
                              decoration: BoxDecoration(
                                  color:
                                      themeController.themeValue.toString() ==
                                              "dark"
                                          ? Color(0xfffff3f3)
                                          : Color(0xfffff3f3),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.pink[300],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: w(20), top: h(5)),
                            child: Text(
                              "Matches",
                              style: TextStyle(
                                  fontSize: sp(10),
                                  color: Theme.of(context).accentColor),
                            ),
                          )
                        ],
                      ))),
                  Obx(() => (Column(
                        children: [
                          Card(
                            // shadowColor: Colors.pink,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            margin: EdgeInsets.only(left: w(20), top: h(20)),
                            child: Container(
                              height: h(47),
                              width: w(47),
                              decoration: BoxDecoration(
                                  color:
                                      themeController.themeValue.toString() ==
                                              "dark"
                                          ? Color(0xfffff3f3)
                                          : Color(0xfffff3f3),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                child: Icon(
                                  Icons.star_rounded,
                                  color: Colors.pink[300],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: w(20), top: h(5)),
                            child: Text(
                              "Recommended",
                              style: TextStyle(
                                  fontSize: sp(10),
                                  color: Theme.of(context).accentColor),
                            ),
                          )
                        ],
                      ))),
                  Obx(() => (Column(
                        children: [
                          Card(
                              // shadowColor: Colors.pink,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              margin: EdgeInsets.only(left: w(20), top: h(20)),
                              child: Container(
                                  height: h(47),
                                  width: w(47),
                                  decoration: BoxDecoration(
                                      color: themeController.themeValue
                                                  .toString() ==
                                              "dark"
                                          ? Color(0xfffff3f3)
                                          : Color(0xfffff3f3),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Icon(
                                    Icons.thumb_up,
                                    color: Colors.pink[300],
                                  ))),
                          Container(
                            margin: EdgeInsets.only(left: w(20), top: h(5)),
                            child: Text(
                              "Likes",
                              style: TextStyle(
                                  fontSize: sp(10),
                                  color: Theme.of(context).accentColor),
                            ),
                          )
                        ],
                      ))),
                  Obx(() => (Column(
                        children: [
                          Card(
                            // shadowColor: Colors.pink,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            margin: EdgeInsets.only(
                              left: w(20),
                              top: h(20),
                            ),
                            child: Container(
                                height: h(47),
                                width: w(47),
                                decoration: BoxDecoration(
                                    color:
                                        themeController.themeValue.toString() ==
                                                "dark"
                                            ? Color(0xfffff3f3)
                                            : Color(0xfffff3f3),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Image.asset(
                                  "assets/images/others.png",
                                  color: Colors.pink[300],
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: w(20), top: h(5)),
                            child: Text(
                              "Others",
                              style: TextStyle(
                                  fontSize: sp(10),
                                  color: Theme.of(context).accentColor),
                            ),
                          )
                        ],
                      ))),
                ],
              ),
            ),
          ),
          SizedBox(
            height: h(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = "Messages";
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(left: w(20)),
                  child: Text(
                    "Messages",
                    style: TextStyle(
                        color: selected == "Messages"
                            ? Color(0xfffa5473)
                            : Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: sp(18)),
                  ),
                ),
              ),
              Container(
                height: h(30),
                width: (1),
                color: Colors.grey,
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = "Activities";
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.only(right: w(20)),
                    child: Text("Activities",
                        style: TextStyle(
                            color: selected == "Activities"
                                ? Color(0xfffa5473)
                                : Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: sp(18))),
                  )),
            ],
          ),
          SizedBox(
            height: h(20),
          ),
          selected == "Activities"
              ? Flexible(
                  child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: images.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: h(20));
                      },
                      itemBuilder: (context, index) {
                        return Card(
                            color: Theme.of(context).backgroundColor,
                            margin: EdgeInsets.only(left: w(20), right: w(20)),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: h(20), left: w(10), bottom: h(20)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: h(40),
                                    width: w(40),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(30),
                                        image: DecorationImage(
                                            image: AssetImage(images[index]),
                                            fit: BoxFit.cover)),
                                  ),
                                  SizedBox(
                                    width: w(5),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: h(5)),
                                    height: h(15),
                                    width: w(15),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/verifiedMark.png"))),
                                  ),
                                  SizedBox(
                                    width: w(5),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: h(5)),
                                        child: Text(
                                          "Maria Bailey",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .accentColor),
                                        ),
                                      ),
                                      SizedBox(
                                        height: h(5),
                                      ),
                                      Obx(() => Container(
                                            child: Text(
                                              "4 Days ago",
                                              style: TextStyle(
                                                  fontSize: sp(13),
                                                  color: themeController
                                                              .themeValue
                                                              .toString() ==
                                                          "dark"
                                                      ? Color(0xff555557)
                                                      : Color(0xff141e30)),
                                            ),
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    width: w(10),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: h(10)),
                                    height: 4,
                                    width: 4,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).accentColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  SizedBox(
                                    width: w(10),
                                  ),
                                  Obx(() => Container(
                                        margin: EdgeInsets.only(top: h(5)),
                                        child: Text(
                                          "28",
                                          style: TextStyle(
                                            color: themeController.themeValue
                                                        .toString() ==
                                                    "dark"
                                                ? Color(0xff88888a)
                                                : Color(0xff141e30),
                                          ),
                                        ),
                                      )),
                                  Container(
                                    margin: EdgeInsets.only(top: h(5)),
                                    child: Text(
                                      ",",
                                      style: TextStyle(
                                        color: Theme.of(context).splashColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: w(10),
                                  ),
                                  Obx(() => Container(
                                        margin: EdgeInsets.only(top: h(5)),
                                        child: Text(
                                          "Has Visited you",
                                          style: TextStyle(
                                            color: themeController.themeValue
                                                        .toString() ==
                                                    "dark"
                                                ? Color(0xff88888a)
                                                : Color(0xff141e30),
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            ));
                      }))
              : Flexible(
                  child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: images.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: h(20));
                      },
                      itemBuilder: (context, index) {
                        return Obx(() => Card(
                            color: Theme.of(context).backgroundColor,
                            margin: EdgeInsets.only(left: w(20), right: w(20)),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: h(20), left: w(10), bottom: h(20)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: h(40),
                                    width: w(40),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(30),
                                        image: DecorationImage(
                                            image: AssetImage(messageController
                                                .messageList[index].photo),
                                            fit: BoxFit.cover)),
                                  ),
                                  SizedBox(
                                    width: w(5),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: h(5)),
                                    height: h(15),
                                    width: w(15),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: selected == "Messages"
                                                ? AssetImage(
                                                    "assets/images/verified2.png",
                                                  )
                                                : AssetImage(
                                                    "assets/images/verifiedMark.png"))),
                                  ),
                                  SizedBox(
                                    width: w(5),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: h(5)),
                                        child: Text(
                                            messageController
                                                .messageList[0].name,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .accentColor)),
                                      ),
                                      SizedBox(
                                        height: h(5),
                                      ),
                                      Obx(() => Container(
                                            child: Text(
                                              "How are you?",
                                              style: TextStyle(
                                                  fontSize: sp(12),
                                                  color: themeController
                                                              .themeValue
                                                              .toString() ==
                                                          "dark"
                                                      ? Color(0xff555557)
                                                      : Color(0xff141e30)),
                                            ),
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    width: w(10),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: h(10)),
                                    height: 4,
                                    width: 4,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).accentColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  SizedBox(
                                    width: w(10),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(top: h(5)),
                                      child: Text("28",
                                          style: TextStyle(
                                            color: themeController.themeValue
                                                        .toString() ==
                                                    "dark"
                                                ? Color(0xff88888a)
                                                : Color(0xff141e30),
                                          ))),
                                  SizedBox(
                                    width: w(50),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: h(10)),
                                    child: Text(
                                      messageController.messageList[0].time +
                                          " AM",
                                      style: TextStyle(
                                          color: themeController.themeValue
                                                      .toString() ==
                                                  "dark"
                                              ? Color(0xff555557)
                                              : Color(0xff757b83)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: w(20),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: h(15)),
                                    child: Image.asset("assets/images/done.png",
                                        color: themeController.themeValue
                                                    .toString() ==
                                                "dark"
                                            ? Color(0xff555557)
                                            : Color(0xff3c3e41)),
                                  ),
                                ],
                              ),
                            )));
                      }))
        ],
      ),
    );
  }
}
