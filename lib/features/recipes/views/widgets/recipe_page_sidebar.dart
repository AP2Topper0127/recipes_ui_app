import 'package:flutter/material.dart';
import 'package:flutter_vikings/core/widgets/app_bar_leading.dart';
import 'package:flutter_vikings/features/recipes/models/recipe.dart';
import 'package:flutter_vikings/features/recipes/views/widgets/recipe_image.dart';
import 'package:flutter_vikings/features/recipes/views/widgets/recipe_page_image_bg.dart';

class RecipePageSidebar extends StatelessWidget {
  const RecipePageSidebar(
    this.recipe, {
    Key? key,
    this.imageRotationAngle = 0,
  }) : super(key: key);

  final Recipe recipe;
  final double imageRotationAngle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RecipePageImageBg(
          recipe,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: RecipeImage(
              recipe,
              imageRotationAngle: imageRotationAngle,
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: AppBarLeading(
            text: 'Back to Recipes',
            popValue: imageRotationAngle,
          ),
        ),
      ],
    );
  }
}
