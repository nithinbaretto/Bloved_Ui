import 'package:bloved/Controllers/MessageController.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: Row(children: [
          Container(
            margin: EdgeInsets.only(left: w(30), top: h(30)),
            height: h(25),
            width: w(25),
            decoration: BoxDecoration(
                color: Colors.grey[500],
                borderRadius: BorderRadius.circular(20)),
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 20,
            ),
          ),
        ]),
        centerTitle: true,
        title: Container(
          padding: EdgeInsets.only(top: h(30)),
          child: Text(
            "bloved",
            style: GoogleFonts.ubuntu(
                fontSize: sp(22),
                color: Colors.grey[400],
                fontWeight: FontWeight.bold),
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).cardColor,
        actions: [
          Container(
            padding: EdgeInsets.only(right: w(30), top: h(30)),
            child: Icon(
              Icons.forum,
              color: Colors.pink[300],
            ),
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            margin: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            child: Container(
              height: h(100),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
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
                        margin: EdgeInsets.only(left: w(20), top: h(20)),
                        child: Container(
                          height: h(50),
                          width: w(50),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.pink.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                ),
                              ],
                              color: Colors.pink[300],
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
                        margin: EdgeInsets.only(left: w(20), top: h(5)),
                        child: Text(
                          "Visitors",
                          style: TextStyle(
                              fontSize: sp(10),
                              color: Theme.of(context).accentColor),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Card(
                        // shadowColor: Colors.pink,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        margin: EdgeInsets.only(left: w(20), top: h(20)),
                        child: Container(
                          height: h(50),
                          width: w(50),
                          decoration: BoxDecoration(
                              color: Theme.of(context).focusColor,
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
                  ),
                  Column(
                    children: [
                      Card(
                        // shadowColor: Colors.pink,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        margin: EdgeInsets.only(left: w(20), top: h(20)),
                        child: Container(
                          height: h(50),
                          width: w(50),
                          decoration: BoxDecoration(
                              color: Theme.of(context).focusColor,
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
                  ),
                  Column(
                    children: [
                      Card(
                          // shadowColor: Colors.pink,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          margin: EdgeInsets.only(left: w(20), top: h(20)),
                          child: Container(
                              height: h(50),
                              width: w(50),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).focusColor,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Icon(
                                Icons.thumb_up,
                                color: Colors.pink[300],
                              ))),
                      Container(
                        margin: EdgeInsets.only(left: w(20), top: h(5)),
                        child: Text(
                          "Likes",
                          style: TextStyle(fontSize: sp(10)),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Card(
                        // shadowColor: Colors.pink,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        margin: EdgeInsets.only(left: w(20), top: h(20)),
                        child: Container(
                            height: h(50),
                            width: w(50),
                            decoration: BoxDecoration(
                                color: Theme.of(context).focusColor,
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
                  )
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
                  child: Text(
                    "Messages",
                    style: TextStyle(
                        color: selected == "Messages"
                            ? Colors.pink[300]
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
                    child: Text("Activities",
                        style: TextStyle(
                            color: selected == "Activities"
                                ? Colors.pink[300]
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
                            margin: EdgeInsets.only(left: w(10), right: w(10)),
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
                                      Container(
                                        child: Text(
                                          "4 Days ago",
                                          style: TextStyle(
                                            fontSize: sp(12),
                                            color:
                                                Theme.of(context).splashColor,
                                          ),
                                        ),
                                      )
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
                                    child: Text(
                                      "28",
                                      style: TextStyle(
                                        color: Theme.of(context).splashColor,
                                      ),
                                    ),
                                  ),
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
                                  Container(
                                    margin: EdgeInsets.only(top: h(5)),
                                    child: Text(
                                      "Has Visited you",
                                      style: TextStyle(
                                        color: Theme.of(context).splashColor,
                                      ),
                                    ),
                                  )
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
                            margin: EdgeInsets.only(left: w(10), right: w(10)),
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
                                            messageController
                                                .messageList[0].name,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .accentColor)),
                                      ),
                                      SizedBox(
                                        height: h(5),
                                      ),
                                      Container(
                                        child: Text(
                                          "How are you?",
                                          style: TextStyle(
                                              fontSize: sp(12),
                                              color: Theme.of(context)
                                                  .splashColor),
                                        ),
                                      )
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
                                    child: Text(
                                      "28",
                                      style: TextStyle(
                                          color: Theme.of(context).splashColor),
                                    ),
                                  ),
                                  SizedBox(
                                    width: w(50),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: h(10)),
                                    child: Text(
                                      messageController.messageList[0].time +
                                          " AM",
                                      style: TextStyle(
                                          color: Theme.of(context).splashColor),
                                    ),
                                  ),
                                  SizedBox(
                                    width: w(20),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: h(15)),
                                    child: Image.asset(
                                      "assets/images/done.png",
                                      color: Theme.of(context).splashColor,
                                    ),
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
