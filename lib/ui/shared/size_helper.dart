import 'package:flutter/material.dart';

// * Helper for device height to use in other widgets
double displayHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

// * Helper for device width to use in other widgets
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
