import 'package:flutter/material.dart';
import 'package:hotstar/constants/style.dart';
import 'package:hotstar/pages/search/search.dart';
import 'package:hotstar/widgets/button.dart';
import 'package:readmore/readmore.dart';

class HontNewMovieTiles extends StatelessWidget {
  String trailerUrl;
  String imgurl;
  String description;
  List details;
  List categorys;
  HontNewMovieTiles({
    Key? key,
    required this.trailerUrl,
    required this.imgurl,
    required this.description,
    required this.details,
    required this.categorys,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Image.network(trailerUrl),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Image.network(
                  imgurl,
                  width: 100,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 25,
                child: Align(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: allMovies.value[0].categorys.length +
                        allMovies.value[0].details.length,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, ind) {
                      return const Text(
                        ' • ',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      );
                    },
                    itemBuilder: (context, ind) {
                      List items = [
                        ...details,
                        ...categorys,
                      ];
                      return Text(
                        items[ind],
                        style: klightText.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      );
                    },
                  ),
                ),
              ),
              ReadMoreText(
                description,
                trimLines: 1,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
                style: const TextStyle(color: Colors.grey),
                moreStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SmootheButtonWidget(
                    text: 'Subscribe to Watch',
                    width: 270,
                    color: Colors.white,
                    bck: Colors.grey,
                  ),
                  SmootheButtonWidget(
                    text: '+',
                    width: 60,
                    bck: const Color.fromARGB(255, 75, 73, 73),
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        )
      ],
    ));
  }
}
