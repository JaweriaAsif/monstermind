class User {
  User({
    this.name = "",
    this.gender = "",
    this.DOB,
    this.points = 0,
    this.email = "",
    this.isLoggedIn = true,
  });

  String name;
  String gender;
  DateTime? DOB;
  int points;
  String email;
  bool isLoggedIn;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['gender'] = gender;
    data['DOB'] = DOB;
    data['points'] = points;
    data['email'] = email;
    data['isLoggedIn'] = isLoggedIn;
    return data;
  }

  static User fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      gender: json['gender'],
      DOB: json['DOB'].toDate(),
      points: json['points'],
      email: json['email'],
      isLoggedIn: json['isLoggedIn'],
    );
  }
}
