import 'package:flutter/material.dart';
import 'package:hotstar/models/lateset_release.dart';
import 'package:hotstar/pages/detailed/details.dart';
import 'package:hotstar/pages/home/home_page..dart';

class LatestReleasesWidget extends StatelessWidget {
  const LatestReleasesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: latestReleaseMovies,
        builder: (BuildContext context, value, _) {
          return SizedBox(
              height: 200,
              child: value.isNotEmpty
                  ? ListView.builder(
                      itemCount: latestReleaseMovies.value.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, ind) {
                        LatestReleaseModel data =
                            latestReleaseMovies.value[ind];
                        return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailedPage(
                                      trailerUrl: data.trailerUrl,
                                      imgUrl: data.imgUrl,
                                      details: data.details,
                                      description: data.description,
                                      category: data.categorys,
                                    ),
                                  )),
                              child: SizedBox(
                                child: Image.network(data.verImg),
                              ),
                            ));
                      })
                  : const Center(child: CircularProgressIndicator()));
        });
  }
}
