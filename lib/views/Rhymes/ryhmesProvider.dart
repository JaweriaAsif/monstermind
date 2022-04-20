import 'package:flutter/material.dart';
import 'package:monstermind/views/Rhymes/rhymes.dart';

class RhymesProvider extends ChangeNotifier {
  final List<Rhymes> _rhymes = [
    Rhymes(
      name: "Itsy Bitsy Spider",
      icon: "assets/images/spider.png",
      vidID: 'w_lCi8U49mY',
    ),
    Rhymes(
      name: "Slippery Fish",
      icon: "assets/images/fish.png",
      vidID: 'BIvpZ4PPrx0',
    ),
    Rhymes(
      name: "Eyes Cold Lemonade",
      icon: "assets/images/lemon.png",
      vidID: '165VjNKRNdw',
    ),
    Rhymes(
      name: "Five Little Monkeys",
      icon: "assets/images/monkey.png",
      vidID: 'b0NHrFNZWh0',
    ),
    Rhymes(
      name: "Wheels on the Bus",
      icon: "assets/images/bus.png",
      vidID: 'e_04ZrNroTo',
    ),
    Rhymes(
      name: "Twinkle Twinkle",
      icon: "assets/images/tiltedstar.png",
      vidID: 'yCjJyiqpAuU',
    ),
  ];

  List<Rhymes> get rhymes => _rhymes;

  addInOrder(Rhymes r) {
    rhymes.add(r);

    for (int i = rhymes.length - 1; i > 0; i--) {
      if (r.isAbove(rhymes[i - 1])) {
        //swap
        Rhymes temp = rhymes[i - 1];
        rhymes[i - 1] = r;
        rhymes[i] = temp;
      }
    }
  }

  bool isFav(Rhymes r) => r.isFav;

  void changeFav(Rhymes r) {
    r.isFav = !r.isFav;
    rhymes.remove(r);
    addInOrder(r);
    notifyListeners();
  }
}
