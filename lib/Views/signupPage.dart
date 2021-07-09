import 'package:bloved/Views/VerificationScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final w = ScreenUtil().setWidth;
  final h = ScreenUtil().setHeight;
  final sp = ScreenUtil().setSp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/splashImage.png",
              ),
              fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  // margin: EdgeInsets.only(left: w(20), right: w(20)),
                  height: h(60),
                  width: w(350),
                  decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          CountryCodePicker(
                            // padding: EdgeInsets.all(5),
                            backgroundColor: Colors.white,
                            onChanged: print,
                            showCountryOnly: true,
                            initialSelection: 'IN',
                            showFlagDialog: false,
                            // showDropDownButton: true,
                            hideMainText: true,
                          ),
                          Positioned(
                            top: h(12),
                            left: w(50),
                            child: Icon(
                              Icons.expand_more,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Container(
                        color: Colors.white,
                        height: h(40),
                        width: w(1),
                      ),
                      SizedBox(
                        width: w(10),
                      ),
                      Container(
                          width: w(250),
                          child: TextField(
                            keyboardType: TextInputType.numberWithOptions(
                              decimal: false,
                            ),
                            maxLength: 10,
                            decoration: InputDecoration(
                              counterText: "",
                              labelText: "Enter Phone Number",
                              labelStyle:
                                  GoogleFonts.ubuntu(color: Colors.white),
                              border: InputBorder.none,
                            ),
                          )),
                    ],
                  )),
            ],
          ),
          SizedBox(
            height: h(20),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return VerificationScreen();
              }));
            },
            child: Container(
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
                  color: Color(0xffff61a1),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                "Get Started",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
            ),
          ),
          SizedBox(
            height: h(100),
          ),
          Text(
            "Terms & Conditions",
            style: TextStyle(color: Colors.white, fontSize: sp(11)),
          ),
          SizedBox(
            height: h(20),
          ),
        ],
      ),
    ));
  }
}
