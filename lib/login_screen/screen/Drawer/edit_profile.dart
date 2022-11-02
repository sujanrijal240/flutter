// import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String selectedImagePath = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        "My Course"
      )),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       if (selectedImagePath.isNotEmpty) ...[
      //         CircleAvatar(
      //           backgroundImage: FileImage(
      //             File(selectedImagePath),
      //           ),
      //           radius: 70,
      //         )
      //       ],
      //       ElevatedButton(
      //         onPressed: () async {
      //           await pickImage(source: ImageSource.gallery);
      //         },
      //         child: const Text("edit your image"),
      //       ),
      //       const SizedBox(height: 30,),
      //       TextFormField(
      //         validator: (value) {
      //           if (value!.isEmpty) {
      //             return "change your name";
      //           }
      //           else if (value.length>15){
      //             return "enter your short name";
      //           }
      //         },
      //         decoration: InputDecoration(
      //           hintText: "Change your name",
      //           // enabledBorder: 
                
      //         )
      //         ,
      //       ),

      //        const SizedBox(height: 30,),
             
            
      //       TextFormField(
      //         validator: (value) {
      //           if (value!.isEmpty) {
      //             return "enter your detail";
      //           }
      //           else if (value.length>30){
      //             return "your detail have more character";
      //           }
      //         },
      //         decoration: InputDecoration(
      //           hintText: "Change your name",
      //           enabledBorder: OutlineInputBorder(
      //              borderSide: BorderSide(color: Color.fromARGB(255, 248, 74, 132),
      //              width: 4,)
      //           ) 
                
      //         )
      //         ,
      //       )
      //     ],
      //   ),
      // ),
    );
  }

//   pickImage({required ImageSource source}) async {
//     // ignore: invalid_use_of_visible_for_testing_member
//     var file = await ImagePicker.platform.pickImage(source: source);
//     if (file != null) {
//       setState(() {
//         selectedImagePath = file.path;
        
//       });
//     }
//   }
// }





























// import 'dart:html';
// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class EditProfile extends StatefulWidget {
//   const EditProfile({super.key});

//   @override
//   State<EditProfile> createState() => _EditProfileState();
// }

// class _EditProfileState extends State<EditProfile> {
//   File? image;
//   Uint8List imageBytes = Uint8List(0);

//   // String path {

//   // }
//   Future pickImage() async {
//     final image = ImagePicker().pickImage(source: ImageSource.gallery);
//     // ignore: unnecessary_null_comparison
//     if (kIsWeb){
//       imageBytes =  await image.readAsBytes();
//     }
//     if (image == null) {
//       return;
//     }

//     final imageTemporary = File(image.path);
//     setState(() {
//   this.image = imageTemporary;
// });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Edit Profile"),
//         // leading: IconButton(
//         //   icon: Icon(Icons.arrow_back, color: Colors.black,),
//         //   onPressed: () {},
//         // ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.settings,
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//       body: Container(
//         padding: EdgeInsets.only(
//           left: 15,
//           top: 20,
//           right: 15,
//         ),
//         child: GestureDetector(
//           onTap: () => pickImage(),
//           child: ListView(
            
//             children: [
//               Center(
//                 child: Stack(
//                   children: [
//                     image != null
//                         ? Image.file(
//                             image!,
//                             width: 130,
//                             height: 130,
//                             fit: BoxFit.cover,
//                           )
//                         : Container(
//                             width: 130,
//                             height: 130,
//                             decoration: BoxDecoration(
//                               border: Border.all(width: 4, color: Colors.white),
//                               boxShadow: [
//                                 BoxShadow(
//                                   blurRadius: 10,
//                                   spreadRadius: 2,
//                                   color: Colors.black.withOpacity(0.1),
//                                 ),
//                               ],
//                               shape: BoxShape.circle,
//                               image: DecorationImage(
//                                 fit: BoxFit.cover,
//                                 image: AssetImage("assets/images/sujan.jpg"),
//                               ),
//                             ),
//                           ),
//                     Positioned(
//                       bottom: 0,
//                       right: 0,
//                       child: Container(
//                         height: 40,
//                         width: 40,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(
//                             width: 4,
//                             color: Colors.white,
//                           ),
//                           color: Colors.blue,
//                         ),
//                         child: Icon(
//                           Icons.edit,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildTextField(
//       String labelText, String placeholder, bool isPasswordTextField) {
//     return Padding(
//       padding: EdgeInsets.only(
//         bottom: 30,
//       ),
//     );
//   }
}
