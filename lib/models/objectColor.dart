class ObjectColor {
  String imgPath;
  String color;

  ObjectColor({
    required this.color,
    required this.imgPath,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['imgPath'] = imgPath;
    data['color'] = color;

    return data;
  }

  static ObjectColor fromJson(Map<String, dynamic> json) {
    return ObjectColor(
      color: json['color'],
      imgPath: json['imgPath'],
    );
  }
}
