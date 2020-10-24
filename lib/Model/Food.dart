class Food {
  Food({this.name, this.type});
  String name, type;

  @override
  String toString() => '${this.name} is a ${this.type}';
}
