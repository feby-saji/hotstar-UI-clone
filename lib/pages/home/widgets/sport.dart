import 'package:flutter/material.dart';
import 'package:hotstar/models/sports.dart';
import 'package:hotstar/pages/home/home_page..dart';

class SportsWidget extends StatelessWidget {
  const SportsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: sportsDetails,
        builder: (BuildContext context, value, _) {
          return SizedBox(
              height: 200,
              width: 500,
              child: value.isNotEmpty
                  ? ListView.builder(
                      itemCount: sportsDetails.value.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, ind) {
                        SportsModel data = sportsDetails.value[ind];
                        return Padding(
                          padding: const EdgeInsets.only(right: 9),
                          child: SizedBox(
                            height: 200,
                            width: 200,
                            child: Column(
                              children: [
                                Image.network(
                                  data.imgUrl,
                                  width: 200,
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Text(data.title, maxLines: 2)),
                                    Image.asset(
                                      'assets/icons/more.png',
                                      scale: 25,
                                      color: Colors.white,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      })
                  : const Center(child: CircularProgressIndicator()));
        });
  }
}
