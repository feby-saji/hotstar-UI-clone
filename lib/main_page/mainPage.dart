import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hotstar/api/getLatesetReleaseMovieDetails.dart';
import 'package:hotstar/api/getSportsDetails.dart';
import 'package:hotstar/models/lateset_release.dart';
import 'package:hotstar/models/main_imgs.dart';
import 'package:hotstar/models/sports.dart';
import 'package:hotstar/pages/downloads/downloads.dart';
import 'package:hotstar/pages/home/home_page..dart';
import 'package:hotstar/pages/my_space/my_space.dart';
import 'package:hotstar/pages/new_hot/new_hot.dart';
import 'package:hotstar/pages/search/search.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

List _pages = [
  const MyHomePage(),
  const SearchPage(),
  const NewAndHotPage(),
  const DownloadsPage(),
  const MySpacePage(),
];
int navInd = 0;

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    getLatesetReleaseMovieDetails();
    getSportsDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[navInd],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navInd,
        unselectedItemColor: Colors.white30,
        selectedItemColor: Colors.white,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/thunder.png',
                scale: 20,
                color: navInd == 2 ? Colors.white : Colors.white30,
              ),
              label: 'New & Hot'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.download_outlined), label: 'Downloads'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: 'My space'),
        ],
        onTap: (ind) {
          setState(() {
            navInd = ind;
          });
        },
      ),
    );
  }
}



