import 'package:flutter/material.dart';
import 'package:tw_cafeteria/constants/style.dart';
import 'package:tw_cafeteria/constants/constant_texts.dart';
import 'package:tw_cafeteria/model/user.dart';
import 'package:tw_cafeteria/service/user_authenticator.dart';

class Login extends StatelessWidget {
  final TextEditingController usernameTextFieldController = new TextEditingController();
  final TextEditingController passwordTextFieldController = new TextEditingController();
  String text;

  Login({this.text = ""});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0,
      ),
      backgroundColor: Colors.blue,
      body:new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Padding(
            key: new Key("adminLoginHeadingPadding"),
            padding: Style.loginWidgetsPadding,
            child: new Text(
            ConstantText.adminLoginText,
            style: Style.heading1White,
            )
          ),
          new Padding(
            key: new Key("usernameTextFieldPadding"),
            padding: Style.loginWidgetsPadding,
            child: TextField(
              key: new Key("usernameTextField"),
              controller: usernameTextFieldController,
              decoration: InputDecoration(
                labelText: ConstantText.usernameLabelText,
                filled: true,
                labelStyle: Style.paragraphBlack,
                fillColor: Colors.white,
              ),
            ),
          ),
          new Padding(
            key: new Key("passwordTextFieldPadding"),
            padding: Style.loginWidgetsPadding,
            child: TextField(
              key: new Key("passwordTextField"),
              controller: passwordTextFieldController,
              decoration: InputDecoration(
                labelText: ConstantText.passwordLabelText,
                filled: true,
                labelStyle: Style.paragraphBlack,
                fillColor: Colors.white,
    ),
            ),
          ),
          new Padding(
            key: new Key("loginButtonPadding"),
            padding: Style.loginWidgetsPadding,
            child: new RaisedButton(
              child: new Text("Login"),
              color: Colors.black54,
              textColor: Colors.white,
              splashColor: Colors.blue,
              animationDuration: new Duration(microseconds: 1),
              onPressed: () => _authenticateUser(context),
            ),
          ),
          new Padding(key: new Key("Error Message"),
          padding: Style.loginWidgetsPadding,
          child: new Text(this.text,style: new TextStyle(color: Colors.red),),)
        ],
        )
    );
  }

  void _authenticateUser(BuildContext context){
    User user =  User(usernameTextFieldController.text.trim(), passwordTextFieldController.text.trim());
    if(UserAuthenticator.isAuthenticateUser(user)) {
      Navigator.pop(context);
    } else {
      Navigator.of(context).pushReplacementNamed('/loginAuthenticationError');
    }
  }


}