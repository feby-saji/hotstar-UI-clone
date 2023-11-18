import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hotstar/pages/search/search.dart';

class DotIndicatorWidget extends StatelessWidget {
  const DotIndicatorWidget({
    super.key,
    required ValueNotifier<int> currentIndex,
  }) : _currentIndex = currentIndex;

  final ValueNotifier<int> _currentIndex;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _currentIndex,
        builder: (BuildContext context, value, _) {
          return DotsIndicator(
              dotsCount: allMovies.value.length,
              position: value,
              decorator: const DotsDecorator(
                activeColors: [
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                ],
                size: Size.square(5.0),
                activeSize: Size(18.0, 9.0),
              ));
        });
  }
}
