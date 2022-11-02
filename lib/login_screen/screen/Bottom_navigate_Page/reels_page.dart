// import 'dart:ffi';
import 'dart:io';

// import 'package:bpls/login_screen/resuable_widget/reusable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class ReelsPage extends StatefulWidget {
  const ReelsPage({Key? key}) : super(key: key);

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) {
        return;
      }

      // final imageTemporary = File(image.path);
      final imagePermanent = await saveImagePermanently(image.path);
      setState(() {
        this.image = imagePermanent;
      });
    } on Exception catch (e) {
      // TODO
      print('failed to pick image: $e');
    }
  }



  Future<File> saveImagePermanently (String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            image != null
                ? Image.file(
                    image!,
                    width: 160,
                    height: 160,
                    fit: BoxFit.cover,
                  )
                : FlutterLogo(
                    size: 160,
                  ),
            SizedBox(
              height: 40,
            ),
            Text("sujan"),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(56),
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  textStyle: TextStyle(fontSize: 20)),
              onPressed: () => pickImage(ImageSource.gallery),
              child: Row(
                children: [
                  Icon(
                    Icons.image_outlined,
                    size: 28,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text("Pick Gallery")
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(56),
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  textStyle: TextStyle(fontSize: 20)),
              onPressed: () => pickImage(ImageSource.camera),
              child: Row(
                children: [
                  Icon(
                    Icons.camera_alt,
                    size: 28,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text("Pick Camera")
                ],
              ),
            ),
          ],
        ),
      ),
    );

    // Widget buildButton ({
    //   required String  title,
    //   required IconData  icon,
    //   required VoidCallback  onClicked,
    // }) => ElevatedButton(
    //   style:  ElevatedButton.styleFrom(
    //     minimumSize: Size.fromHeight(56),
    //     primary: Colors.white,
    //     onPrimary: Colors.black,
    //     textStyle: TextStyle(fontSize: 20)
    //   ),
    //   onPressed: onClicked,
    //   child: Row(
    //     children: [
    //       Icon(icon, size: 28,),
    //       const SizedBox(width: 16,),
    //       Text(title)
    //     ],
    //   ),
    // );
  }
}
