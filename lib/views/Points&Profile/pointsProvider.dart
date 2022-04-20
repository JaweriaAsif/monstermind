import 'package:flutter/cupertino.dart';

class PointsProvider extends ChangeNotifier {
  int _points = 0;

  int get points => _points;

  // set points(int value) => _points = value;

  void addPoints(int add) {
    _points += add;
    notifyListeners();
  }
}
