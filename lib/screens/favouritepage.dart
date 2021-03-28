import 'package:flutter/material.dart';
import 'package:notes/database_helper.dart';
import 'package:notes/screens/aboutpage.dart';
import 'package:notes/screens/favouritepage.dart';
import 'package:notes/screens/taskpage.dart';
import 'package:notes/widgets.dart';

class Favouritepage extends StatefulWidget {
  @override
  _FavouritepageState createState() => _FavouritepageState();
}

class _FavouritepageState extends State<Favouritepage> {

  DatabaseHelper _dbHelper = DatabaseHelper(); // creating instance of data base helper class here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          color: Color(0xFFDEF6F4),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },

                    child: Container(
                      margin: EdgeInsets.only(
                        top: 34.0,
                        bottom: 47.0,
                      ),
                      child: Image(
                        image: AssetImage('assets/images/back_arrow_icon.png'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder(
                      initialData: [],
                      future: _dbHelper.getTasks(),
                      builder: (context, snapshot) {
                        return ScrollConfiguration(
                          behavior: NoGlowBehaviour(),
                          child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Taskpage(
                                    task: snapshot.data[index],
                                  )),
                                  ).then((value) {
                                    setState(() {});
                                  });
                                },
                                child: TaskCardWidget(
                                  title: snapshot.data[index].title,
                                  description: snapshot.data[index].description,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),


              //

              // Favourite Text

              Positioned(
                top: 18.0,
                right: 94.0,
                  child: Container(
                    child: Text(
                      "Favourites",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF524CDA),
                      ),
                    ),
                  ),
              ),



              //
            ],
          ),
        ),
      ),
    );
  }
}

