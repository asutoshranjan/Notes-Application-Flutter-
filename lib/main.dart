import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/screens/homepage.dart';
import 'package:notes/screens/onboardingscreen.dart';
import 'package:notes/screens/onboardingsplashscreen.dart';
import 'package:notes/screens/splashscreeninitial.dart';
import 'package:shared_preferences/shared_preferences.dart';

int initScreen;

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = await preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      initialRoute: initScreen == 0 || initScreen == null ? 'onboard' : 'home',
      routes: {
        'home': (context) => SplashScreen(),
        'onboard': (context) => SplashScreenOnboard(),
      },
    );
  }
}
