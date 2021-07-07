import 'package:bloved/Models/message_model.dart';
import 'package:bloved/Models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  _chatBubble(Message message, bool isMe, bool isSameUser) {
    if (isMe) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  top: h(10),
                  left: w(20),
                  bottom: h(20),
                  right: h(15),
                ),
                margin: EdgeInsets.only(
                    left: h(20), bottom: h(5), top: h(10), right: w(30)),
                height: h(90),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w(10)),
                  color: Theme.of(context).backgroundColor,
                ),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    message.text,
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: h(30),
                left: w(300),
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
                Container(
                  child: Icon(
                    Icons.done_all,
                    color: Colors.grey,
                    size: w(18),
                  ),
                ),
              ],
            ),
          )
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: h(10)),
          Center(
            child: Container(
                padding: EdgeInsets.only(),
                child: Text(
                  "12:30, Monday",
                  style: TextStyle(color: Theme.of(context).splashColor),
                )),
          ),
          SizedBox(height: h(20)),
          Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  top: h(10),
                  left: w(30),
                  bottom: h(20),
                  right: h(15),
                ),
                margin: EdgeInsets.only(
                    left: h(30), bottom: h(5), top: h(10), right: w(10)),
                height: h(90),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w(10)),
                  color: Colors.pink[300],
                ),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    message.text,
                    style: TextStyle(
                      color: Colors.white,
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
                  child: Text(
                    "12:30 AM",
                    style: TextStyle(
                        fontSize: sp(12), color: Theme.of(context).splashColor),
                  ),
                ),
                SizedBox(
                  width: w(5),
                ),
                Container(
                  child: Icon(
                    Icons.done_all,
                    color: Theme.of(context).splashColor,
                    size: w(18),
                  ),
                ),
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
            borderRadius: BorderRadius.circular(10)),
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
              color: Colors.pink[300],
            )),
            SizedBox(
              width: w(7),
            ),
            Icon(
              Icons.image,
              color: Colors.pink[300],
            ),
            SizedBox(
              width: w(10),
            ),
            Icon(
              Icons.send,
              color: Colors.pink[300],
            ),
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
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, h(70)),
        child: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          automaticallyImplyLeading: false,
          // backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Theme.of(context).accentColor),
          leading: Container(
            padding: EdgeInsets.only(left: w(30)),
            child: Icon(
              Icons.chevron_left,
              size: w(30),
            ),
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: h(40),
                width: w(40),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(w(30)),
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
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(w(15))),
                      ),
                      SizedBox(
                        width: h(3),
                      ),
                      Container(
                        child: Text(
                          "Online",
                          style:
                              TextStyle(color: Colors.pink, fontSize: sp(12)),
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
              child: Icon(
                Icons.call,
                color: Colors.pink,
                size: w(28),
              ),
            ),
            SizedBox(
              width: w(20),
            ),
            Container(
              child: Icon(
                Icons.video_call,
                color: Colors.pink,
                size: w(28),
              ),
            ),
            SizedBox(
              width: w(20),
            ),
            Container(
              child: Icon(
                Icons.more_vert,
                color: Colors.pink,
                size: w(28),
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
                borderRadius: BorderRadius.circular(w(10))),
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
                                child: Container(
                                  height: h(70),
                                  width: w(70),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/img1.png"),
                                          fit: BoxFit.cover),
                                      borderRadius:
                                          BorderRadius.circular(w(50)),
                                      color: Colors.red),
                                ),
                              ),
                              Positioned(
                                left: w(100),
                                child: Container(
                                  height: h(70),
                                  width: w(70),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/image2.png"),
                                          fit: BoxFit.cover),
                                      borderRadius:
                                          BorderRadius.circular(w(50)),
                                      color: Colors.blue),
                                ),
                              ),
                              Positioned(
                                  left: w(160),
                                  top: h(20),
                                  child: Container(
                                    // padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        // borderRadius: BorderRadius.circular(30),
                                        // border: Border.all(color: Colors.white)
                                        ),
                                    child: Container(
                                      height: h(40),
                                      width: w(40),
                                      decoration: BoxDecoration(
                                          color: Colors.pink,
                                          border: Border.all(
                                              color: Colors.white, width: w(3)),
                                          borderRadius:
                                              BorderRadius.circular(w(35))),
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
