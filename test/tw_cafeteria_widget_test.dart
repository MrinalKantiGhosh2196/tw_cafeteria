import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tw_cafeteria/tw_cafeteria.dart';
import 'package:tw_cafeteria/menu.dart';

void main() {
  testWidgets("Should contain appBar & Menu", (WidgetTester tester) async {
    await tester.pumpWidget(new TwCafeteria());

    expect(find.text("TW Cafeteria"), findsOneWidget);
    expect(find.text("Breakfast"), findsOneWidget);
    expect(find.text("Lunch"), findsOneWidget);
    expect(find.text("Snacks"), findsOneWidget);

    expect(find.byType(DefaultTabController), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(TabBar), findsOneWidget);
    expect(find.byType(Tab), findsNWidgets(3));
    expect(find.byType(TabBarView), findsOneWidget);
    expect(find.byType(Menu), findsOneWidget);
  });
}