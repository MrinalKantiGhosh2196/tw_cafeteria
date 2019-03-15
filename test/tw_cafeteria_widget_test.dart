import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tw_cafeteria/widget/tw_cafeteria.dart';
import 'package:tw_cafeteria/widget/menu_view.dart';
import 'package:tw_cafeteria/model/meal_type.dart';
import 'package:tw_cafeteria/model/meals.dart';
import 'package:matcher/matcher.dart' as matcher;

void main() {

  testWidgets("should contain necessary widgets with specific count", (WidgetTester tester) async {
    await tester.pumpWidget(new TwCafeteria());

    expect(find.byType(DefaultTabController), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(TabBar), findsOneWidget);
    expect(find.byType(Tab), findsNWidgets(3));
    expect(find.byType(TabBarView), findsOneWidget);
    expect(find.byType(MenuView), findsOneWidget);
  });

  testWidgets("Should contain all necessary widgets", (WidgetTester tester) async {
    await tester.pumpWidget(new TwCafeteria());

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
  
  testWidgets("should have correct App title & AppBar Title", (WidgetTester tester) async{
    await tester.pumpWidget(new TwCafeteria());

    MaterialApp materialApp = tester.firstWidget(find.byType(MaterialApp));
    expect(materialApp.title, "TW Cafeteria");

    AppBar appBar = tester.firstWidget(find.byType(AppBar));
    Text appBarTitleText = appBar.title;
    expect(appBar.centerTitle, true);
    expect(appBarTitleText.data, "TW Cafeteria");
  });

  testWidgets("should have breakfast, lunch and snacks tabbar", (WidgetTester tester) async{
    await tester.pumpWidget(new TwCafeteria());
    TabBar tabBar = tester.widget(find.byType(TabBar));
    List<Tab> tabs = tabBar.tabs;

    expect(tabs.length, 3);
    expect(tabs[0].text, "Breakfast");
    expect(tabs[1].text, "Lunch");
    expect(tabs[2].text, "Snacks");
  });

  testWidgets("should have Menu for breakfast, lunch and snacks in TabbarView", (WidgetTester tester) async{
    await tester.pumpWidget(new TwCafeteria());
    TabBarView tabBarView = tester.widget(find.byType(TabBarView));
    List<MenuView> menuViews = tabBarView.children;

    expect(menuViews.length, 3);
    expect(menuViews[0].menu, meals[MealType.breakfast]);
    expect(menuViews[1].menu, meals[MealType.lunch]);
    expect(menuViews[2].menu, meals[MealType.snacks]);
  });

  testWidgets("length of DefaultTabController should be 3", (WidgetTester tester) async {
    await tester.pumpWidget(new TwCafeteria());

    MaterialApp materialApp = tester.firstWidget(find.byType(MaterialApp));
    DefaultTabController defaultTabController = materialApp.home;
    expect(defaultTabController.length, 3);

    //TODO test for initialIndex
  });

}