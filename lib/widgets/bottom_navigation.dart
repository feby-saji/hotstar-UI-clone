// import 'package:flutter/material.dart';

// int navInd = 0;

// class BottomNavigatioBarWidget extends StatefulWidget {
//   const BottomNavigatioBarWidget({super.key});

//   @override
//   State<BottomNavigatioBarWidget> createState() =>
//       _BottomNavigatioBarWidgetState();
// }

// class _BottomNavigatioBarWidgetState extends State<BottomNavigatioBarWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: navInd,
//       unselectedItemColor: Colors.white30,
//       selectedItemColor: Colors.white,
//       items: [
//         const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//         const BottomNavigationBarItem(
//             icon: Icon(Icons.search), label: 'Search'),
//         BottomNavigationBarItem(
//             icon: Image.asset(
//               'assets/icons/thunder.png',
//               scale: 20,
//               color: navInd == 2 ? Colors.white : Colors.white30,
//             ),
//             label: 'New & Hot'),
//         const BottomNavigationBarItem(
//             icon: Icon(Icons.download_outlined), label: 'Downloads'),
//         const BottomNavigationBarItem(
//             icon: Icon(Icons.person_2_outlined), label: 'My space'),
//       ],
//       onTap: (ind) {
//         setState(() {
//           navInd = ind;
//         });
//         print(navInd);
//       },
//     );
//   }
// }
