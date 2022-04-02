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
    if (!isFav && r.isFav) return true;
    return false;
  }
}

List<Rhymes> rhymes = [
  Rhymes(name: "Itsy Bitsy Spider", icon: "assets/images/spider.png"),
  Rhymes(name: "Slippery Fish", icon: "assets/images/fish.png"),
  Rhymes(name: "Eyes Cold Lemonade", icon: "assets/images/lemon.png"),
  Rhymes(name: "Five Little Monkeys", icon: "assets/images/monkey.png"),
  Rhymes(name: "Wheels on the Bus", icon: "assets/images/bus.png"),
  Rhymes(name: "Twinkle Twinkle", icon: "assets/images/tiltedstar.png"),
];

addInOrder(Rhymes r) {
  rhymes.add(r);

  for (int i = rhymes.length - 1; i > 0; i--) {
    if (r.isAbove(rhymes[i - 1])) {
      //swap
      Rhymes temp = rhymes[i - 1];
      rhymes[i - 1] = r;
      rhymes[i] = temp;
    }
  }
}
