import 'dart:convert';
import 'package:flutter/material.dart';
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

getSportsDetails() async {
  if (sportsDetails.value.isEmpty) {
    print('getting latest release main Page');
    try {
      Uri uri = Uri.parse(
          'https://run.mocky.io/v3/158850c7-7713-4b2d-9dd6-c8a76e047f4f');
      var response = await http.get(uri);

      // Print the response body
      // print(response.body);
      var responseData = json.decode(response.body);

      sportsDetails.value.clear();
      for (var element in responseData) {
        sportsDetails.value
            .add(SportsModel(title: element['name'], imgUrl: element['image']));
      }
      sportsDetails.notifyListeners();
    } catch (e) {
      print('Error: get sports details $e');
    }
  }
}

getLatesetReleaseMovieDetails() async {
  if (latestReleaseMovies.value.isEmpty) {
    print('getting latest release main Page');
    try {
      Uri uri = Uri.parse(
          'https://run.mocky.io/v3/e2106ccd-1233-4d3a-b09b-8071bfa375aa');
      var response = await http.get(uri);

      // Print the response body
      // print(response.body);
      var responseData = json.decode(response.body);

      latestReleaseMovies.value.clear();
      for (var element in responseData) {
        latestReleaseMovies.value.add(LatestReleaseModel(
          trailerUrl: element['trailer'],
          imgUrl: element['image'],
          verImg: element['v-img'],
          title: element['name'],
          description: element['description'],
          categorys: element['category'],
          details: element['details'],
        ));
      }
      latestReleaseMovies.notifyListeners();
    } catch (e) {
    }
  }
}

getMovieDetails() async {
  if (allMovies.value.isEmpty) {
    print('getting all the movies main Page');
    try {
      Uri uri = Uri.parse(
          'https://run.mocky.io/v3/82432a46-66b3-4056-a01c-b813d6cc5b0d');
      var respose = await http.get(uri);

      var resData = json.decode(respose.body);

      allMovies.value.clear();
      for (var element in resData) {
        allMovies.value.add(MainImagesModel(
          trailerUrl: element['trailer'],
          imgUrl: element['image'],
          title: element['name'],
          description: element['description'],
          categorys: element['category'],
          details: element['details'],
        ));
      }
      allMovies.notifyListeners();
    } catch (e) {
      print('Error: get  movei details $e');
    }
  }
}
