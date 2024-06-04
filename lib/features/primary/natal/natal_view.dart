import 'package:astro/common/layout/primary_feature_base_view.dart';
import 'package:astro/common/widget/coming_soon.dart';
import 'package:flutter/material.dart';

class NatalView extends StatelessWidget {
  const NatalView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const PrimaryFeatureBaseView(
      children: [
        ComingSoon(title: 'Natal chart'),
      ],
    );
  }
}
