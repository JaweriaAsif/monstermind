class User {
  User({
    this.name = "",
    this.gender = "",
    this.DOB,
    this.points = 0,
  });

  String name;
  String gender;
  DateTime? DOB;
  int points;

  // String get name => _name;
  // String get gender => _gender;
  // DateTime get DOB => _DOB;
  // int get points => _points;

  // set name(String n) => _name = n;
  // set gender(String g) => _gender = g;
  // set DOB(DateTime dob) => _DOB = dob;
  // set points(int p) => _points = p;
}
