import 'package:bloved/Views/MainHomePage.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationScreen extends StatefulWidget {
  VerificationScreen({Key? key}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final w = ScreenUtil().setWidth;
  final h = ScreenUtil().setHeight;
  final sp = ScreenUtil().setSp;
  String number1 = "";
  String number2 = "";
  String number3 = "";
  String number4 = "";
  int index = -1;
  List<String> numbers = ["g"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/splashImage.png",
                ),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            SizedBox(
              height: h(150),
            ),
            Container(
              child: Text(
                "Enter 4 digit code",
                style: GoogleFonts.ubuntu(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: sp(20)),
              ),
            ),
            SizedBox(
              height: h(10),
            ),
            Container(
              child: Text(
                "The code was sent your mobile number",
                style: GoogleFonts.ubuntu(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: h(10),
            ),
            Container(
              child: Text(
                "(281) 330- 8004",
                style: GoogleFonts.ubuntu(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: h(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: h(50),
                    width: w(50),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(w(5))),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.only(left: w(19)),
                        child: TextField(
                          maxLength: 1,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: false,
                          ),
                          decoration: InputDecoration(
                            counterText: "",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    )),
                SizedBox(width: w(10)),
                Container(
                  height: h(50),
                  width: w(50),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Container(
                    padding: EdgeInsets.only(left: w(19)),
                    child: TextField(
                      maxLength: 1,
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: false,
                      ),
                      decoration: InputDecoration(
                        counterText: "",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: w(10)),
                Container(
                  height: h(50),
                  width: w(50),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7)),
                  child: Container(
                    padding: EdgeInsets.only(left: w(19)),
                    child: TextField(
                      maxLength: 1,
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: false,
                      ),
                      decoration: InputDecoration(
                        counterText: "",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: w(10)),
                Container(
                  height: h(50),
                  width: w(50),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Container(
                    padding: EdgeInsets.only(left: w(19)),
                    child: TextField(
                      maxLength: 1,
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: false,
                      ),
                      decoration: InputDecoration(
                        counterText: "",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: h(40),
            ),
            CircularProgressIndicator(
              color: Colors.pink[300],
            ),
            SizedBox(
              height: h(5),
            ),
            Text(
              "Verifying Code",
              style: TextStyle(
                  fontFamily: "BreezeSans",
                  fontSize: sp(14),
                  color: Colors.white),
            ),

            SizedBox(
              height: h(70),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return MainHomePage();
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
                  "Continue",
                  style: TextStyle(
                      fontSize: sp(18),
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
              ),
            ),
            SizedBox(
              height: h(50),
            ),
            // Container(
            //   color: Colors.white,
            //   child: Row(
            //     children: [
            //       phoneNumberWithAlpha2("1", "", "", "", ""),
            //       SizedBox(
            //         width: w(5),
            //       ),
            //       phoneNumberWithAlpha2("2", "A", "B", "C", ""),
            //       SizedBox(
            //         width: w(5),
            //       ),
            //       phoneNumberWithAlpha2("3", "D", "E", "F", "")
            //     ],
            //   ),
            // ),
            // Container(
            //   color: Colors.white,
            //   child: Row(
            //     children: [
            //       phoneNumberWithAlpha2("4", "G", "H", "I", ""),
            //       SizedBox(
            //         width: w(5),
            //       ),
            //       phoneNumberWithAlpha2("5", "J", "K", "L", ""),
            //       SizedBox(
            //         width: w(5),
            //       ),
            //       phoneNumberWithAlpha2("6", "M", "N", "O", "")
            //     ],
            //   ),
            // ),
            // Container(
            //   color: Colors.white,
            //   child: Row(
            //     children: [
            //       phoneNumberWithAlpha2("7", "P", "Q", "R", "S"),
            //       SizedBox(
            //         width: w(5),
            //       ),
            //       phoneNumberWithAlpha2("8", "T", "U", "V", ""),
            //       SizedBox(
            //         width: w(5),
            //       ),
            //       phoneNumberWithAlpha2("9", "W", "X", "Y", "Z")
            //     ],
            //   ),
            // ),
            // Container(
            //   color: Colors.white,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       phoneNumberWithAlpha2("0", "", "", "", ""),
            //       SizedBox(
            //         width: w(5),
            //       ),
            //       clear(
            //         Icons.backspace_outlined,
            //       ),
            //       SizedBox(
            //         width: w(5),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    ));
  }

  Widget clear(var icon) {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Container(
          margin: EdgeInsets.only(
            left: w(5),
          ),
          height: h(50),
          width: w(114),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: Center(child: Icon(icon)),
        ));
  }

  Widget phoneNumber(String num) {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: GestureDetector(
          onTap: () {
            setState(() {
              number1 = num;
            });
          },
          child: Container(
            margin: EdgeInsets.only(
              left: w(5),
            ),
            height: h(50),
            width: w(114),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Center(
              child: Text(
                num,
                style: TextStyle(fontSize: sp(22)),
              ),
            ),
          ),
        ));
  }

  // Widget phoneNumberWithAlpha(
  //     String num, String alpha1, String alpha2, String alpha3) {
  //   return Card(
  //       elevation: 5,
  //       shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.all(Radius.circular(10))),
  //       child: Container(
  //         margin: EdgeInsets.only(
  //           left: w(5),
  //         ),
  //         height: h(50),
  //         width: w(114),
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(5),
  //           color: Colors.white,
  //         ),
  //         child: Center(
  //           child: Column(
  //             children: [
  //               Text(
  //                 num,
  //                 style: TextStyle(fontSize: sp(22)),
  //               ),
  //               SizedBox(
  //                 height: h(3),
  //               ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Text(
  //                     alpha1,
  //                     style: TextStyle(
  //                         fontSize: sp(12), fontWeight: FontWeight.w600),
  //                   ),
  //                   Text(alpha2,
  //                       style: TextStyle(
  //                           fontSize: sp(12), fontWeight: FontWeight.w600)),
  //                   Text(alpha3,
  //                       style: TextStyle(
  //                           fontSize: sp(12), fontWeight: FontWeight.w600))
  //                 ],
  //               )
  //             ],
  //           ),
  //         ),
  //       ));
  // }

  Widget phoneNumberWithAlpha2(
      String num, String alpha1, String alpha2, String alpha3, String alpha4) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: alpha1 == ""
          ? GestureDetector(
              onTap: () {
                setState(() {
                  numbers.add(num);
                });
              },
              child: Container(
                margin: EdgeInsets.only(
                  left: w(5),
                ),
                height: h(50),
                width: w(114),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    num,
                    style: TextStyle(fontSize: sp(22)),
                  ),
                ),
              ),
            )
          : GestureDetector(
              onTap: () {
                numbers.add(num);
              },
              child: Container(
                margin: EdgeInsets.only(
                  left: w(5),
                ),
                height: h(50),
                width: w(114),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        num,
                        style: TextStyle(fontSize: sp(22)),
                      ),
                      SizedBox(
                        height: h(3),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            alpha1,
                            style: TextStyle(
                                fontSize: sp(12), fontWeight: FontWeight.w600),
                          ),
                          Text(alpha2,
                              style: TextStyle(
                                  fontSize: sp(12),
                                  fontWeight: FontWeight.w600)),
                          Text(alpha3,
                              style: TextStyle(
                                  fontSize: sp(12),
                                  fontWeight: FontWeight.w600)),
                          Text(alpha4,
                              style: TextStyle(
                                  fontSize: sp(12),
                                  fontWeight: FontWeight.w600))
                        ],
                      )
                    ]),
              ),
            ),
    );
  }
}
