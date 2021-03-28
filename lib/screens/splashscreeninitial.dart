import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:notes/screens/homepage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage())),);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(color: Color(0xFFDEF6F4)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 240,
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 47,
                            child: Image(
                              image: AssetImage(
                                  'assets/images/Asset 11.png'
                              ),
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 10),
                        ),
                        Text(
                          "Notes",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3E8ABB),
                          ),

                        )
                      ],
                    ),
                  ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 200,
                      ),
                      child: CircularProgressIndicator(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0),
                    ),
                    Text(
                      "© Asutosh Ranjan ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF6E90DA),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
