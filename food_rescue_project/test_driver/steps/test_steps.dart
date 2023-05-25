import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric IsInPage() {
  return given1<String, FlutterWorld>('I am on the {string}',
      (key, context) async {
    final key_finder = find.byValueKey(key);
    await FlutterDriverUtils.isPresent(context.world.driver, key_finder);
  });
}

StepDefinitionGeneric TapButton() {
  return when1<String, FlutterWorld>('I tap on the {string}',
      (key, context) async {
    final key_finder = find.byValueKey(key);
    await FlutterDriverUtils.isPresent(context.world.driver, key_finder);
  });
}

StepDefinitionGeneric TapAddButton() {
  return and1<String, FlutterWorld>('I tap on the {string}',
      (key, context) async {
    final key_finder = find.byValueKey(key);
    await FlutterDriverUtils.tap(context.world.driver, key_finder);
  });
}

StepDefinitionGeneric GoPage() {
  return then1<String, FlutterWorld>('I tap on the {string}',
      (key, context) async {
    final key_finder = find.byValueKey(key);
    await FlutterDriverUtils.tap(context.world.driver, key_finder);
  });
}

StepDefinitionGeneric CheckScreenPresent() {
  return then1<String, FlutterWorld>('I expect the {string} to be printed',
      (key, context) async {
    final key_finder = find.byValueKey(key);
    await FlutterDriverUtils.isPresent(context.world.driver, key_finder);
  });
}

StepDefinitionGeneric OpenDialog() {
  return given1<String, FlutterWorld>('I expect to open a {string}',
      (key, context) async {
    final key_finder = find.byValueKey(key);
    await FlutterDriverUtils.isPresent(context.world.driver, key_finder);
  });
}

StepDefinitionGeneric CheckScreenNotPresent() {
  return then1<String, FlutterWorld>('I expect the {string} to disapear',
      (key, context) async {
    final key_finder = find.byValueKey(key);
    await FlutterDriverUtils.isPresent(context.world.driver, key_finder);
  });
}

StepDefinitionGeneric CheckCurrentLocation() {
  return and1<String, FlutterWorld>('I expect to see the {string}',
      (key, context) async {
    final key_finder = find.byValueKey(key);
    await FlutterDriverUtils.isPresent(context.world.driver, key_finder);
  });
}
