import 'package:flutter/material.dart';
import 'package:hotstar/constants/style.dart';
import 'package:hotstar/pages/detailed/details.dart';

class SecImgDtailsWidget extends StatelessWidget {
  const SecImgDtailsWidget({
    Key? key,
    required this.details,
  }) : super(key: key);

  final List details;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50,
      child: Align(
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: details.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, ind) {
            return const Text(
              ' • ',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            );
          },
          itemBuilder: (context, ind) {
            return Text(
              details[ind],
              style: klightText.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            );
          },
        ),
      ),
    );
  }
}
