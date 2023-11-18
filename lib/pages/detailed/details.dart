// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hotstar/constants/style.dart';
import 'package:hotstar/pages/detailed/widgets/category.dart';
import 'package:hotstar/pages/detailed/widgets/s_img_details.dart';
import 'package:hotstar/widgets/button.dart';

class DetailedPage extends StatelessWidget {
  final String trailerUrl;
  final String imgUrl;
  final List details;
  final String description;
  final List category;

  const DetailedPage({
    Key? key,
    required this.trailerUrl,
    required this.imgUrl,
    required this.details,
    required this.description,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                width: double.maxFinite,
                height: 200,
                child: Image.network(
                  trailerUrl,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 80,
                child: Image.network(
                  imgUrl,
                  width: 300,
                  height: 50,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 10),
              SecImgDtailsWidget(details: details),
              SmootheButtonWidget(
                text: '▶  Subscribe to Watch',
                width: 300,
                bck: Colors.grey,
                color: Colors.white,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  description,
                  style: klightText,
                ),
              ),
              CategoryWidget(category: category),
              Row(
                children: [
                  Column(
                    children: [
                      const Icon(Icons.add),
                      Text('Watchlist', style: klightText),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: [
                      const Icon(Icons.share),
                      Text('Drama', style: klightText),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
