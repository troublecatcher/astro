import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class FeatureSelectionCard extends StatelessWidget {
  final int position;
  final String assetName;
  final VoidCallback onPressed;
  const FeatureSelectionCard({
    super.key,
    required this.position,
    required this.assetName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredGrid(
      position: position,
      duration: const Duration(milliseconds: 700),
      columnCount: 2,
      child: FlipAnimation(
        child: FadeInAnimation(
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: onPressed,
            child: Hero(
              tag: '$position',
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(assetName),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
