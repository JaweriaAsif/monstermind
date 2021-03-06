import 'package:flutter/material.dart';

class PicTextCard {
  String imgPath;
  String text;
  // Color color;
  String color;

  PicTextCard({
    required this.text,
    required this.imgPath,
    this.color = "0xff000000",
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['imgPath'] = imgPath;
    data['text'] = text;
    data['color'] = color;

    return data;
  }

  static PicTextCard fromJson(Map<String, dynamic> json) {
    return PicTextCard(
      text: json['text'],
      imgPath: json['imgPath'],
      color: json['color'],
    );
  }
}
