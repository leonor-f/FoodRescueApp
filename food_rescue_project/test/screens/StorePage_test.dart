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
}
