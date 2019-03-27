import 'package:flutter_test/flutter_test.dart';
import 'package:tw_cafeteria/widget/login.dart';
import 'package:flutter/material.dart';
import 'package:tw_cafeteria/constants/style.dart';

void main() {
  testWidgets("should have background color set as teal", (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(home: new Login()));
    Scaffold scaffold = tester.widget(find.byType(Scaffold));

    expect(scaffold.backgroundColor, Colors.teal);
  });

  testWidgets("Should have elevation 0 for appbar", (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(home: new Login()));
    AppBar appBar = tester.widget(find.byType(AppBar));

    expect(appBar.elevation, 0);
  });

  testWidgets("should have Main Axis Alignment of column as center", (WidgetTester tester) async{
    await tester.pumpWidget(new MaterialApp(home: new Login()));
    Column column = tester.widget(find.byType(Column));

    expect(column.mainAxisAlignment, MainAxisAlignment.center);
  });
  
  testWidgets("Should have Padding LTRB(20, 10 , 20, 10) for all widgets of column", (WidgetTester tester) async{
    await tester.pumpWidget(new MaterialApp(home: new Login()));
    Column column = tester.widget(find.byType(Column));

    List<Widget> loginPaddingWidgets = column.children;

    for(Padding padding in loginPaddingWidgets)
      expect(padding.padding, Style.loginWidgetsPadding);
  });
  
  testWidgets("should have widgets in order", (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(home: new Login()));
    Column column = tester.widget(find.byType(Column));

    List<Widget> columnChildrenWidgets = column.children;

    List<Padding> loginPaddingWidgets = columnChildrenWidgets.map((Widget widget){
      Padding padding = widget;
      return padding;
    }).toList();

    expect(loginPaddingWidgets[0].key, new Key("adminLoginHeading"));
    expect(loginPaddingWidgets[1].key, new Key("usernameTextField"));
    expect(loginPaddingWidgets[2].key, new Key("passwordTextField"));
    expect(loginPaddingWidgets[3].key, new Key("loginButton"));
  });

  testWidgets("Should have title Admin Login & style as heading1White", (WidgetTester tester) async{
    await tester.pumpWidget(new MaterialApp(home: new Login()));
    Padding adminLoginHeading = tester.widget(find.byKey(new Key("adminLoginHeading")));
    Text adminLoginHeadingText = adminLoginHeading.child;

    expect(adminLoginHeadingText.data, "Admin Login");
    expect(adminLoginHeadingText.style, Style.heading1White);
  });

  testWidgets("Should have username textfield with appropriate properties", (WidgetTester tester) async{
    await tester.pumpWidget(new MaterialApp(home: new Login()));
    Padding usernameField = tester.widget(find.byKey(new Key("usernameTextField")));
    TextField usernameTextField = usernameField.child;
    InputDecoration inputDecorationForUsernameField = usernameTextField.decoration;

    expect(inputDecorationForUsernameField.labelText, "Username");
    expect(inputDecorationForUsernameField.filled, true);
    expect(inputDecorationForUsernameField.labelStyle, Style.paragraphBlack18);
    expect(inputDecorationForUsernameField.fillColor, Colors.white);
  });

  testWidgets("Should have password textfield with appropriate properties", (WidgetTester tester) async{
    await tester.pumpWidget(new MaterialApp(home: new Login()));
    Padding passwordField = tester.widget(find.byKey(new Key("passwordTextField")));
    TextField passwordTextField = passwordField.child;
    InputDecoration inputDecorationForUsernameField = passwordTextField.decoration;

    expect(inputDecorationForUsernameField.labelText, "Password");
    expect(inputDecorationForUsernameField.filled, true);
    expect(inputDecorationForUsernameField.labelStyle, Style.paragraphBlack18);
    expect(inputDecorationForUsernameField.fillColor, Colors.white);
  });

  testWidgets("Should have password textfield with appropriate properties", (WidgetTester tester) async{
    await tester.pumpWidget(new MaterialApp(home: new Login()));
    
    Padding loginButton = tester.widget(find.byKey(new Key("loginButton")));
    RaisedButton loginRaisedButton = loginButton.child;
    Text loginButtonText = loginRaisedButton.child;
    
    expect(loginButtonText.data, "Login");
    expect(loginRaisedButton.color, Colors.black54);
    expect(loginRaisedButton.textColor, Colors.white);
    expect(loginRaisedButton.splashColor, Colors.blue);
    expect(loginRaisedButton.animationDuration, new Duration(microseconds: 1));
  });
}