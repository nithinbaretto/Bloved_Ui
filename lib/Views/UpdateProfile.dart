import 'package:flutter/material.dart';
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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(h(90)),
          child: AppBar(
            centerTitle: true,
            title: Container(
              padding: EdgeInsets.only(top: h(30)),
              child: Text(
                "Profile",
                style: GoogleFonts.ubuntu(
                    fontSize: sp(20),
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            elevation: 0,
            backgroundColor: Theme.of(context).backgroundColor,
            actions: [
              Container(
                  padding: EdgeInsets.only(right: w(30), top: h(30)),
                  child: Text(
                    "Done",
                    style: TextStyle(
                        color: Colors.pink[300],
                        fontSize: sp(20),
                        fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: h(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: w(20),
                    ),
                    child: Text(
                      "PICTURES",
                      style: TextStyle(
                          fontSize: sp(16),
                          color: Theme.of(context).accentColor),
                    ),
                  ),
                  Row(
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
                      Container(
                        padding: EdgeInsets.only(),
                        height: h(10),
                        width: w(10),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      SizedBox(
                        width: w(5),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: w(20)),
                        height: h(10),
                        width: w(10),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                      )
                    ],
                  ),
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
                            fontSize: sp(18),
                            color: Theme.of(context).accentColor),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: w(20)),
                      child: FlutterSwitch(
                        activeColor: Colors.pink,
                        width: 65.0,
                        height: 35.0,
                        valueFontSize: 25.0,
                        toggleSize: 45.0,
                        value: status,
                        borderRadius: 30.0,
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
                padding: EdgeInsets.only(left: w(10)),
                child: Text(
                  "Smart Photos continuously tests all your profile photos to find the best one",
                  style: TextStyle(color: Colors.grey, fontSize: sp(12)),
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
                            fontSize: sp(16),
                            color: Theme.of(context).accentColor)),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(),
                        height: h(10),
                        width: w(10),
                        decoration: BoxDecoration(
                            color: Colors.pink[300],
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      SizedBox(
                        width: w(5),
                      ),
                      Container(
                        padding: EdgeInsets.only(),
                        height: h(10),
                        width: w(10),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      SizedBox(
                        width: w(5),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: w(20)),
                        height: h(10),
                        width: w(10),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: h(5),
              ),
              Container(
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
                            color: Colors.blueGrey[100],
                            borderRadius: BorderRadius.circular(w(30))),
                        child: Container(
                          margin: EdgeInsets.only(
                              left: w(15),
                              right: w(15),
                              top: h(15),
                              bottom: h(15)),
                          child: Image.asset(
                            "assets/images/snapchat.png",
                            color: Colors.grey,
                          ),
                        )),
                    Container(
                        height: h(60),
                        width: w(60),
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[100],
                            borderRadius: BorderRadius.circular(w(30))),
                        child: Container(
                          margin: EdgeInsets.only(
                              left: w(15),
                              right: w(15),
                              top: h(15),
                              bottom: h(15)),
                          child: Image.asset(
                            "assets/images/facebook.png",
                            color: Colors.grey,
                          ),
                        )),
                    Container(
                        height: h(60),
                        width: w(60),
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[100],
                            borderRadius: BorderRadius.circular(w(30))),
                        child: Container(
                          margin: EdgeInsets.only(
                              left: w(15),
                              right: w(15),
                              top: h(15),
                              bottom: h(15)),
                          child: Image.asset(
                            "assets/images/tiktok.png",
                            height: h(20),
                            width: w(20),
                            color: Colors.grey,
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.only(right: w(40)),
                        height: h(60),
                        width: w(60),
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[100],
                            borderRadius: BorderRadius.circular(w(30))),
                        child: Container(
                          margin: EdgeInsets.only(
                              left: w(15),
                              right: w(15),
                              top: h(15),
                              bottom: h(15)),
                          child: Image.asset(
                            "assets/images/instagram.png",
                            color: Colors.pink,
                          ),
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
                  "BIO",
                  style: TextStyle(
                      fontSize: sp(16), color: Theme.of(context).accentColor),
                ),
              ),
              SizedBox(
                height: h(5),
              ),
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
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          top: h(5), left: w(5), bottom: 0, right: 0)),
                ),
              ),
              SizedBox(
                height: h(20),
              ),
              Container(
                padding: EdgeInsets.only(left: w(20)),
                child: Text(
                  "ABOUT VERIFICATION",
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
              ),
              SizedBox(
                height: h(10),
              ),
              Container(
                padding: EdgeInsets.only(left: w(20)),
                child: Text(
                  "verified users get more attentions- take 2 minutes to stand out",
                  style: TextStyle(color: Colors.grey, fontSize: sp(12)),
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
                      color: Colors.pink[300],
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
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
              ),
              SizedBox(
                height: h(10),
              ),
              Container(
                padding: EdgeInsets.only(left: w(20), right: w(20)),
                child: Text(
                  "answer just three questions to cut the crap and get down to the real stuff",
                  style: TextStyle(color: Colors.grey, fontSize: sp(12)),
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
                      border: Border.all(color: Colors.pink.shade300),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    "Add My profile Qs",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink[300]),
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
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
              ),
              SizedBox(
                height: h(5),
              ),
              appearance(Icons.favorite, "Relationship"),
              SizedBox(
                height: h(3),
              ),
              appearance(Icons.favorite, "Sexuality"),
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
              appearance(Icons.favorite, "Hair"),
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
              appearance(Icons.work, "Work"),
              SizedBox(
                height: h(3),
              ),
              appearance(Icons.work, "Education"),
              SizedBox(
                height: h(10),
              ),
              Container(
                padding: EdgeInsets.only(left: w(20)),
                child: Text(
                  "GENDER",
                  style: TextStyle(color: Theme.of(context).accentColor),
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: w(15)),
                          child: Text(
                            "Male",
                            style: TextStyle(
                                fontSize: sp(16),
                                color: Theme.of(context).accentColor),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: w(10)),
                          child: Text("FeMale",
                              style: TextStyle(
                                  fontSize: sp(16),
                                  color: Theme.of(context).accentColor)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: h(10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = "Males";
                            });
                          },
                          child: Container(
                            height: h(25),
                            width: w(25),
                            decoration: BoxDecoration(
                              color: Colors.pink[300],
                              borderRadius: BorderRadius.circular(w(30)),
                            ),
                            child: Icon(
                              Icons.done,
                              color: Colors.white,
                              size: w(20),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = "Females";
                            });
                          },
                          child: Container(
                            height: h(25),
                            width: w(25),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(w(30)),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: Icon(
                              Icons.done,
                              color: Colors.white,
                              size: w(20),
                            ),
                          ),
                        ),
                      ],
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
                  Container(
                    padding: EdgeInsets.only(left: w(20)),
                    child: Text(
                      "INTERESTS",
                      style: TextStyle(color: Theme.of(context).accentColor),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(),
                        height: h(10),
                        width: w(10),
                        decoration: BoxDecoration(
                            color: Colors.pink[300],
                            borderRadius: BorderRadius.circular(w(10))),
                      ),
                      SizedBox(
                        width: w(5),
                      ),
                      Container(
                        padding: EdgeInsets.only(),
                        height: h(10),
                        width: w(10),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(w(10))),
                      ),
                      SizedBox(
                        width: w(5),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: w(20)),
                        height: h(10),
                        width: w(10),
                        decoration: BoxDecoration(
                            color: Colors.grey,
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
                        color: Colors.pink[300],
                        borderRadius: BorderRadius.circular(w(30))),
                    child: Center(
                        child: Text(
                      "Astrology",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  SizedBox(
                    width: w(5),
                  ),
                  Container(
                    height: h(30),
                    width: w(100),
                    decoration: BoxDecoration(
                        color: Colors.pink[300],
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
                          style: TextStyle(color: Colors.white),
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
                        color: Colors.pink[300],
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
                          style: TextStyle(color: Colors.white),
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
                        border: Border.all(color: Colors.pink.shade300),
                        borderRadius: BorderRadius.circular(w(30))),
                    child: Icon(
                      Icons.add,
                      size: 24,
                      color: Colors.pink[300],
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
                  style: TextStyle(color: Theme.of(context).accentColor),
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
                              style: TextStyle(fontSize: sp(16)),
                            ))
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.only(right: w(20)),
                        child: Text(
                          "CONNECT",
                          style: TextStyle(color: Colors.pink[300]),
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
                  style: TextStyle(color: Theme.of(context).accentColor),
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
                              "Connect Instagram",
                              style: TextStyle(
                                  fontSize: sp(16),
                                  color: Theme.of(context).accentColor),
                            ))
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.only(right: w(20)),
                        child: Text(
                          "CONNECT",
                          style: TextStyle(color: Colors.pink[300]),
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
                  color: Colors.pink[300],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: w(10),
                ),
                child: Text(
                  txt,
                  style: TextStyle(
                      fontSize: sp(16), color: Theme.of(context).accentColor),
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(
              right: w(10),
            ),
            child: Icon(Icons.navigate_next),
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
                  color: Colors.pink[300],
                ),
              )),
              Container(
                padding: EdgeInsets.only(
                  left: w(10),
                ),
                child: Text(
                  txt,
                  style: TextStyle(
                      fontSize: sp(16), color: Theme.of(context).accentColor),
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(
              right: w(10),
            ),
            child: Icon(Icons.navigate_next),
          )
        ],
      ),
    );
  }
}
