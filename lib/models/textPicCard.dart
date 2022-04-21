class TextPicCard {
  String imgPath;
  int topText;
  String bottomText;

  TextPicCard({
    required this.topText,
    required this.bottomText,
    required this.imgPath,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['imgPath'] = imgPath;
    data['topText'] = topText;
    data['bottomText'] = bottomText;

    return data;
  }

  static TextPicCard fromJson(Map<String, dynamic> json) {
    return TextPicCard(
      topText: json['topText'],
      bottomText: json['bottomText'],
      imgPath: json['imgPath'],
    );
  }
}
