import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:beautyTn/base/utils/size.dart';



class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: crossCenter,
        mainAxisAlignment: mainCenter,
        children: [
          Lottie.asset('assets/animation/empty_animation.json',height: 300),
        ],
      ),
    );
  }
}