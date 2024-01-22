class Animal {
  static const String _cat = 'assets/images/bluecat.png';
  static const String _elephant = 'assets/images/blueelephant.png';
  static const String _fish = 'assets/images/bluefish.png';
  static const String _dog = 'assets/images/browndog.png';
  static const String _bird = 'assets/images/greenbird.png';
  static const String _crocodile = 'assets/images/greencorocodile.png';
  static const String _ladybug = 'assets/images/redladybug.png';
  static const String _seal = 'assets/images/sealion.png';
  static const List<String> animalsPathList = [
    Animal._cat,
    Animal._elephant,
    Animal._fish,
    Animal._dog,
    Animal._bird,
    Animal._crocodile,
    Animal._ladybug,
    Animal._seal,
  ];
  static List<String> animalsNameList = [
    'cat',
    'elephant',
    'fish',
    'dog',
    'bird',
    'crocodile',
    'ladybug',
    'seal',
  ];

  static List<String> get animalShuffleNameList {
    final List<String> shuffleList = animalsNameList;
    shuffleList.shuffle();
    return shuffleList;
  }

  static Map<String, String> animalsMap = {
    'cat': Animal._cat,
    'elephant': Animal._elephant,
    'fish': Animal._fish,
    'dog': Animal._dog,
    'bird': Animal._bird,
    'crocodile': Animal._crocodile,
    'ladybug': Animal._ladybug,
    'seal': Animal._seal,
  };
}