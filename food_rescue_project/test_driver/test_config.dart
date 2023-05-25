import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'steps/test_steps.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [
      Glob(r"test_driver/features/FavoritesPage.feature"),
      Glob(r"test_driver/features/Map.feature"),
      Glob(r"test_driver/features/SearchBar.feature"),
      Glob(r"test_driver/features/ShoppingList.feature"),
    ]
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
    ]
    ..stepDefinitions = [
      IsInPage(),
      TapButton(),
      TapAddButton(),
      GoPage(),
      CheckScreenPresent(),
      OpenDialog(),
      CheckScreenNotPresent(),
      CheckCurrentLocation()
    ]
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/app.dart";
  return GherkinRunner().execute(config);
}
