class ObjectComp {
  String imgPath;

  ObjectComp({
    required this.imgPath,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['imgPath'] = imgPath;

    return data;
  }

  static ObjectComp fromJson(Map<String, dynamic> json) {
    return ObjectComp(
      imgPath: json['imgPath'],
    );
  }
}
