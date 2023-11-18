// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hotstar/pages/detailed/details.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
    required this.category,
  }) : super(key: key);

  final List category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Align(
        alignment: Alignment.center,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: category.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, ind) {
            return const Text(
              ' | ',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            );
          },
          itemBuilder: (context, ind) {
            return Text(
              category[ind],
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}
