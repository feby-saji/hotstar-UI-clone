import 'package:flutter/material.dart';
import 'package:hotstar/constants/theme.dart';
import 'package:hotstar/main_page/mainPage.dart';
import 'package:hotstar/pages/search/search.dart';

void main() async {
  runApp(const MyApp());
  await getMovieDetails();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeDataClass.darkTheme,
      home: ValueListenableBuilder(
        valueListenable: allMovies,
        builder: (context,value,_){
          return  value.isNotEmpty ? MainPage() : Center(child: CircularProgressIndicator());
        },
      )
    );
  }
}
