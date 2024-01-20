import 'package:animals_habitat/home_page_row.dart';
import 'package:animals_habitat/models/animal_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: Animal.animalsMap.entries.map(
        (anim) {
          final String imageName = anim.key;
          final String imagePath = anim.value;
          return HomePageRow(
            animalImagePath: imagePath,
            animalName: imageName,
          );
        },
      ).toList(),
    );
  }
}
