import 'package:flutter_test/flutter_test.dart';
import 'package:tw_cafeteria/tw_cafeteria.dart';

void main() {
  testWidgets("Should contain appbar title named TW Cafeteria", (WidgetTester tester) async {
    await tester.pumpWidget(new TwCafeteria());

    expect(find.text("TW Cafeteria"), findsOneWidget);
  });
}
