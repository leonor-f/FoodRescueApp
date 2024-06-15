import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:food_rescue/main.dart';
import 'package:food_rescue/tutorial/ControllerScreen.dart';
import 'package:food_rescue/home.dart';

void main() {
  testWidgets('MyApp builds correctly when showHome is false', (tester) async {
    SharedPreferences.setMockInitialValues({'showHome': false});

    await tester.pumpWidget(MyApp(showHome: false));

    expect(find.byType(MyMainApp), findsNothing);
    expect(find.byType(HomePage), findsOneWidget);
  });
}
