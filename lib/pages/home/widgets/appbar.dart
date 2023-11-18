import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({
    super.key,
    required bool isAppBarVisible,
    required this.isTop,
  }) : _isAppBarVisible = isAppBarVisible;

  final bool _isAppBarVisible;
  final bool isTop;

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      top: widget._isAppBarVisible ? 0 : -80,
      left: 0,
      right: 0,
      child: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(
          'assets/icons/disney_logo.png',
          width: 100,
          height: 100,
          scale: 2,
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(59, 255, 191, 0),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: const Color(0xffffcc75))),
            child: const Padding(
              padding: EdgeInsets.all(2),
              child: Text(
                'subscribe',
                style: TextStyle(color: Color(0xffffe490)),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Image.asset(
            'assets/icons/cast.png',
            color: Colors.white,
            scale: 20,
          ),
          const SizedBox(width: 20),
        ],
        backgroundColor: widget.isTop ? Colors.transparent : Colors.black,
      ),
    );
  }
}
