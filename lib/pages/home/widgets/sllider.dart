// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hotstar/pages/home/widgets/details.dart';
import 'package:hotstar/widgets/button.dart';

class HomeImageSliderWidget extends StatelessWidget {
  List details;
  String pImgUrl;
  String sImgUrl;
  String btnText;
  Function() onPressed;

  HomeImageSliderWidget({
    Key? key,
    required this.details,
    required this.pImgUrl,
    required this.sImgUrl,
    required this.btnText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 280,
          width: 500,
          child: Stack(
            children: [
              Image.network(
                pImgUrl,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.network(
                  sImgUrl,
                  height: 100,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        DetailsWidget(details: details),
        const SizedBox(height: 10),
        SmootheButtonWidget(
          onPressed: onPressed,
          text: '▶ $btnText',
          width: 200,
          bck: const Color.fromARGB(255, 102, 93, 93),
          color: Colors.white,
        ),
      ],
    );
  }
}
