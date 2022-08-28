import 'package:flutter/material.dart';
import 'package:flutter_vikings/core/widgets/app_bar_leading.dart';
import 'package:flutter_vikings/core/widgets/delayed_fade_in_effect.dart';
import 'package:flutter_vikings/core/widgets/mouse_region_effect.dart';
import 'package:flutter_vikings/features/recipes/models/recipe.dart';
import 'package:flutter_vikings/features/recipes/views/widgets/recipe_image.dart';
import 'package:flutter_vikings/features/recipes/views/widgets/recipe_image_pattern_mouse.dart';
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
    Size screenSize = MediaQuery.of(context).size;

    return MouseRegionEffect(
      width: screenSize.width / 2,
      height: screenSize.height,
      builder: (context, offset) => Stack(
        children: [
          RecipePageImageBg(
            recipe,
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          if (recipe.bgImageName.isNotEmpty)
            DelayedFadeInEffect(
              child: RecipeImagePatternMouse(
                recipe,
                offset: offset,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
            ),
          IgnorePointer(
            ignoring: true,
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: RecipeImage(
                  recipe,
                  imageRotationAngle: imageRotationAngle,
                  shadowOffset: offset * 0.5,
                ),
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
      ),
    );
  }
}
