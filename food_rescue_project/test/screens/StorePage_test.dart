import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_rescue/screens/StoresPage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mockito/mockito.dart';

class MockLocation extends Mock implements Location {}

void main() {
  late MockLocation mockLocation;

  setUp(() {
    mockLocation = MockLocation();
  });

  testWidgets('MyMapPage displays loading indicator when location is null',
      (tester) async {
    await tester.pumpWidget(MaterialApp(home: MyMapPage()));

    expect(find.text('Loading'), findsOneWidget);
  });

  testWidgets('MyMapPage recenter button returns to user location',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MyMapPage(),
      ),
    );
    await tester.pumpAndSettle();
    final recenterButton = find.byIcon(Icons.my_location);
    final map = find.byType(GoogleMap).evaluate().first.widget as GoogleMap;
    final initialTarget = map.cameraTargetBounds;
    expect(initialTarget, isNotNull);
    expect(map.markers, hasLength(1));
    await tester.tap(recenterButton);
    await tester.pumpAndSettle();
    final updatedMap =
        find.byType(GoogleMap).evaluate().first.widget as GoogleMap;
    expect(updatedMap.cameraTargetBounds, isNot(equals(initialTarget)));
  });

  testWidgets('MyMapPage displays GoogleMap with location pin', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MyMapPage(),
      ),
    );
    await tester.pumpAndSettle();
    final map = find.byType(GoogleMap).evaluate().first.widget as GoogleMap;
    expect(find.byType(GoogleMap), findsOneWidget);
    expect(map.markers, hasLength(1));
  });
}
