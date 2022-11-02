import 'package:bpls/login_screen/screen/Drawer/about_us_page.dart';
import 'package:bpls/login_screen/screen/Drawer/edit_profile.dart';
import 'package:bpls/login_screen/screen/Drawer/my_course.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

import '../auth_service.dart';
import '../signup_screen.dart';
import 'my_profile.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(

          padding: const EdgeInsets.all(0),

          children: [

             DrawerHeader(

              decoration: BoxDecoration(

                gradient: LinearGradient(colors: [
                  Colors.pink,
                  Colors.blue,
                ]
                ),

              ), 
              padding: EdgeInsets.all(0),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    CircleAvatar(
                       backgroundImage: AssetImage('assets/images/splash.png'),
                radius: 40,
                
                    ),
                     SizedBox(
                      height: 15,
                    ),
                    Text(
                      FirebaseAuth.instance.currentUser!.email!,
                      style:  TextStyle(
              color: Color.fromARGB(255, 15, 15, 17), fontWeight: FontWeight.bold, fontSize: 16),
                    )
                    
                  ],
                ),
                // backgroundImage: AssetImage('assets/images/splash.png'),
                // radius: 65,
                
              ),

              //BoxDecoration

              // child: UserAccountsDrawerHeader(

              //   decoration: BoxDecoration(gradient: LinearGradient(colors: [
              //     Colors.pink,
              //     Colors.blue,
              //   ]
              //   ),
              //    ),
                
              //   accountName: Text(
                  
              //     "Sujan Rijal",

              //     style: TextStyle(fontSize: 18),

              //   ),

              //   accountEmail: Text(
              //     "sujanrijal240@gmail.com"
                  
              //     ),

              //   currentAccountPictureSize: Size.square(50),

              //   currentAccountPicture: CircleAvatar(
                  
              //     backgroundColor:  Color.fromARGB(255, 82, 2, 64), 

              //     child: Text(

              //       "A",

              //       style: TextStyle(fontSize: 30.0, color: Colors.blue),

              //     ), //Text

              //   ), //circleAvatar

              // ), //UserAccountDrawerHeader

            ), //DrawerHeader

            ListTile(

              leading: const Icon(Icons.person,color: Colors.pink),

              title: const Text(' My Profile ',style:  TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),),

              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  const Myprofile(),
                ),);
                // Navigator.pop(context);

              },

            ),

            ListTile(

              leading: const Icon(Icons.book,color: Colors.pink),

              title: const Text(' My Course ',style:  TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),),

              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  const MyCourse(),
                ),);
                // Navigator.pop(context);

              },


            ),

            // ListTile(

            //   leading: const Icon(Icons.quora),

            //   title: const Text(' Quiz '),

            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) =>
            //       const MyQuiz(),
            //     ),);
            //     // Navigator.pop(context);

            //   },

            // ),

            ListTile(

              leading: const Icon(Icons.adb,color: Colors.pink),

              title: const Text(' About Us ',style:  TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),),

             onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  const AboutUs(),
                ),);
                // Navigator.pop(context);

              },

            ),


            ListTile(

              leading: const Icon(Icons.desktop_windows_rounded,color: Colors.pink),

              title: const Text(' Drawing Board ',style:  TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),),

             onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  const EditProfile(),
                ),);
                // Navigator.pop(context);

              },

            ),

            // ListTile(

            //   leading: const Icon(Icons.warning_amber),

            //   title: const Text(' Warning '),

            //  onTap: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) =>
            //       const WarningPage(),
            //     ),);
            //     // Navigator.pop(context);

            //   },
            // ),

            ListTile(

              leading: const Icon(Icons.logout,color: Colors.pink),

              title: const Text('LogOut',style:  TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),),

              onTap: () {

                 print("Signed Out");
                  AuthService().signOut();
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
                  });

              },

            ),

          ],

        ),

    );
  }
}