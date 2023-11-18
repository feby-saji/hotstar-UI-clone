import 'package:flutter/material.dart';
import 'package:hotstar/models/main_imgs.dart';
import 'package:hotstar/pages/detailed/details.dart';
import 'package:hotstar/pages/home/home_page..dart';
import 'package:hotstar/pages/home/widgets/sllider.dart';
import 'package:hotstar/pages/search/search.dart';

class HomeImagSliderWidget extends StatelessWidget {
  const HomeImagSliderWidget({
    super.key,
    required ValueNotifier<int> currentIndex,
  }) : _currentIndex = currentIndex;

  final ValueNotifier<int> _currentIndex;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: allMovies,
        builder: (BuildContext context, value, _) {
          return SizedBox(
              height: 400,
              child: value.isNotEmpty
                  ? PageView.builder(
                      onPageChanged: (index) {
                        _currentIndex.value = index % allMovies.value.length;
                        _currentIndex.notifyListeners();
                        print(_currentIndex);
                      },
                      controller: pageController,
                      itemBuilder: (context, ind) {
                        MainImagesModel data = allMovies.value[ind];
                        return HomeImageSliderWidget(
                            details: allMovies
                                .value[ind % allMovies.value.length].details,
                            pImgUrl: allMovies
                                .value[ind % allMovies.value.length].trailerUrl,
                            sImgUrl: allMovies
                                .value[ind % allMovies.value.length].imgUrl,
                            btnText: 'watch now',
                            onPressed: () {
                              print('rninnnnnnnnng');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailedPage(
                                      trailerUrl: data.trailerUrl,
                                      imgUrl: data.imgUrl,
                                      details: data.details,
                                      description: data.description,
                                      category: data.categorys,
                                    ),
                                  ));
                            });
                      })
                  : const Center(child: CircularProgressIndicator()));
        });
  }
}
