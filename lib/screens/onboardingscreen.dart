import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:notes/screens/homepage.dart';
import 'package:notes/widgets.dart';


class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: IntroductionScreen(
          pages: [

            //page 1

            PageViewModel(
              title: "Notes",
              body: "A simple minimal secure app to manage notes on your device for both android and ios. It's really easy to use with its awesome user interface",
              image: buildImage('assets/images/Asset 31.png'),
              decoration: getPageDecoration(),
            ),


            // page 2

            PageViewModel(
              title: "Add  Edit  Delete",
              body: "Tap on the add button to add a note, add a title and write your notes. You can edit them whenever you want and delete after your task is done. Favourites to add your favourite notes (beta Feature)",
              image: buildImage('assets/images/Asset 33.png'),
              decoration: getPageDecoration(),
            ),

            // page 3

            PageViewModel(
              title: "About",
              body: "Tap on the logo and get directed to about page for more information about the app, you can also contact the developer with your suggestions and feedback. Social media handles are linked",
              footer: ButtonWidget(
                text: 'Get Started' ,
                onClicked: () => goToHome(context),
              ),
              image: buildImage('assets/images/Asset 32.png'),
              decoration: getPageDecoration(),

            ),


          ],
          done: Text('Done', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          onDone: () => goToHome(context),
          showNextButton: false,
          showSkipButton: true,
          skip: Text('Skip', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          dotsDecorator: getDotDecoration(),
          globalBackgroundColor: Color(0xFFFEFFF4),
        )
    );
  }
  
  void goToHome(context) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => Homepage()),
  );
  
  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width:350));

DotsDecorator getDotDecoration() => DotsDecorator(
  size: Size(8,10),
  activeSize: Size(15,10),
  activeShape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(24),
  ),
);

  PageDecoration getPageDecoration() => PageDecoration(
    titleTextStyle: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Color(0xFF0A2463)),
    bodyTextStyle: TextStyle(fontSize: 15.5, color: Color(0xFF6E90DA), fontStyle: FontStyle.italic),
    descriptionPadding: EdgeInsets.only(top: 12, bottom: 12),
    pageColor: Color(0xFFFEFFF4),
  );
}
