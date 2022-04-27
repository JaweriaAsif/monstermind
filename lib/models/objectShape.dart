class ObjectShape {
  String imgPath;
  String shape;

  ObjectShape({
    required this.shape,
    required this.imgPath,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['imgPath'] = imgPath;
    data['shape'] = shape;

    return data;
  }

  static ObjectShape fromJson(Map<String, dynamic> json) {
    return ObjectShape(
      shape: json['shape'],
      imgPath: json['imgPath'],
    );
  }
}
