import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _photo;
  final text = "";
  final ImagePicker _picker = ImagePicker();
  final TextEditingController text1 = TextEditingController();
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Editior"),
      ),
      body: _photo==null?
       Center(
        child: TextButton(child: const Text("upload"),onPressed: ()=> _showPicker(context),)):Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child:
        
        
        Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Image.file(_photo!, height: double.maxFinite,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
                alignment: Alignment.bottomCenter,
                child:
                // text==""?
                
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    TextField(
                      decoration: InputDecoration(fillColor: Colors.grey, ),
                      controller: text1,
                      onEditingComplete: () => setState(() {
                        text==text1.text;
                      }),
                      onSubmitted: (value) {
                        print("true");
                        setState(() {
                        text==text1.text;

                      // text
                    });
                         deactivate();
                    },
                    ),
               Text(
                  text1.text,
                  style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold, fontSize: 22.0),)
                  ],
                )
                )
          ],
        ),)
        // ),
    ); 
  }


  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    }
  );
}

  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        // uploadFile();
      } else {
        print('No image selected.');
      }
    }
  );
}

   void _showPicker(context) {
    final iconstyle = Colors.grey.shade600;
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                   ListTile(
                      leading: Icon(Icons.photo, color: iconstyle,),
                      title: Text('Gallery'),
                      onTap: () {
                        imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading:  Icon(Icons.camera, color: iconstyle),
                    title:  Text('Camera'),
                    onTap: () {
                      imgFromCamera();
                      Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}