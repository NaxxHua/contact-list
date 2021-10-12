// ** This is the provider setup file which has multiple providers

// * independentServices: These are classes/objects that do not depend on any other services to execute their logic

// * dependentServices: These are classes/object that depend on previously registered services

// * uiConsumableProviders: These are values that you want to consume directly in the UI.
// * You can add values here if you would have to introduce a property on most,
// * if not all your models just to get the data out.

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:contact_list/core/services/api.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableServices,
];

List<SingleChildWidget> independentServices = [
  Provider<Api>(
    create: (_) => Api(),
  ),
];

List<SingleChildWidget> dependentServices = [];

List<SingleChildWidget> uiConsumableServices = [];
