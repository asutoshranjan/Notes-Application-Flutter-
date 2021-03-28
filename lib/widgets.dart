import 'package:flutter/material.dart';
class TaskCardWidget extends StatelessWidget {
  final String title;
  final String description;
  TaskCardWidget({this.title, this.description});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 32.0,
        horizontal: 24.0,
      ),
      margin: EdgeInsets.only(
        bottom: 24.0,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? "(Unnamed Title!!!)",
            style: TextStyle(
              color: Color(0xFF0A2463),
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top : 5,
            ),
            child: Text(
             description ?? "No Note Description",
                  style: TextStyle(
                    color: Color(0xFF1E1B18),
                    fontSize: 16.0,

                    height: 1.5,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class TodoWidget extends StatelessWidget {
  final bool isDone;
  TodoWidget({@required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 24.0,
        bottom: 40.0,
      ),
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            margin: EdgeInsets.only(
              right: 12.0,
            ),
            decoration: BoxDecoration(
              color: isDone ? Color(0xFFFF4B76) : Colors.transparent,
              borderRadius: BorderRadius.circular(6.0),
              border: isDone ? null : Border.all(
                color: Color(0xFF86829D),
                width: 1.5,
              )
            ),

            child: Image(
              image: AssetImage(
                'assets/images/check_icon.png'
              ),
            ),
          ),
          Text("Favourite",
            style: TextStyle(
              color: isDone ? Color(0xFF131111) : Color(0xFF86829D),
              fontSize: 16.0,
              fontWeight: isDone? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

// for removing the default scroll glow

class NoGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection)
  {
    return child;
  }

}

class AboutinfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 2,
      ),
      child: Text(
        "Notes",
        style: TextStyle(
          color: Color(0xFF0A2463),
          fontSize: 21,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}


// button  Widget

class ButtonWidget extends StatelessWidget {

  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key key,
    @required this.text,
    @required this.onClicked,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(onPressed: onClicked,
      color: Color(0xFF5ABCFF),
      shape: StadiumBorder(),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Text(
        text,
        style: TextStyle(color:Color(0xFFFEFFF4), fontSize: 17)
      ),
    );
  }
}


