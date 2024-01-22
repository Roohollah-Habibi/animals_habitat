class Animal {
  static const String cat = 'assets/images/bluecat.png';
  static const String elephant = 'assets/images/blueelephant.png';
  static const String fish = 'assets/images/bluefish.png';
  static const String dog = 'assets/images/browndog.png';
  static const String bird = 'assets/images/greenbird.png';
  static const String crocodile = 'assets/images/greencorocodile.png';
  static const String ladybug = 'assets/images/redladybug.png';
  static const String seal = 'assets/images/sealion.png';
  static const List<String> animalsPathList = [
    Animal.cat,
    Animal.elephant,
    Animal.fish,
    Animal.dog,
    Animal.bird,
    Animal.crocodile,
    Animal.ladybug,
    Animal.seal,
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
    'cat': Animal.cat,
    'elephant': Animal.elephant,
    'fish': Animal.fish,
    'dog': Animal.dog,
    'bird': Animal.bird,
    'crocodile': Animal.crocodile,
    'ladybug': Animal.ladybug,
    'seal': Animal.seal,
  };
}