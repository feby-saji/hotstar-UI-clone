import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hotstar/api/getMovieDetails.dart';
import 'package:hotstar/constants/style.dart';
import 'package:hotstar/models/lateset_release.dart';
import 'package:hotstar/models/sports.dart';
import 'package:hotstar/pages/home/widgets/appbar.dart';
import 'package:hotstar/pages/home/widgets/dot.dart';
import 'package:hotstar/pages/home/widgets/latest_releases.dart';
import 'package:hotstar/pages/home/widgets/main_img_slider.dart';
import 'package:hotstar/pages/home/widgets/sport.dart';
import 'package:hotstar/pages/search/search.dart';

ValueNotifier<List<LatestReleaseModel>> latestReleaseMovies = ValueNotifier([]);
ValueNotifier<List<SportsModel>> sportsDetails = ValueNotifier([]);

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

PageController pageController = PageController(initialPage: 0);

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isAppBarVisible = true;
  bool isTop = true;
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
    if (allMovies.value.isEmpty) getMovieDetails();
  }

  void _handleScroll() {
    print('initializing scroll');
    const scrollThreshold = 1;
    final isScrollingDown = _scrollController.position.userScrollDirection ==
        ScrollDirection.forward;

    if (_scrollController.offset == 0.0) {
      isTop = true;
    } else {
      isTop = false;
    }

    setState(() {
      _isAppBarVisible =
          isScrollingDown || _scrollController.offset <= scrollThreshold;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController, // Attach the controller here
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HomeImagSliderWidget(currentIndex: _currentIndex),
                DotIndicatorWidget(currentIndex: _currentIndex),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Latest Releases',
                        style: kBoldText.copyWith(fontSize: 18),
                      ),
                      const LatestReleasesWidget(),
                      Text(
                        'ICC CWC 2023 and More',
                        style: kBoldText.copyWith(fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      const SportsWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AppBarWidget(isAppBarVisible: _isAppBarVisible, isTop: isTop),
        ],
      ),
    );
  }
}
