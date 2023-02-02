
import 'package:evaluation/helpers/custom_widgets/shimmer_ui_effect.dart';
import 'package:flutter/material.dart';

class HomeLoading extends StatelessWidget {
  const HomeLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: MyShimmerEffectUI.rectangular(
              height: 200,
            ),
          ),
          SizedBox(height: 10),

          MyShimmerEffectUI.rectangular(height: 20),
          SizedBox(height: 10),
          MyShimmerEffectUI.rectangular(height: 10),
        ],
      ),
    );
  }
}
