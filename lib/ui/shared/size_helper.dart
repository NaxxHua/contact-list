// * Helper for device size to use in other widgets

import 'package:flutter/material.dart';

double displayHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double displayWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double bottomInset(BuildContext context) {
  return MediaQuery.of(context).viewInsets.bottom;
}

double smallSpace(BuildContext context) {
  return MediaQuery.of(context).size.height * 0.01;
}

double mediumSpace(BuildContext context) {
  return MediaQuery.of(context).size.height * 0.03;
}

double largeSpace(BuildContext context) {
  return MediaQuery.of(context).size.height * 0.06;
}
