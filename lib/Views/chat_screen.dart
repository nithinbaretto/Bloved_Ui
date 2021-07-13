import 'package:bloved/Controllers/darklightTheme.dart';
import 'package:bloved/Models/message_model.dart';
import 'package:bloved/Models/user_model.dart';
import 'package:bloved/Views/MainHomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({required this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final w = ScreenUtil().setWidth;
  final h = ScreenUtil().setHeight;
  final sp = ScreenUtil().setSp;
  final r = ScreenUtil().radius;
  var themeController = Get.put(ThemeValue());
  _chatBubble(Message message, bool isMe, bool isSameUser) {
    if (isMe) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(r(10))),
                margin: EdgeInsets.only(
                    left: w(30), bottom: h(5), top: h(10), right: w(30)),
                child: Container(
                  padding: EdgeInsets.only(
                    top: h(0),
                    left: w(10),
                    bottom: h(0),
                    right: w(30),
                  ),
                  height: h(90),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(r(10)),
                    color: Theme.of(context).backgroundColor,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      message.text,
                      style: TextStyle(
                        fontSize: sp(15),
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: h(30),
                left: w(298),
                child: Container(
                  height: h(50),
                  width: w(50),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                              message.sender.imageUrl,
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(right: w(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Text(
                    "12:30 AM",
                    style: TextStyle(fontSize: sp(12), color: Colors.grey),
                  ),
                ),
                SizedBox(
                  width: w(5),
                ),
                Container(child: Image.asset("assets/images/done.png")),
              ],
            ),
          )
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: h(20)),
          Center(
            child: Container(
                padding: EdgeInsets.only(),
                child: Obx(
                  () => Text("12:30, Monday",
                      style: TextStyle(
                          fontSize: sp(10),
                          color: themeController.themeValue.toString() == "dark"
                              ? Color(0xff7a869a)
                              : Color(0xff7a869a))),
                )),
          ),
          SizedBox(height: h(0)),
          Stack(
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.only(
                    left: w(30), bottom: h(5), top: h(10), right: w(30)),
                child: Container(
                  padding: EdgeInsets.only(
                    top: h(10),
                    left: w(30),
                    bottom: h(20),
                    right: w(15),
                  ),
                  height: h(90),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(r(10)),
                    color: Color(0XFFFA5473),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      message.text,
                      style: TextStyle(
                        fontSize: sp(15),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: h(30),
                left: w(0),
                child: Container(
                  height: h(50),
                  width: w(50),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: w(15),
                    backgroundImage: AssetImage(message.sender.imageUrl),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: w(40)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    child: Obx(
                  () => Text(
                    "12:30 AM",
                    style: TextStyle(
                        fontSize: sp(13),
                        color: themeController.themeValue.toString() == "dark"
                            ? Color(0xff757b83)
                            : Color(0xff757b83)),
                  ),
                )),
                SizedBox(
                  width: w(5),
                ),
                Container(child: Image.asset("assets/images/done.png")),
              ],
            ),
          )
        ],
      );
    }
  }

  _sendMessageArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0),
      height: 70,
      color: Theme.of(context).backgroundColor,
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Theme.of(context).buttonColor,
            borderRadius: BorderRadius.circular(r(10))),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.sentiment_satisfied),
              iconSize: w(22),
              color: Colors.pink[300],
              onPressed: () {},
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration.collapsed(
                    hintText: 'Start Typing...',
                    hintStyle: TextStyle(color: Theme.of(context).splashColor)),
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
            Container(
                child: Icon(
              Icons.mic,
              color: Color(0xfffa5473),
            )),
            SizedBox(
              width: w(7),
            ),
            Container(
                height: h(18),
                width: w(18),
                child: Image.asset(
                  "assets/images/gallery.png",
                  color: Color(0xfffa5473),
                )),
            SizedBox(
              width: w(10),
            ),
            Container(
                height: h(18),
                width: w(18),
                child: Image.asset(
                  "assets/images/send.png",
                  color: Color(0xfffa5473),
                )),
            SizedBox(
              width: w(10),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int prevUserId = 0;
    return Scaffold(
      // backgroundColor: Color(0xfffbf6f7),
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, h(70)),
        child: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).backgroundColor,

          titleTextStyle: TextStyle(),
          automaticallyImplyLeading: false,
          // backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Theme.of(context).accentColor),
          leading: Container(
            padding: EdgeInsets.only(left: w(20), top: h(17)),
            child: GestureDetector(
              onTap: () {
                Get.off(MainHomePage());
              },
              child: Icon(
                Icons.chevron_left,
                size: w(30),
              ),
            ),
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(top: h(17), left: 0, right: 0),
                height: h(37),
                width: w(37),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/images/img1.png"),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: w(10),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "Amanda",
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: sp(16)),
                    ),
                  ),
                  SizedBox(
                    height: h(5),
                  ),
                  Row(
                    children: [
                      Container(
                        height: h(10),
                        width: w(10),
                        decoration: BoxDecoration(
                            color: Color(0xfffa5473),
                            borderRadius: BorderRadius.circular(r(15))),
                      ),
                      SizedBox(
                        width: w(3),
                      ),
                      Container(
                        child: Text(
                          "Online",
                          style: TextStyle(
                              color: Color(0xfffa5473), fontSize: sp(12)),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          actions: [
            Container(
                margin: EdgeInsets.only(top: h(17)),
                child: Image.asset("assets/images/call.png")),
            SizedBox(
              width: w(0),
            ),
            Container(
                margin: EdgeInsets.only(top: h(17)),
                child: Image.asset("assets/images/video.png")),
            SizedBox(
              width: w(0),
            ),
            Container(
              margin: EdgeInsets.only(top: h(17)),
              child: Icon(
                Icons.more_vert,
                color: Color(0xfffa5473),
                size: w(25),
              ),
            ),
            SizedBox(
              width: w(20),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: h(20),
          ),
          Container(
            height: h(160.0),
            margin: EdgeInsets.only(left: w(20), right: w(20)),
            decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(r(10))),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: h(20),
                      ),
                      Center(
                        child: Container(
                          width: w(370),
                          height: h(80),
                          child: Stack(
                            // alignment: Alignment.center,
                            children: [
                              Positioned(
                                left: w(190),
                                child: themeController.themeValue.toString() ==
                                        "dark"
                                    ? Container(
                                        height: h(70),
                                        width: w(70),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: w(5),
                                              right: w(5),
                                              top: h(5),
                                              bottom: h(5)),
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/image2.png"),
                                                  fit: BoxFit.cover),
                                              shape: BoxShape.circle,
                                              color: Colors.red),
                                        ),
                                      )
                                    : Container(
                                        height: h(70),
                                        width: w(70),
                                        decoration: BoxDecoration(
                                          color: Color(0xfff7fafd),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: w(5),
                                              right: w(5),
                                              top: h(5),
                                              bottom: h(5)),
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/image2.png"),
                                                  fit: BoxFit.cover),
                                              shape: BoxShape.circle,
                                              color: Colors.red),
                                        ),
                                      ),
                              ),
                              Positioned(
                                left: w(102),
                                child: themeController.themeValue.toString() ==
                                        "dark"
                                    ? Container(
                                        height: h(70),
                                        width: w(70),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: w(5),
                                              right: w(5),
                                              top: h(5),
                                              bottom: h(5)),
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/image4.png"),
                                                  fit: BoxFit.cover),
                                              shape: BoxShape.circle,
                                              color: Colors.red),
                                        ),
                                      )
                                    : Container(
                                        height: h(70),
                                        width: w(70),
                                        decoration: BoxDecoration(
                                          color: Color(0xfff7fafd),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: w(5),
                                              right: w(5),
                                              top: h(5),
                                              bottom: h(5)),
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/img1.png"),
                                                  fit: BoxFit.cover),
                                              shape: BoxShape.circle,
                                              color: Colors.red),
                                        ),
                                      ),
                              ),
                              Positioned(
                                  left: w(160),
                                  top: h(20),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Container(
                                      height: h(40),
                                      width: w(40),
                                      decoration: BoxDecoration(
                                          color: Colors.pink,
                                          border: Border.all(
                                              color: Colors.white, width: w(3)),
                                          shape: BoxShape.circle),
                                      child: Icon(
                                        Icons.favorite,
                                        size: w(18),
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: w(20)),
                            child: Text(
                              "Amanda",
                              style: TextStyle(
                                fontSize: sp(10),
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: w(50),
                          ),
                          Container(
                              child: Text("Petr Brown",
                                  style: TextStyle(
                                    fontSize: sp(10),
                                    color: Theme.of(context).accentColor,
                                  ))),
                        ],
                      ),
                      SizedBox(
                        height: h(15),
                      ),
                      Center(
                        child: Container(
                          child: Text(
                            "You Have matched say Hi",
                            style:
                                TextStyle(color: Theme.of(context).splashColor),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.all(20),
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                final Message message = messages[index];
                final bool isMe = message.sender.id == currentUser.id;
                final bool isSameUser = prevUserId == message.sender.id;
                prevUserId = message.sender.id;
                return _chatBubble(message, isMe, isSameUser);
              },
            ),
          ),
          _sendMessageArea(),
        ],
      ),
    );
  }
}
