class Rhymes {
  String name;
  String icon;
  bool isFav;
  String vidID;

  Rhymes({
    required this.name,
    required this.icon,
    this.isFav = false,
    this.vidID = "", //req
  });

  bool isAbove(Rhymes r) {
    if (isFav && !r.isFav) return true;
    return false;
  }
}
