// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hotstar/constants/style.dart';
import 'package:hotstar/widgets/button.dart';

class DownloadsPage extends StatelessWidget {
  const DownloadsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Downloads',
                style: kBoldText,
              ),
            ),
            const SizedBox(height: 200),
            Image.asset('assets/icons/my_space.png', scale: 10),
            const SizedBox(height: 20),
            Text(
              'No Downloads Available',
              style: kBoldText,
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Explore and download your favourite movies and shows to watch on the go',
                style: klightText,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),
            SmootheButtonWidget(
              text: 'Go to Home',
              width: 250,
              color: Colors.white,
              bck: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
