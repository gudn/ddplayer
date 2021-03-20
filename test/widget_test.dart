import 'package:flutter_test/flutter_test.dart';

import 'package:ddplayer/app.dart';

void main() {
  testWidgets('Base test', (WidgetTester tester) async {
    await tester.pumpWidget(DDPlayer());

    expect(find.text('1'), findsNothing);
    expect(find.text('Player'), findsOneWidget);
  });
}
