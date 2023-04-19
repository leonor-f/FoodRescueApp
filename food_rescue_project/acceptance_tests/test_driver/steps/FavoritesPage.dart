/*import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric openTheApp() {
  return given<FlutterWorld>('I open the app', (context) async {
    final FlutterDriver? driver = context.world.driver;
    print('Opening the app...');
  });
}

StepDefinitionGeneric tapOnTheButton(String buttonLabel) {
  return and<FlutterWorld>(
      'I tap on the "$buttonLabel" button of the search bar', (context) async {
    final FlutterDriver? driver = context.world.driver;
    final button = find.byValueKey('searchBarButton_$buttonLabel');
    await driver?.tap(button);
    await driver?.waitFor(find.byType('FavoritesPage'));
  });
}

StepDefinitionGeneric tapOnTheRemoveButton() {
  return when<FlutterWorld>('I tap on the "Remover dos Favoritos" button',
      (context) async {
    final FlutterDriver? driver = context.world.driver;
    final button = find.byValueKey('removeFavoriteStore');
    await driver?.tap(button);
  });
}

StepDefinitionGeneric expectTheFavoritesPageToBeUpdated() {
  return then<FlutterWorld>(
      'I expect the favorites page to be updated without the supermarket I removed',
      (context) async {
    final FlutterDriver? driver = context.world.driver;
    await driver?.waitFor(find.byType('FavoritesPage'));
  });
}

Future<void> main() {
  final stepDefinitions = [
    openTheApp(),
    tapOnTheButton('Favoritos'),
    tapOnTheRemoveButton(),
    expectTheFavoritesPageToBeUpdated(),
  ];
  final config = FlutterTestConfiguration()
    ..features = [
      ('package:food_rescue_project\acceptance_tests\test_driver\features\FavoritesPage.feature')
    ]
    ..stepDefinitions = stepDefinitions;
  return GherkinRunner().execute(config);
}
*/