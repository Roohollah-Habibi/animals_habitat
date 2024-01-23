import 'package:animals_habitat/utils.dart';
import 'package:flutter/material.dart';
import 'models/animal_model.dart';

class AnimalNameWidget extends StatefulWidget {
  final String imageText;

  const AnimalNameWidget({super.key, required this.imageText});

  @override
  State<AnimalNameWidget> createState() => _AnimalNameWidgetState();
}

class _AnimalNameWidgetState extends State<AnimalNameWidget> {
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
    return SizedBox(
      width: 100,
      height: 100,
      child: DragTarget<String>(
        builder: (context, candidateData, rejectedData) {
          if(candidateData.isNotEmpty){
            //todo we can show some hints to asure the user its the right place
            return textAndImageWidget(imagePath: candidateData[0]!);
          }
          return defaultWidget;
        },
        onWillAccept: _onWillAccept,
        onAccept: _onAccept,
      ),
    );
  }

  bool _onWillAccept(String? data) => data == foundPathByWidgetName;

  void _onAccept(String data) {
    setState(() {
      defaultWidget = textAndImageWidget(imagePath: data);
    });
  }

  Widget textAndImageWidget({required String imagePath}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Text(
            getSelectedAnimalName,
            textAlign: TextAlign.center,
            style: customTextStyleWithImage,
          ),
        ),
      ],
    );
  }

  Widget get defaultTextWidget {
    return Center(
      child: Text(
        widget.imageText,
        style: customTextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
