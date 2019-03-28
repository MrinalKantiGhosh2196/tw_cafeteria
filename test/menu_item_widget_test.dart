import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tw_cafeteria/widget/menu_item.dart';

void main() {
  testWidgets("should contain proper title in ListTile", (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(home: new MenuItem("Chicken Sandwich")));

    Card card = tester.widget(find.byType(Card));
    ListTile listTile = card.child;
    Text title = listTile.title;

    expect(title.data, "Chicken Sandwich");
  });

  testWidgets("should contain like and dislike icon buttons", (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(home: new MenuItem("Chicken Sandwich")));

    Card card = tester.widget(find.byType(Card));
    ListTile listTile = card.child;
    Row row = listTile.trailing;
    List<Widget> iconButtons = row.children;

    IconButton likeIconButton = iconButtons[0];
    IconButton dislikeIconButton = iconButtons[1];

    Icon likeIcon = likeIconButton.icon;
    Icon dislikeIcon = dislikeIconButton.icon;

    expect(row.mainAxisSize, MainAxisSize.min);
    expect(likeIcon.icon, Icons.thumb_up);
    expect(dislikeIcon.icon, Icons.thumb_down);
    expect(likeIconButton.padding, EdgeInsets.only(right: 10));
    expect(dislikeIconButton.padding, EdgeInsets.only(left: 10));

  });
}