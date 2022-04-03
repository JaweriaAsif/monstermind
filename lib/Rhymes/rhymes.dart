class Rhymes {
  String name;
  String icon;
  bool isFav;

  Rhymes({
    required this.name,
    required this.icon,
    this.isFav = false,
  });

  bool isAbove(Rhymes r) {
    if (isFav && !r.isFav) return true;
    return false;
  }
}
