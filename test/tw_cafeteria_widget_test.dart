import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tw_cafeteria/tw_cafeteria.dart';

void main() {
  testWidgets("Should contain appbar title named TW Cafeteria", (WidgetTester tester) async {
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
  });
}