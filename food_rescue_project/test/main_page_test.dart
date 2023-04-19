import 'package:flutter_test/flutter_test.dart';
import '../lib/main.dart';

void main() {
  group('MyApp', () {
    testWidgets('Renders MyStatefulWidget as home',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      expect(find.byType(MyStatefulWidget), findsOneWidget);
    });
  });
}
