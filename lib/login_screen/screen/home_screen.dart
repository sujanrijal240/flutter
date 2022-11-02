// import 'package:bpls/login_screen/screen/auth_service.dart';
// import 'package:bpls/login_screen/screen/signup_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:bpls/login_screen/screen/Bottom_navigate_Page/reels_page.dart';
import 'package:bpls/login_screen/screen/Bottom_navigate_Page/setting_page.dart';
import 'package:flutter/material.dart';

import '../utils/color_utils.dart';
import 'Bottom_navigate_Page/home_screen.dart';
import 'Drawer/drawer_main_page.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<Widget> body = const [
    HomePage(),
    ReelsPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('B P L S'),
          centerTitle: true,
          flexibleSpace: Container(
              decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                hexStringToColor("CB2B93"),
                hexStringToColor("9546C4"),
                hexStringToColor("5E61F4"),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          )),
        ),
        body: Center(
          child: body[_currentIndex],
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     // Text(
          //     //   FirebaseAuth.instance.currentUser!.displayName!,

          //     //   style:  TextStyle(
          //     // color: Colors.indigo[900], fontWeight: FontWeight.bold, fontSize: 16),
          //     // ),
          //     SizedBox(
          //       height: 15,
          //     ),
          //     Text(
          //       FirebaseAuth.instance.currentUser!.email!,
          //       // "k",
          //       style:  TextStyle(
          //     color: Colors.indigo[900], fontWeight: FontWeight.bold, fontSize: 16),
          //     ),
          //     ElevatedButton(
          //       child: Text("log Out"),
          //       onPressed: (){
          //         print("Signed Out");
          //         AuthService().signOut();
          //         FirebaseAuth.instance.signOut().then((value) {
          //           Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
          //         });

          //       },
          //     ),
          //   ],
          // ),
        ),
        drawer: DrawerPage(),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (int newIndex) {
              setState(() {
                _currentIndex = newIndex;
              });
            },
            items: const[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.ad_units), label: 'Reels'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting')
            ]),
      ),
    );
  }
}
