// * This is the provider setup file

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
