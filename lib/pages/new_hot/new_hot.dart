// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hotstar/models/main_imgs.dart';
import 'package:hotstar/pages/new_hot/widgets/movie_tile.dart';
import 'package:readmore/readmore.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'package:hotstar/constants/style.dart';
import 'package:hotstar/pages/search/search.dart';
import 'package:hotstar/widgets/button.dart';

class NewAndHotPage extends StatefulWidget {
  const NewAndHotPage({super.key});

  @override
  State<NewAndHotPage> createState() => _NewAndHotPageState();
}

int _tabInd = 0;
ItemScrollController _scrollController = ItemScrollController();

class _NewAndHotPageState extends State<NewAndHotPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: const BoxDecoration(color: Colors.black),
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      _scrollController.scrollTo(
                          index: 0,
                          duration: const Duration(milliseconds: 300));
                      setState(() {
                        _tabInd = 0;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'Latest Releases',
                          style: kBoldText.copyWith(fontSize: 17),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          height: 3,
                          width: MediaQuery.of(context).size.width / 3,
                          color: _tabInd == 0 ? Colors.white : Colors.black,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _scrollController.scrollTo(
                          index: 2,
                          duration: const Duration(milliseconds: 300));
                      setState(() {
                        _tabInd = 1;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'Coming Soon',
                          style: kBoldText.copyWith(fontSize: 17),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          height: 3,
                          width: MediaQuery.of(context).size.width / 3,
                          color: _tabInd == 1 ? Colors.white : Colors.black,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
        Expanded(
          child: ScrollablePositionedList.builder(
            itemScrollController: _scrollController,
            itemCount: allMovies.value.length,
            itemBuilder: (context, index) {
              MainImagesModel data = allMovies.value[index];
              return HontNewMovieTiles(
                trailerUrl: data.trailerUrl,
                imgurl: data.imgUrl,
                description: data.description,
                details: data.details,
                categorys: data.categorys,
              );
            },
          ),
        )
      ],
    );
  }
}
