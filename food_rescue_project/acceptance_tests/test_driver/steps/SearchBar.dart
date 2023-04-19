/*import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric openTheApp() {
  return given<FlutterWorld>('I open the app', (context) async {
    final FlutterDriver? driver = context.world.driver;
    print('Opening the app...');
  });
}

StepDefinitionGeneric tapOnTheSearchBarButton(String buttonLabel) {
  return and<FlutterWorld>(
      'I tap on the "$buttonLabel" button of the search bar', (context) async {
    final FlutterDriver? driver = context.world.driver;
    final button = find.byValueKey('searchBarButton_$buttonLabel');
    await driver?.tap(button);
  });
}

StepDefinitionGeneric expectTheMapPageToBeDisplayed() {
  return then<FlutterWorld>(
      'I expect to see the initial map with a pin on my current location',
      (context) async {
    final FlutterDriver? driver = context.world.driver;
    await driver?.waitFor(find.byType('MyMapPage'));
  });
}

StepDefinitionGeneric expectTheProductsPageToBeDisplayed() {
  return then<FlutterWorld>('I expect to see the products page',
      (context) async {
    final FlutterDriver? driver = context.world.driver;
    await driver?.waitFor(find.byType('ProductsPage'));
  });
}

StepDefinitionGeneric expectTheFavorirosToBeDisplayed() {
  return then<FlutterWorld>('I expect to see the favorites page',
      (context) async {
    final FlutterDriver? driver = context.world.driver;
    await driver?.waitFor(find.byType('FavoritesPage'));
  });
}

StepDefinitionGeneric expectTheItemsToBeDisplayed() {
  return then<FlutterWorld>('I expect to see the items page', (context) async {
    final FlutterDriver? driver = context.world.driver;
    await driver?.waitFor(find.byType('BucketPage'));
  });
}

Future<void> main() {
  final stepDefinitions = [
    openTheApp(),
    tapOnTheSearchBarButton('Lojas'),
    expectTheMapPageToBeDisplayed(),
    tapOnTheSearchBarButton('Produtos'),
    expectTheProductsPageToBeDisplayed(),
    tapOnTheSearchBarButton('Favoritos'),
    expectTheFavorirosToBeDisplayed(),
    tapOnTheSearchBarButton('Items'),
    expectTheItemsToBeDisplayed(),
  ];
  final config = FlutterTestConfiguration()
    ..features = [
      ('package:food_rescue_project\acceptance_tests\test_driver\features\SearchBar.feature')
    ]
    ..stepDefinitions = stepDefinitions;
  return GherkinRunner().execute(config);
}*/
