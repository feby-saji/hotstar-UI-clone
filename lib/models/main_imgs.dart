import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MainImagesModel {
  String trailerUrl;
  String imgUrl;
  String title;
  String description;
  List categorys;
  List details;

  MainImagesModel({
    required this.trailerUrl,
    required this.imgUrl,
    required this.title,
    required this.description,
    required this.categorys,
    required this.details,
  });
}
