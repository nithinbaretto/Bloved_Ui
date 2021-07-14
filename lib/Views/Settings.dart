import 'package:bloved/Controllers/darklightTheme.dart';
import 'package:bloved/utilities/ThemeManager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:provider/provider.dart';

import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'package:syncfusion_flutter_core/theme.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final w = ScreenUtil().setWidth;
  final h = ScreenUtil().setHeight;
  final sp = ScreenUtil().setSp;
  SfRangeValues _values = SfRangeValues(4.0, 8.0);
  bool status = false;
  bool statusForTheme = false;
  bool statusForGender = false;
  double _value = 40.0;

  var themeController = Get.put(ThemeValue());

  @override
  void initState() {
    super.initState();
    var value = themeController.themeValue.toString();
    if (value == "dark") {
      statusForTheme = false;
    } else {
      statusForTheme = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
        builder: (context, theme, _) => Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                centerTitle: true,
                elevation: 0,
                backgroundColor: Theme.of(context).backgroundColor,
              ),
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
                            "Settings",
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
                      height: h(50),
                    ),
                    Container(
                      color: Theme.of(context).backgroundColor,
                      height: h(235),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () => {},
                                child: Container(
                                  padding: EdgeInsets.only(top: h(20)),
                                  child: Icon(
                                    Icons.light_mode,
                                    color: Color(0xfffa5473),
                                    size: 50,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: w(100),
                              ),
                              GestureDetector(
                                onTap: () => {},
                                child: Container(
                                  padding: EdgeInsets.only(top: h(20)),
                                  child: Icon(
                                    Icons.dark_mode,
                                    color:
                                        themeController.themeValue.toString() ==
                                                "dark"
                                            ? Colors.white70
                                            : Color(0xffcecece),
                                    size: 50,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  padding:
                                      EdgeInsets.only(top: h(20), right: w(10)),
                                  child: Text(
                                    "Light",
                                    style: TextStyle(
                                        fontSize: sp(18),
                                        color: Theme.of(context).accentColor),
                                  )),
                              SizedBox(
                                width: w(100),
                              ),
                              Container(
                                  padding: EdgeInsets.only(top: h(20)),
                                  child: Text("Dark",
                                      style: TextStyle(
                                          fontSize: sp(18),
                                          color:
                                              Theme.of(context).accentColor)))
                            ],
                          ),
                          SizedBox(
                            height: h(20),
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    statusForTheme = true;
                                    theme.setLightMode();
                                    themeController.updateValue("light");
                                  });
                                },
                                child: Container(
                                    margin: EdgeInsets.only(left: w(110)),
                                    height: h(25),
                                    width: w(25),
                                    decoration: statusForTheme == true
                                        ? BoxDecoration(
                                            color: Color(0xfffa5473),
                                            shape: BoxShape.circle,
                                          )
                                        : BoxDecoration(
                                            // color: Colors.pink[300],
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.white)),
                                    child: statusForTheme == true
                                        ? Icon(
                                            Icons.done,
                                            color: Colors.white,
                                            size: w(20),
                                          )
                                        : Container()),
                              ),
                              SizedBox(
                                width: w(120),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    statusForTheme = false;
                                    theme.setDarkMode();
                                    themeController.updateValue("dark");
                                  });
                                },
                                child: Container(
                                    margin: EdgeInsets.only(left: w(0)),
                                    height: h(25),
                                    width: w(25),
                                    decoration: statusForTheme == false
                                        ? BoxDecoration(
                                            color: Color(0xfffa5473),
                                            shape: BoxShape.circle,
                                          )
                                        : BoxDecoration(
                                            // color: Colors.pink[300],
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Theme.of(context)
                                                    .accentColor)),
                                    child: statusForTheme == false
                                        ? Icon(
                                            Icons.done,
                                            color: Colors.black,
                                            size: w(20),
                                          )
                                        : Container()),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h(10),
                          ),
                          Divider(
                            thickness: 1,
                            color:
                                themeController.themeValue.toString() == "dark"
                                    ? Colors.white10
                                    : Color(0xfff7f7f7),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    top: h(10), left: w(20), bottom: h(20)),
                                child: Text(
                                  "Device Default",
                                  style: TextStyle(
                                      fontSize: sp(17),
                                      color: Theme.of(context).accentColor),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: w(20)),
                                child: FlutterSwitch(
                                  activeColor: Colors.pink,
                                  inactiveColor:
                                      themeController.themeValue.toString() ==
                                              "dark"
                                          ? Colors.white12
                                          : Color(0xffcecece),
                                  // inactiveColor: Sca,
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
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h(30),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: w(20)),
                      child: Text(
                        "ACCOUNT SETTINGS",
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: sp(15)),
                      ),
                    ),
                    SizedBox(
                      height: h(10),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: w(20)),
                      child: Text(
                        "Verify a phone number to help secure your account",
                        style: TextStyle(
                            fontSize: sp(11),
                            color: statusForTheme.toString() == "dark"
                                ? Color(0xffd4d4d4)
                                : Color(0xffa5a5a5)),
                      ),
                    ),
                    SizedBox(
                      height: h(10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            // margin: EdgeInsets.only(left: w(20), right: w(20)),
                            height: h(60),
                            width: w(360),
                            decoration: BoxDecoration(
                                color: Theme.of(context).backgroundColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CountryCodePicker(
                                  textStyle: TextStyle(
                                      color: Theme.of(context).accentColor),
                                  searchDecoration: InputDecoration(
                                      icon: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  )),
                                  dialogTextStyle:
                                      TextStyle(color: Colors.black),
                                  // showDropDownButton: true,
                                  padding: EdgeInsets.all(0),
                                  backgroundColor: Colors.white,
                                  onChanged: print,
                                  showCountryOnly: true,
                                  initialSelection: 'IN',
                                  // showFlagDialog: true,
                                  // showDropDownButton: true,
                                  hideMainText: false,
                                ),
                                // Icon(Icons.expand_more),
                                Container(
                                  color: Colors.grey[200],
                                  height: h(40),
                                  width: w(1),
                                ),
                                SizedBox(
                                  width: w(5),
                                ),
                                Container(
                                    width: w(230),
                                    child: TextField(
                                      keyboardType:
                                          TextInputType.numberWithOptions(
                                        decimal: false,
                                      ),
                                      maxLength: 10,
                                      decoration: InputDecoration(
                                        counterText: "",
                                        labelText: "Enter Phone Number",
                                        labelStyle: GoogleFonts.ubuntu(
                                            color: statusForTheme.toString() ==
                                                    "dark"
                                                ? Color(0xff555557)
                                                : Color(0xffcecece)),
                                        border: InputBorder.none,
                                      ),
                                    )),
                              ],
                            )),
                      ],
                    ),
                    SizedBox(
                      height: h(30),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: w(20)),
                        child: Text(
                          "DISCOVERY SETTINGS",
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: sp(15)),
                        )),
                    SizedBox(
                      height: h(10),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: w(20)),
                      child: Text(
                        "Change your location to see b'Loved members in other cities",
                        style: TextStyle(
                          color: statusForTheme.toString() == "dark"
                              ? Color(0xffd4d4d4)
                              : Color(0xffa5a5a5),
                          fontSize: sp(12),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h(10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            // margin: EdgeInsets.only(left: w(20), right: w(20)),
                            height: h(60),
                            width: w(360),
                            decoration: BoxDecoration(
                                color: Theme.of(context).backgroundColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Container(
                                  width: w(20),
                                ),
                                Icon(Icons.location_on,
                                    color: Color(0xfffa5473)),
                                Container(
                                  width: w(20),
                                ),
                                Container(
                                  color: Colors.grey[200],
                                  height: h(40),
                                  width: w(1),
                                ),
                                SizedBox(
                                  width: w(10),
                                ),
                                Container(
                                    width: w(230),
                                    child: TextField(
                                      keyboardType:
                                          TextInputType.numberWithOptions(
                                        decimal: false,
                                      ),
                                      maxLength: 10,
                                      decoration: InputDecoration(
                                        counterText: "",
                                        labelText: "Location",
                                        labelStyle: GoogleFonts.ubuntu(
                                            color: statusForTheme.toString() ==
                                                    "dark"
                                                ? Color(0xff555557)
                                                : Color(0xffcecece)),
                                        border: InputBorder.none,
                                      ),
                                    )),
                              ],
                            )),
                      ],
                    ),
                    SizedBox(
                      height: h(30),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: w(20)),
                      child: Text(
                        "SHOW ME",
                        style: TextStyle(
                            fontSize: sp(15),
                            color: Theme.of(context).accentColor),
                      ),
                    ),
                    SizedBox(
                      height: h(5),
                    ),
                    Container(
                      color: Theme.of(context).backgroundColor,
                      height: h(110),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: w(100),
                              ),
                              Container(
                                  padding: EdgeInsets.only(
                                    top: h(20),
                                  ),
                                  child: Text(
                                    "Males",
                                    style: TextStyle(
                                        fontFamily: "SFProText-Regular",
                                        fontSize: sp(17),
                                        color: Theme.of(context).accentColor),
                                  )),
                              SizedBox(
                                width: w(95),
                              ),
                              Container(
                                  padding: EdgeInsets.only(
                                    top: h(20),
                                  ),
                                  child: Text("Females",
                                      style: TextStyle(
                                          fontFamily: "SFProText-Regular",
                                          fontSize: sp(17),
                                          color:
                                              Theme.of(context).accentColor)))
                            ],
                          ),
                          SizedBox(
                            height: h(20),
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: w(110),
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
                                              color: Theme.of(context)
                                                  .accentColor),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                              ),
                              SizedBox(
                                width: w(118),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    statusForGender = true;
                                  });
                                },
                                child: statusForGender == false
                                    ? Container(
                                        margin: EdgeInsets.only(left: 10),
                                        height: h(25),
                                        width: w(25),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Theme.of(context)
                                                  .accentColor),
                                          shape: BoxShape.circle,
                                        ),
                                      )
                                    : Container(
                                        height: h(25),
                                        width: w(25),
                                        margin: EdgeInsets.only(left: 10),
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
                          SizedBox(
                            height: h(20),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h(30),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: h(20), right: h(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("MAXIMUM DISTANCE",
                              style: TextStyle(
                                  fontSize: sp(15),
                                  color: Theme.of(context).accentColor)),
                          Row(
                            children: [
                              Text(
                                "Km",
                                style: TextStyle(
                                  color: Color(0xfffa5473),
                                  fontSize: sp(15),
                                ),
                              ),
                              Icon(
                                Icons.expand_more,
                                color: Color(0xfffa5473),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                    SfRangeSliderTheme(
                      data: SfRangeSliderThemeData(
                          // tooltipBackgroundColor: Colors.pink,
                          ),
                      child: Obx(() => (Container(
                            padding: EdgeInsets.only(left: h(10), right: w(10)),
                            width: MediaQuery.of(context).size.width,
                            child: SfSlider(
                              inactiveColor:
                                  themeController.themeValue.toString() ==
                                          "dark"
                                      ? Colors.white30
                                      : Colors.white,
                              dividerShape: SfDividerShape(),
                              thumbIcon: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              min: 0.0,
                              max: 100.0,
                              value: _value,
                              interval: 20,
                              showTicks: false,
                              showLabels: false,
                              enableTooltip: true,
                              activeColor: Color(0xfffa5473),
                              tooltipShape: SfPaddleTooltipShape(),
                              // overlayShape:
                              minorTicksPerInterval: 1,
                              onChanged: (dynamic value) {
                                setState(() {
                                  _value = value;
                                });
                              },
                            ),
                          ))),
                    ),
                    SizedBox(
                      height: h(30),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: h(20), right: h(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "MAXIMUM DISTANCE",
                            style: TextStyle(
                                fontSize: sp(15),
                                color: Theme.of(context).accentColor),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: h(20),
                    // ),
                    SfRangeSliderTheme(
                        data: SfRangeSliderThemeData(
                          // thumbStrokeColor: Colors.white,
                          // overlappingThumbStrokeColor: Colors.white,
                          // thumbRadius: 10,
                          thumbColor: Colors.white,
                          tooltipBackgroundColor: Color(0xfffa5473),
                        ),
                        child: Obx(
                          () => Container(
                            padding: EdgeInsets.only(left: h(10), right: w(10)),
                            width: MediaQuery.of(context).size.width,
                            child: SfRangeSlider(
                              inactiveColor:
                                  themeController.themeValue.toString() ==
                                          "dark"
                                      ? Colors.white30
                                      : Colors.white,
                              startThumbIcon: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              endThumbIcon: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              min: 2.0,
                              max: 10.0,
                              interval: 1,
                              showTicks: false,
                              showLabels: false,
                              enableTooltip: true,
                              values: _values,
                              activeColor: Color(0xfffa5473),
                              tooltipShape: SfPaddleTooltipShape(),
                              onChanged: (SfRangeValues newValues) {
                                setState(() {
                                  _values = newValues;
                                });
                              },
                            ),
                          ),
                        )),
                    SizedBox(
                      height: h(30),
                    ),
                    Container(
                      color: Theme.of(context).backgroundColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                top: h(15), left: w(20), bottom: h(20)),
                            child: Text(
                              "Show me on b'love'd Default",
                              style: TextStyle(
                                  fontSize: sp(17),
                                  color: Theme.of(context).accentColor),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: w(20)),
                            child: FlutterSwitch(
                              inactiveColor:
                                  themeController.themeValue.toString() ==
                                          "dark"
                                      ? Colors.white12
                                      : Color(0xffcecece),
                              activeColor: Color(0xfffa5473),
                              width: 60.0,
                              height: 35.0,
                              valueFontSize: 20.0,
                              toggleSize: 45.0,
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
                      padding: EdgeInsets.only(left: w(20), right: w(20)),
                      child: Text(
                        "You can message your existing matches without showup in the card stack",
                        style: TextStyle(
                          fontSize: sp(11),
                          color: statusForTheme.toString() == "dark"
                              ? Color(0xffd4d4d4)
                              : Color(0xffa5a5a5),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h(30),
                    ),
                    expandeMore("Pick Settings", Icons.navigate_next),
                    SizedBox(
                      height: h(2),
                    ),
                    expandeMore("Read Receipts", Icons.navigate_next),
                    SizedBox(
                      height: h(2),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: w(20), right: w(20)),
                        height: h(50),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Active Status",
                              style: TextStyle(
                                  fontSize: sp(16),
                                  color: Theme.of(context).accentColor),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Active",
                                  style: TextStyle(
                                      color: Colors.grey[500], fontSize: 16),
                                ),
                                SizedBox(
                                  width: w(10),
                                ),
                                Icon(Icons.navigate_next,
                                    color:
                                        themeController.themeValue.toString() ==
                                                "dark"
                                            ? Colors.white12
                                            : Colors.black),
                              ],
                            )
                          ],
                        )),
                    SizedBox(
                      height: h(2),
                    ),
                    expandeMore("Notification", Icons.navigate_next),
                    SizedBox(
                      height: h(30),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: w(20)),
                      child: Text(
                        "PAYMENT SETTINGS",
                        style: TextStyle(
                            fontSize: sp(17),
                            color: Theme.of(context).accentColor),
                      ),
                    ),
                    SizedBox(
                      height: h(5),
                    ),
                    expandeMore("Manage your account", Icons.navigate_next),
                    SizedBox(
                      height: h(30),
                    ),
                    settings("Help & Support"),
                    SizedBox(
                      height: h(20),
                    ),
                    settings("Share b'Loved'd"),
                    SizedBox(
                      height: h(20),
                    ),
                    settings("Legal"),
                    SizedBox(
                      height: h(20),
                    ),
                    settings("Licences"),
                    SizedBox(
                      height: h(20),
                    ),
                    settings("Privacy Policy"),
                    SizedBox(
                      height: h(20),
                    ),
                    settings("Terms Of Services"),
                    SizedBox(
                      height: h(40),
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
                                        color: themeController.themeValue
                                                    .toString() ==
                                                "dark"
                                            ? Colors.white38
                                            : Colors.grey[800],
                                        fontFamily: "Antipasto Pro Demibold",
                                        fontWeight: FontWeight.bold,
                                        fontSize: sp(45)),
                                  ),
                                  Text("love",
                                      style: TextStyle(
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Antipasto Pro Demibold",
                                          fontSize: sp(45),
                                          color: Colors.pinkAccent)),
                                  SizedBox(
                                    width: w(3),
                                  ),
                                  Text("d",
                                      style: TextStyle(
                                          color: themeController.themeValue
                                                      .toString() ==
                                                  "dark"
                                              ? Colors.white38
                                              : Colors.grey[800],
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Pridi",
                                          fontSize: sp(45)))
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: w(240),
                            top: h(8),
                            child: RotationTransition(
                                turns: new AlwaysStoppedAnimation(15 / 360),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.pinkAccent,
                                  size: 6,
                                )),
                          ),
                          Positioned(
                            left: w(236),
                            top: h(3),
                            child: RotationTransition(
                                turns: new AlwaysStoppedAnimation(15 / 360),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.pinkAccent,
                                  size: 4,
                                )),
                          ),
                          Positioned(
                            left: w(233),
                            top: h(16),
                            child: RotationTransition(
                                turns: new AlwaysStoppedAnimation(15 / 360),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.pinkAccent,
                                  size: 9,
                                )),
                          ),
                          Positioned(
                            left: w(245),
                            top: h(13),
                            child: RotationTransition(
                                turns: new AlwaysStoppedAnimation(330 / 360),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.pinkAccent,
                                  size: 7,
                                )),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h(40),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: h(50),
                            width: w(150),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.pink.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                  ),
                                ],
                                color: Color(0xfffa5473),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                "Logout",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: sp(18),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          Container(
                            height: h(50),
                            width: w(150),
                            decoration: BoxDecoration(
                                // color: Colors.pink,
                                border: Border.all(color: Color(0xfffa5473)),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                "Deactive",
                                style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontSize: sp(18),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h(40),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: h(10), bottom: h(10)),
                      color: Theme.of(context).backgroundColor,
                      child: Center(
                        child: Text(
                          "Delete Account",
                          style: TextStyle(
                              fontSize: sp(18),
                              color: Theme.of(context).accentColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h(40),
                    ),
                  ],
                ),
              ),
            ));
  }

  Widget expandeMore(String txt, var icon) {
    return Container(
        padding: EdgeInsets.only(left: w(20), right: w(20)),
        height: h(50),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              txt,
              style: TextStyle(
                  fontSize: sp(17), color: Theme.of(context).accentColor),
            ),
            Icon(icon,
                color: themeController.themeValue.toString() == "dark"
                    ? Colors.white12
                    : Colors.black)
          ],
        ));
  }

  Widget settings(String txt) {
    return Container(
      padding: EdgeInsets.only(left: w(20)),
      child: Text(
        txt,
        style: TextStyle(color: Color(0xfffa5473), fontSize: 14),
      ),
    );
  }
}
