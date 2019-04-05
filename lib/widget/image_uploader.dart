import 'dart:io';
import 'dart:async';
import "package:image_picker/image_picker.dart";
import 'package:flutter/material.dart';

class ImageUploader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ImageUploaderState();
}

class ImageUploaderState extends State<ImageUploader> {
  File image;

  Future chooseImage(ImageSource source) async {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    File picture = await ImagePicker.pickImage(
        source: source, maxHeight: deviceHeight, maxWidth: deviceWidth);
    setState(() {
      image = picture;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return new Scaffold(
        appBar: new AppBar(
          elevation: 0,
        ),
        backgroundColor: Colors.teal,
        body: AlertDialog(
            content: new SingleChildScrollView(
                child: new ListBody(
                    children: <Widget>[
                      GestureDetector(
                        child: new Text('Take a picture'),
                        onTap: () => chooseImage(ImageSource.camera),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                      ),
                      GestureDetector(
                          child: new Text('Select from gallery'),
                          onTap: () => chooseImage(ImageSource.gallery)
                      )
                    ]
                )
            )
        )
        );
    } else {
      return uploadPic();
    }
  }

  Widget uploadPic(){
    return Scaffold(
        appBar: AppBar(
            title: Text("Upload a Pic"),
            actions: <Widget>[
              new Column(
                children: <Widget>[new IconButton(icon: Icon(
                    Icons.arrow_forward, color: Colors.white),
                    iconSize: 40, padding: EdgeInsets.only(right: 30),
                    onPressed:null)
                ],)
            ]
        ),
        body: Center(
            child: Image.file(image))
    );
  }
}
