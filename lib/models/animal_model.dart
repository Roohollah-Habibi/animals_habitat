class Animal {
  static const String cat = 'assets/images/bluecat.png';
  static const String elephant = 'assets/images/blueelephant.png';
  static const String fish = 'assets/images/bluefish.png';
  static const String dog = 'assets/images/browndog.png';
  static const String bird = 'assets/images/greenbird.png';
  static const String crocodile = 'assets/images/greencorocodile.png';
  static const String ladybug = 'assets/images/redladybug.png';
  static const String sealion = 'assets/images/sealion.png';
  static const List<String> animalsPathList = [
    Animal.cat,Animal.elephant,Animal.fish,Animal.dog,Animal.bird,Animal.crocodile,Animal.ladybug,Animal.sealion,
    // 'assets/images/bluecat.png',
    // 'assets/images/blueelephant.png',
    // 'assets/images/bluefish.png',
    // 'assets/images/browndog.png',
    // 'assets/images/greenbird.png',
    // 'assets/images/greencorocodile.png',
    // 'assets/images/redladybug.png',
    // 'assets/images/sealion.png',
  ];
  static List<String> animalsNameList = [
    'cat',
    'elephant',
    'fish',
    'dog',
    'bird',
    'crocodile',
    'ladybug',
    'sealion',
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
    'sealion': Animal.sealion,
    // 'cat': 'assets/images/bluecat.png',
    // 'elephant': 'assets/images/blueelephant.png',
    // 'fish': 'assets/images/bluefish.png',
    // 'dog': 'assets/images/browndog.png',
    // 'bird': 'assets/images/greenbird.png',
    // 'crocodile': 'assets/images/greencorocodile.png',
    // 'ladybug': 'assets/images/redladybug.png',
    // 'sealion': 'assets/images/sealion.png',
  };
}
