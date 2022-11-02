// ignore: unnecessary_import
import 'package:bpls/login_screen/screen/auth_service.dart';
import 'package:bpls/splash_screen/Views/onboarding_page.dart';
// import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './splash_screen/Views/pages.dart';


bool ? seenOnboard;
 void main() async {
  WidgetsFlutterBinding.ensureInitialized();

   await Firebase.initializeApp();


  //  Obtain a list of the Available camera
  //  final cameras = await availableCameras();

  //  final firstCamera = cameras.first;



  //to show status bar 
  // ignore: deprecated_member_use
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom, SystemUiOverlay.top]);
  // to load splash screen  for the first time only

  SharedPreferences pref = await SharedPreferences.getInstance();
  seenOnboard = pref.getBool('seenOnboard')?? false;
  //if null set to default false

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.manropeTextTheme(
          Theme.of(context).textTheme,
        ),
      
        primarySwatch: Colors.purple,
      ),
      home: seenOnboard == true ? AuthService().handleAuthState() : OnbordingPage(),
    );
  }
}