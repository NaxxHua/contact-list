import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier {
  // Have a busy state for monitoring loading
  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
