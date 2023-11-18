import 'package:flutter/material.dart';
import 'package:hotstar/constants/style.dart';

class MySpacePage extends StatelessWidget {
  const MySpacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: 700,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff091833), Color.fromARGB(255, 0, 0, 0)]),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Image.asset('assets/icons/disney_logo.png', scale: 7),
                      const Spacer(),
                      const Icon(Icons.settings),
                      const SizedBox(width: 2),
                      const Text('Help & settings'),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),
                    Image.asset('assets/icons/my_space.png', scale: 10),
                    const SizedBox(height: 20),
                    Text(
                      'Login to Disney+ hotstar',
                      style: kBoldText,
                    ),
                    Text(
                      'Start watching from where you left off, personalise for kids and more',
                      textAlign: TextAlign.center,
                      style: klightText,
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      child: Container(
                        width: 220,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            Color.fromARGB(255, 0, 94, 255),
                            Color.fromARGB(255, 14, 39, 81)
                          ]),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Center(
                            child: Text(
                          'Log in',
                          style: TextStyle(fontSize: 18),
                        )),
                      ),
                    ),
                    const SizedBox(height: 20),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Having trouble logging in? ',
                          style: klightText),
                      const TextSpan(
                          text: 'Get Help',
                          style: TextStyle(color: Colors.blue)),
                    ])),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
