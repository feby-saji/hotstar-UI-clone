// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hotstar/constants/style.dart';

class DetailsWidget extends StatelessWidget {
  List details;
  DetailsWidget({
    Key? key,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 25,
        child: Align(
          alignment: Alignment.center,
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
                    fontSize: 15,
                    color: const Color.fromARGB(255, 237, 231, 231)),
              );
            },
          ),
        ),
      ),
    );
  }
}
