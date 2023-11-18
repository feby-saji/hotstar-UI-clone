import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hotstar/constants/style.dart';
import 'package:hotstar/models/main_imgs.dart';
import 'package:hotstar/pages/detailed/details.dart';
import 'package:http/http.dart' as http;

TextEditingController _searchController = TextEditingController();
ValueNotifier<List<MainImagesModel>> allMovies = ValueNotifier([]);
List<MainImagesModel> _searchedDatas = [];

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    getSearchDatas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Center(
            child: Container(
              width: 370,
              height: 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: TextField(
                  controller: _searchController,
                  onChanged: (val) {
                    setState(() {
                      getSearchDatas(val: val);
                    });
                  },
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 30,
                      ),
                      suffixIcon: const Icon(
                        Icons.mic,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      hintText: 'Movies, shows and more',
                      hintStyle: klightText.copyWith(color: Colors.black87)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'POPULAR SEARCHES',
                  style:
                      TextStyle(fontWeight: FontWeight.w500, letterSpacing: 2),
                )),
          ),
          const SizedBox(height: 10),
          Expanded(
              child: _searchedDatas.isNotEmpty
                  ? ListView.separated(
                      itemCount: _searchedDatas.length,
                      separatorBuilder: (context, ind) {
                        return const SizedBox(height: 10);
                      },
                      itemBuilder: (BuildContext context, int ind) {
                        MainImagesModel data = _searchedDatas[ind];
                        print(data.title);
                        return ListTile(
                          leading: Image.network(
                            data.trailerUrl,
                            scale: 1,
                          ),
                          title: Text(data.title),
                          trailing: const Icon(Icons.chevron_right),
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
                            ),
                          ),
                        );
                      })
                  : const Center(
                      child: CircularProgressIndicator(color: Colors.blue),
                    ))
        ],
      ),
    );
  }

  getSearchDatas({String? val}) async {
    if (allMovies.value.isEmpty) {
      print('getting all the mvies');
      try {
        Uri uri = Uri.parse(
            'https://run.mocky.io/v3/82d0b5d9-5c5a-420b-bc46-a515b50230b3');
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
      } catch (e) {
        print(e);
      }
    }

    if (val != null) {
      _searchedDatas.clear();

      _searchedDatas.addAll(allMovies.value.where((element) =>
          element.title.toLowerCase().contains(val.toLowerCase())));
      allMovies.notifyListeners();
    } else {
      _searchedDatas.clear();

      _searchedDatas.addAll(allMovies.value);
      allMovies.notifyListeners();
    }
  }
}
