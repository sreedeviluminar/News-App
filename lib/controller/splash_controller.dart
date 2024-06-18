import 'package:flutter/material.dart';

class SplashScreenProvider extends ChangeNotifier {

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    // after 5 sec delay isLoading will set to false
    _isLoading = value;
    notifyListeners();
  }
}
