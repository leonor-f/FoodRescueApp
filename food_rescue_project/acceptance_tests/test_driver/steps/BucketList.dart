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
    await driver?.waitFor(find.byType('ItemsPage'));
  });
}

StepDefinitionGeneric tapOnTheTrashCanIcon() {
  return when<FlutterWorld>(
      'I tap on the trash can icon in front of the product that I do not want to buy',
      (context) async {
    final FlutterDriver? driver = context.world.driver;
    final trashCanIcon = find.byValueKey('trashbutton');
    await driver?.tap(trashCanIcon);
  });
}

StepDefinitionGeneric expectTheItemsPageToBeUpdated() {
  return then<FlutterWorld>(
      'I expect the items page to be updated without the product I removed',
      (context) async {
    final FlutterDriver? driver = context.world.driver;
    await driver?.waitFor(find.byType('ItemsPage'));
  });
}

Future<void> main() {
  final stepDefinitions = [
    openTheApp(),
    tapOnTheButton('Items'),
    tapOnTheTrashCanIcon(),
    expectTheItemsPageToBeUpdated(),
  ];
  final config = FlutterTestConfiguration()
    ..features = [
      ('package:food_rescue_project\acceptance_tests\test_driver\features\BucketList.feature')
    ]
    ..stepDefinitions = stepDefinitions;
  return GherkinRunner().execute(config);
}*/
