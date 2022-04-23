import 'package:flutter/cupertino.dart';

class Rhymes {
  String name;
  String icon;
  bool isFav;
  String vidID;

  Rhymes({
    required this.name,
    required this.icon,
    this.isFav = false,
    required this.vidID,
  });

  bool isAbove(Rhymes r) {
    if (isFav && !r.isFav) return true;
    return false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['icon'] = icon;
    data['isFav'] = isFav;
    data['vidID'] = vidID;

    return data;
  }

  static Rhymes fromJson(Map<String, dynamic> json) {
    return Rhymes(
      icon: json['icon'],
      name: json['name'],
      isFav: json['isFav'],
      vidID: json['vidID'],
    );
  }
}
