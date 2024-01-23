
import 'package:animals_habitat/animal_path_widget.dart';
import 'package:animals_habitat/models/animal_model.dart';
import 'package:animals_habitat/animal_name_widget.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Column(
      children: Animal.animalShuffleNameList.map((animName) {
        final String path = Animal.animalsPathList.elementAt(index);
        index++;
        playSound();
        return Expanded(
          child: AnimalRow(
            imageText: animName,
            imagePath: path,
          ),
        );
      }).toList(),
    );
  }

  Future<void> playSound() async{
    //todo uncomment the paly sound
    // await player.play(AssetSource('audios/kids2.wav'));
    // player.setReleaseMode(ReleaseMode.loop);
  }
}

class AnimalRow extends StatelessWidget {
  final String imageText;
  final String imagePath;

  const AnimalRow(
      {super.key, required this.imageText, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: AnimalPathWidget(
              imagePath: imagePath,
            ),
          ),
          Expanded(
            flex: 3,
            child: AnimalNameWidget(
              imageText: imageText,
            ),
          ),
        ],
      ),
    );
  }
}
