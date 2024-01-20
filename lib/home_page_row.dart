
import 'package:animals_habitat/utils.dart';
import 'package:flutter/material.dart';

class HomePageRow extends StatefulWidget {
  final String animalImagePath;
  final String animalName;

  const HomePageRow({
    super.key,
    required this.animalImagePath,
    required this.animalName,
  });

  @override
  State<HomePageRow> createState() => _HomePageRowState();
}

class _HomePageRowState extends State<HomePageRow> {
  bool isDroppedCorrectly = false;
  Widget? defaultDraggedItem;

  @override
  void initState() {
    super.initState();
    defaultDraggedItem = buildDraggedTargetWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Draggable(
                key: UniqueKey(),
                data: widget.animalImagePath,
                feedback: isDroppedCorrectly
                    ? buildSizedBoxImage(imgPath: checkSign)
                    : buildSizedBoxImage(imgPath: widget.animalImagePath),
                child: buildSizedBoxImage(
                    imgPath:
                        !isDroppedCorrectly ? widget.animalImagePath : checkSign),

              ),
            ),
            Expanded(
              flex: 3,
              child: DragTarget<String>(
                builder: (context, accepted, rejected) {
                  final bool foundAccepted =
                      accepted.contains(widget.animalImagePath);
                  return _dragWidgetOnCondition(foundAccepted);
                },
                // onLeave: onLeave,
                onWillAccept: _onWillAccept,
                onAccept: (data) {
                  setState(() {
                    isDroppedCorrectly = true;
                    defaultDraggedItem =
                        buildDraggedTargetWidget(imagePath: data);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDraggedTargetWidget({String? imagePath}) {
    return SizedBox(
      width: 240,
      height: 250,
      child: Center(
        child: imagePath == null
            ? Text(
                widget.animalName,
                style: customTextStyle,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    widget.animalName,
                    style: customTextStyleWithImage,
                  ),
                ],
              ),
      ),
    );
  }

  SizedBox buildSizedBoxImage({required String imgPath}) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Image.asset(imgPath, fit: BoxFit.cover),
    );
  }

  bool _onWillAccept(String? data) {
    if (data == widget.animalImagePath) {
      return true;
    }
    return false;
  }

  void onLeave(String? data) {
    setState(() {
      defaultDraggedItem = buildDraggedTargetWidget(imagePath: data);
    });
  }

  Widget _dragWidgetOnCondition(bool accepted) {
    if (accepted) {
      return buildDraggedTargetWidget(imagePath: widget.animalImagePath);
    }
    return defaultDraggedItem!;
  }
}
