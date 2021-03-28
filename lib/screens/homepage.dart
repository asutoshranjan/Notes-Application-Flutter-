import 'package:flutter/material.dart';
import 'package:notes/database_helper.dart';
import 'package:notes/screens/aboutpage.dart';
import 'package:notes/screens/favouritepage.dart';
import 'package:notes/screens/taskpage.dart';
import 'package:notes/widgets.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Aboutpage() ));
                    },

                    child: Container(
                      margin: EdgeInsets.only(
                        top: 17.0,
                        bottom: 24.0,
                      ),
                      child: Image(
                        image: AssetImage('assets/images/Asset 11.png'),
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
              // for add icon
              Positioned(
                bottom: 24.0,
                right: 0.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Taskpage(task: null,)
                      ),
                    ).then((value) {
                      setState(() {});
                    });
                  },
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF3E92CC),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image(
                      image: AssetImage(
                        "assets/images/add_icon.png",
                      ),
                    ),
                  ),
                ),
              ),
              //

              // for heart icon

              Positioned(
                top: 18.0,
                right: 0.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Favouritepage()
                      ),
                    );
                  },
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFAEB),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Image(
                      image: AssetImage(
                        "assets/images/Asset 13.png",
                      ),
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
