class Animal {
  static const String cat = 'assets/images/bluecat.png';
  static const String elephant = 'assets/images/blueelephant.png';
  static const String fish = 'assets/images/bluefish.png';
  static const String dog = 'assets/images/browndog.png';
  static const String bird = 'assets/images/greenbird.png';
  static const String crocodile = 'assets/images/greencorocodile.png';
  static const String ladybug = 'assets/images/redladybug.png';
  static const String sealion = 'assets/images/sealion.png';
  static const List<String> animalsImageList = [
    Animal.cat,
    Animal.elephant,
    Animal.fish,
    Animal.dog,
    Animal.bird,
    Animal.crocodile,
    Animal.ladybug,
    Animal.sealion,
  ];
  static const List<String> animalsNameList = [
    'cat','elephant','fish','dog','bird','crocodile','ladybug','sealion',
  ];
  static Map<String,String> animalsMap = {
    animalsNameList[0]: Animal.cat,
    animalsNameList[1]: Animal.elephant,
    animalsNameList[2]: Animal.fish,
    animalsNameList[3]: Animal.dog,
    animalsNameList[4]: Animal.bird,
    animalsNameList[5]: Animal.crocodile,
    animalsNameList[6]: Animal.ladybug,
    animalsNameList[7]: Animal.sealion,
  };
}
