import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

const checkSignImage = 'assets/images/check.png';

class AnimalPathWidget extends StatefulWidget {
  final String imagePath;

  const AnimalPathWidget({super.key, required this.imagePath});

  @override
  State<AnimalPathWidget> createState() => _AnimalPathWidgetState();
}

class _AnimalPathWidgetState extends State<AnimalPathWidget> {
  final player = AudioPlayer();
  static int completedActionIndex = 0;
  bool isDraggedSuccessful = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: isDraggedSuccessful
          ? _customImage(imagePath: checkSignImage)
          : Draggable(
              data: widget.imagePath,
              feedback: feedback,
              onDragCompleted: _onDragCompleted,
              child: _customImage(imagePath: widget.imagePath),
            ),
    );
  }

  Widget get feedback {
    return SizedBox(
        width: 100,
        height: 100,
        child: isDraggedSuccessful
            ? _customImage(imagePath: checkSignImage)
            : _customImage(imagePath: widget.imagePath));
  }

  Image _customImage({required String imagePath}) {
    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
    );
  }

  void _onDragCompleted() {
    setState(() {
      completedActionIndex++;
      print(completedActionIndex);
      isDraggedSuccessful = true;
      if (completedActionIndex == 8) {
        onLevelCompleted();
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            icon: Icon(Icons.mood),
            title: Text('Level Completed'),
            backgroundColor: Colors.blue,
            elevation: 10.0,
            actions: [
              //todo do the code for onPress
              IconButton(onPressed: (){}, icon: Icon(Icons.next_plan_outlined,size: 35,color: Colors.green,))
            ],
            content: Text('Well Done you have completed the level'),
          ),
        );
      }
    });
  }

  Future<void> onLevelCompleted() async {
    await player.play(AssetSource('audios/cheering.wav'));
  }
}
