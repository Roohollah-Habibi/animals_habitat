import 'package:animals_habitat/utils.dart';
import 'package:flutter/material.dart';
import 'models/animal_model.dart';
import 'package:audioplayers/audioplayers.dart';

class AnimalNameWidget extends StatefulWidget {
  final String imageText;

  const AnimalNameWidget({super.key, required this.imageText});

  @override
  State<AnimalNameWidget> createState() => _AnimalNameWidgetState();
}

class _AnimalNameWidgetState extends State<AnimalNameWidget> {
  final player = AudioPlayer();
  bool isSelected = false;
  late final String foundPathByWidgetName;
  late Widget defaultWidget;
  late final String getSelectedAnimalName;

  @override
  void initState() {
    defaultWidget = defaultTextWidget;
    foundPathByWidgetName = Animal.animalsMap[widget.imageText] as String;
    getSelectedAnimalName = Animal.animalsMap.keys.firstWhere(
        (element) => Animal.animalsMap[element] == foundPathByWidgetName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      builder: (context, candidateData, rejectedData) {
        if (candidateData.isNotEmpty) {
          return textAndImageWidget(imagePath: candidateData[0]!);
        }
        if (rejectedData.isNotEmpty){
          return onRejectedData;
        }
        return defaultWidget;
      },
      onWillAccept: _onWillAccept,
      onAccept: _onAccept,
    );
  }

  Widget get onRejectedData {

    return const Center(child: Text('Wrong',style: customTextStyleWrongInput,));
  }

  bool _onWillAccept(String? data) => data == foundPathByWidgetName;


  void _onAccept(String data) {
    correctSound();
    setState(() {
      defaultWidget = textAndImageWidget(imagePath: data);
    });
  }

  Widget textAndImageWidget({required String imagePath}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
        Text(
          getSelectedAnimalName,
          textAlign: TextAlign.center,
          style: customTextStyleWithImage,
        ),
      ],
    );
  }

  Widget get defaultTextWidget {
    return Center(
      child: Text(
        widget.imageText,
        style: customTextStyle,
      ),
    );
  }

  Future<void> rejectSound() async {
    player.play(AssetSource('audios/wrong.wav'));
  }

  Future<void> correctSound() async {
    player.play(AssetSource('audios/correct.wav'));
  }
}
