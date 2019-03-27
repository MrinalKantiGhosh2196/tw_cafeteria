import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:tw_cafeteria/widget/login.dart';
import 'package:tw_cafeteria/service/time_provider_service.dart';
import 'package:tw_cafeteria/widget/homepage.dart';
import 'package:tw_cafeteria/tw_cafeteria.dart';

void main(){

  testWidgets("Should have primaryColor as teal", (WidgetTester tester) async{
    await tester.pumpWidget(new TwCafeteria());

    MaterialApp materialApp = tester.firstWidget(find.byType(MaterialApp));
    ThemeData themeData = materialApp.theme;
    
    expect(themeData.primaryColor, Colors.teal);
  });

  testWidgets("should have initialRoute as / ", (WidgetTester tester) async{
    await tester.pumpWidget(new TwCafeteria());

    MaterialApp materialApp = tester.firstWidget(find.byType(MaterialApp));

    expect(materialApp.initialRoute, "/");
  });

  testWidgets("should map routes to correct pages", (WidgetTester tester) async{
    await tester.pumpWidget(new TwCafeteria());
    MaterialApp materialApp = tester.firstWidget(find.byType(MaterialApp));

    Map routes = materialApp.routes;
    Function actualClosureForLogin = routes["/login"];
    Function actualClosureForRootPath = routes["/"];
    Function expectedClosureForLogin = (BuildContext context) => new Login();
    Function expectedClosureForRootPath = (BuildContext context) => new Homepage(new TimeProvider());

    expect(actualClosureForLogin.runtimeType, expectedClosureForLogin.runtimeType);
    expect(actualClosureForRootPath.runtimeType, expectedClosureForRootPath.runtimeType);
  });

  testWidgets("should have TW Cafeteria as app title", (WidgetTester tester) async{
    await tester.pumpWidget(new TwCafeteria());
    MaterialApp materialApp = tester.widget(find.byType(MaterialApp));

    expect(materialApp.title, "TW Cafeteria");
  });
}