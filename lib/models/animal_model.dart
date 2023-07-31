class Animal {
  final String name;

  // final String image;
  final String sound;
  final int index;

  Animal({
    required this.name,
    // required this.image,
    required this.sound,
    required this.index,
  });

  @override
  String toString() {
    return 'Animal{name: $name, sound: $sound, index: $index}';
  }
}
