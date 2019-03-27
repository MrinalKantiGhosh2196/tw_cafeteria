import 'package:flutter/material.dart';
import 'package:tw_cafeteria/constants/style.dart';
import 'package:tw_cafeteria/constants/constant_texts.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0,
      ),
      backgroundColor: Colors.teal,
      body:new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Padding(
            key: new Key("adminLoginHeading"),
            padding: Style.loginWidgetsPadding,
            child: new Text(
            ConstantText.adminLoginText,
            style: Style.heading1White,
            )
          ),
          new Padding(
            key: new Key("usernameTextField"),
            padding: Style.loginWidgetsPadding,
            child: TextField(
              decoration: InputDecoration(
                labelText: ConstantText.usernameLabelText,
                filled: true,
                labelStyle: Style.paragraphBlack18,
                fillColor: Colors.white,
              ),
            ),
          ),
          new Padding(
            key: new Key("passwordTextField"),
            padding: Style.loginWidgetsPadding,
            child: TextField(
              decoration: InputDecoration(
                labelText: ConstantText.passwordLabelText,
                filled: true,
                labelStyle: Style.paragraphBlack18,
                fillColor: Colors.white,
    ),
            ),
          ),
          new Padding(
            key: new Key("loginButton"),
            padding: Style.loginWidgetsPadding,
            child: new RaisedButton(
              child: new Text("Login"),
              color: Colors.black54,
              textColor: Colors.white,
              splashColor: Colors.blue,
              animationDuration: new Duration(microseconds: 1),
              onPressed: () => dummyMethod(),
            ),
          ),
        ],
        )
    );
  }

  void dummyMethod(){}
}