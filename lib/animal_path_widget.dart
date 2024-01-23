import 'package:flutter/material.dart';

const checkSignImage = 'assets/images/check.png';

class AnimalPathWidget extends StatefulWidget {
  final String imagePath;

  const AnimalPathWidget({super.key, required this.imagePath});

  @override
  State<AnimalPathWidget> createState() => _AnimalPathWidgetState();
}

class _AnimalPathWidgetState extends State<AnimalPathWidget> {
  bool isDraggedSuccessful = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Draggable(
        data: widget.imagePath,
        feedback: feedback,
        onDragCompleted: _onDragCompleted,
        child: isDraggedSuccessful
            ? _customImage(imagePath: checkSignImage)
            : _customImage(imagePath: widget.imagePath),
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
      isDraggedSuccessful = true;
    });
  }
}
