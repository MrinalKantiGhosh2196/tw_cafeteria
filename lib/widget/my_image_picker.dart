import 'dart:io';
import 'dart:async';
import "package:image_picker/image_picker.dart";
import 'package:flutter/material.dart';

class MyImagePick extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: "My Image Picker",
        home: MyImagePicker ()
    );
  }

}

class MyImagePicker extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MyImagePickerSTate();
}

class MyImagePickerSTate extends State<MyImagePicker> {

  File image;
  Future getImage() async{
    File picture = await ImagePicker.pickImage(source: ImageSource.gallery, maxWidth: 100.0, maxHeight: 300.0);
    setState(() {
      image = picture;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Take a pic"),
      ),
      body: Center(
          child: image == null ? Text("Click the camera button to click pic")
              : Image.file(image)),
      drawer: Text("this is the drawer"),
      floatingActionButton: FloatingActionButton(onPressed: getImage, tooltip: "Pick Image",child: Icon(Icons.camera),),
    );
  }
}



