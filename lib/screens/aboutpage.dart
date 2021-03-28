import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/widgets.dart';
import 'package:url_launcher/url_launcher.dart';



class Aboutpage extends StatefulWidget {
  @override
  _AboutpageState createState() => _AboutpageState();
}

class _AboutpageState extends State<Aboutpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 17.0,
          ),
          color: Color(0xFFDEF6F4),
          child: Column(

            //cross Axis Alignment Assigned
            crossAxisAlignment: CrossAxisAlignment.center,



            children: [

              Container(
                child: Row(
                  children: [

                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 2,
                          left: 5,
                        ),
                        child: Image(
                          image: AssetImage(
                              'assets/images/back_arrow_icon.png'
                          ),
                        ),
                      ),
                    ),

                    // About

                    Container(
                      padding: EdgeInsets.only(
                        top: 3,
                        left: 101,
                      ),
                      child: Text(
                        "About",
                        style: TextStyle(
                          color: Color(0xFF524CDA),
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  ],
                ),
              ),







              // image of app

              Container(
                padding: EdgeInsets.only(
                  top: 40,
                ),
                child: Image(
                  image: AssetImage(
                    'assets/images/Asset 11.png'
                  ),
                ),
              ),

              AboutinfoWidget(),

              Container(
                padding: EdgeInsets.only(
                  top: 8,
                ),
                child: Text(
                  "Simple  Minimal  Secure",
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(
                  top: 33,
                  bottom: 10,
                ),
                child: Text(
                  "Developer",
                  style: TextStyle(
                    color: Color(0xFF3E6ED0),
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              GestureDetector(
                onTap: (){
                  openurl1();
                },
                child: Container(
                  height: 204,
                  decoration: BoxDecoration(
                    color: Color(0xFF2AC6FF),
                        borderRadius: BorderRadius.circular(102),
                  ),
                  child: Image(
                    image: AssetImage(
                      'assets/images/Asset 20.png'
                    ),
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(
                  top: 10,
                ),
                child: Text(
                  "Asutosh Ranjan",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3E6ED0),
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(
                  top: 35,
                ),
                child: Text(
                  "Email: asutoshranjan.work@gmail.com",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF999999),
                  ),
                ),
              ),




                 GestureDetector(
                   onTap: (){
                     openurl2();
                   },
                   child: Container(
                    padding: EdgeInsets.only(
                      top: 12,
                    ),
                    child: Image(
                      image: AssetImage(
                          'assets/images/Asset 23.png'
                      ),
                    ),
                ),
                 ),
            ],
          ),
        ),
      ),
    );
  }

  openurl1()
  {
    String url1 ="https://www.instagram.com/asutosh_ranjan/?hl=en";
    launch(url1);
  }

  openurl2()
  {
    String url2 ="https://www.linkedin.com/in/asutoshranjan/";
    launch(url2);
  }


}




