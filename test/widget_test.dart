import 'package:flutter_test/flutter_test.dart';
import 'package:netflix/main.dart';

void main() {
  testWidgets('Netflix app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const NetflixApp());
    expect(find.text('NETFLIX'), findsOneWidget);
  });
}
