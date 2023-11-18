// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SmootheButtonWidget extends StatelessWidget {
  String text;
  double width;
  Color color;
  Color bck;
  Function()? onPressed;
  SmootheButtonWidget({
    Key? key,
    required this.text,
    required this.width,
    required this.color,
    required this.bck,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bck,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: color, fontSize: 18),
        ),
      ),
    );
  }
}
