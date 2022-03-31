class CardContent {
  List _list = [];
  String from = "";

  CardContent({required this.from});

  List get list {
    if (from == "alphabets") _list = alphabetList();

    return _list;
  }

  List alphabetList() {
    List l = [];
    for (var i = 0; i < 26; i++) {
      String s = String.fromCharCode(i + 65) + String.fromCharCode(i + 97);
      l.add(s);
    }
    return l;
  }
}
