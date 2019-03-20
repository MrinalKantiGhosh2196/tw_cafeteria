import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tw_cafeteria/widget/tw_cafeteria.dart';
import 'package:tw_cafeteria/widget/menu_view.dart';
import 'package:tw_cafeteria/model/meal_type.dart';
import 'package:tw_cafeteria/model/meals.dart';
import 'package:matcher/matcher.dart' as matcher;
import 'package:tw_cafeteria/service/time_provider_service.dart';
import 'package:mockito/mockito.dart';
import 'package:tw_cafeteria/widget/login.dart';

class MockTimeProvider extends Mock implements TimeProvider {}

void main() {

  testWidgets("should contain necessary widgets with specific count", (WidgetTester tester) async {
    await tester.pumpWidget(new TwCafeteria(new TimeProvider()));

    expect(find.byType(DefaultTabController), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(TabBar), findsOneWidget);
    expect(find.byType(Tab), findsNWidgets(3));
    expect(find.byType(TabBarView), findsOneWidget);
    expect(find.byType(MenuView), findsOneWidget);
  });

  testWidgets("Should contain all necessary widgets", (WidgetTester tester) async {
    await tester.pumpWidget(new TwCafeteria(new TimeProvider()));

    MaterialApp materialApp = tester.firstWidget(find.byType(MaterialApp));
    DefaultTabController defaultTabController = materialApp.home;
    Scaffold scaffold = defaultTabController.child;
    AppBar appBar = scaffold.appBar;

    expect(materialApp.home, matcher.TypeMatcher<DefaultTabController>());
    expect(defaultTabController.child, matcher.TypeMatcher<Scaffold>());
    expect(scaffold.appBar, matcher.TypeMatcher<AppBar>());
    expect(scaffold.body, matcher.TypeMatcher<TabBarView>());
    expect(appBar.bottom, matcher.TypeMatcher<TabBar>());
  });

  testWidgets("should have correct App title & AppBar", (WidgetTester tester) async{
    await tester.pumpWidget(new TwCafeteria(new TimeProvider()));

    MaterialApp materialApp = tester.firstWidget(find.byType(MaterialApp));
    expect(materialApp.title, "TW Cafeteria");

    AppBar appBar = tester.firstWidget(find.byType(AppBar));
    Row appBarRow = appBar.title;
    Text appBarTitleText = appBarRow.children[0];
    MaterialButton materialButton = appBarRow.children[1];
    Text buttonText = materialButton.child;

    expect(appBarTitleText.data, "TW Cafeteria");
    expect(appBarRow.mainAxisAlignment, MainAxisAlignment.spaceBetween);
    expect(buttonText.data, "Admin Login");
  });

  testWidgets("should have breakfast, lunch and snacks tabbar", (WidgetTester tester) async{
    await tester.pumpWidget(new TwCafeteria(new TimeProvider()));
    TabBar tabBar = tester.widget(find.byType(TabBar));
    List<Tab> tabs = tabBar.tabs;

    expect(tabs.length, 3);
    expect(tabs[0].text, "Breakfast");
    expect(tabs[1].text, "Lunch");
    expect(tabs[2].text, "Snacks");
  });

  testWidgets("should have Menu for breakfast, lunch and snacks in TabbarView", (WidgetTester tester) async{
    await tester.pumpWidget(new TwCafeteria(new TimeProvider()));
    TabBarView tabBarView = tester.widget(find.byType(TabBarView));
    List<MenuView> menuViews = tabBarView.children;

    expect(menuViews.length, 3);
    expect(menuViews[0].menu, meals[MealType.breakfast]);
    expect(menuViews[1].menu, meals[MealType.lunch]);
    expect(menuViews[2].menu, meals[MealType.snacks]);
  });

  testWidgets("should have initialIndex as 0 at 10:00", (WidgetTester tester) async {
    var mockTimeProvider = new MockTimeProvider();
    when(mockTimeProvider.getCurrentTime()).thenReturn(new DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,10));
    await tester.pumpWidget(new TwCafeteria(mockTimeProvider));
    MaterialApp materialApp = tester.firstWidget(find.byType(MaterialApp));
    DefaultTabController defaultTabController = materialApp.home;
    expect(defaultTabController.length, 3);
    expect(defaultTabController.initialIndex, 0);
  });

  testWidgets("should have initialIndex as 1 at 14:00", (WidgetTester tester) async {
    var mockTimeProvider = new MockTimeProvider();
    when(mockTimeProvider.getCurrentTime()).thenReturn(new DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,14));
    await tester.pumpWidget(new TwCafeteria(mockTimeProvider));
    MaterialApp materialApp = tester.firstWidget(find.byType(MaterialApp));
    DefaultTabController defaultTabController = materialApp.home;
    expect(defaultTabController.initialIndex, 1);
  });

  testWidgets("should have initialIndex as 2 at 19:00", (WidgetTester tester) async {
    var mockTimeProvider = new MockTimeProvider();
    when(mockTimeProvider.getCurrentTime()).thenReturn(new DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,19));
    await tester.pumpWidget(new TwCafeteria(mockTimeProvider));
    MaterialApp materialApp = tester.firstWidget(find.byType(MaterialApp));
    DefaultTabController defaultTabController = materialApp.home;
    expect(defaultTabController.initialIndex, 2);
  });

//  testWidgets("should have initialRoute as / ", (WidgetTester tester) async{
//    await tester.pumpWidget(new TwCafeteria(new TimeProvider()));
//
//    MaterialApp materialApp = tester.widget(find.byType(MaterialApp));
//
//    expect(materialApp.initialRoute, "/");
//  });

//  testWidgets("should map routes to correct pages", (WidgetTester tester) async{
//    await tester.pumpWidget(new TwCafeteria(new TimeProvider()));
//    MaterialApp materialApp = tester.widget(find.byType(MaterialApp));
//
//    Map routes = materialApp.routes;
//    Function actualClosure = routes["/login"];
//    Function expectedClosure = (BuildContext context) => new Login();
//
//    expect(actualClosure.runtimeType, expectedClosure.runtimeType);
//  });
  
//  testWidgets("Should navigate to Login page when admin login is pressed", (WidgetTester tester) async{
//    await tester.pumpWidget(new TwCafeteria(new TimeProvider()));
//
//    await tester.tap(find.byType(MaterialButton));
//
//    //expect(find.byType(Login), findsOneWidget);
//  });



}