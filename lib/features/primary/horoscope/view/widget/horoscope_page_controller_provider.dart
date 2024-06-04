// import 'package:flutter/material.dart';

// class HoroscopePageControllerProvider extends StatefulWidget {
//   final Widget child;

//   const HoroscopePageControllerProvider({super.key, required this.child});

//   @override
//   HoroscopePageControllerProviderState createState() =>
//       HoroscopePageControllerProviderState();

//   static HoroscopePageControllerProviderState of(BuildContext context) {
//     return context
//         .findAncestorStateOfType<HoroscopePageControllerProviderState>()!;
//   }
// }

// class HoroscopePageControllerProviderState
//     extends State<HoroscopePageControllerProvider> {
//   PageController pageController = PageController(
//     viewportFraction: 0.7,
//     initialPage: 1,
//   );

//   void gotoPage(int page) {
//     pageController.animateToPage(
//       page,
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.easeInOut,
//     );
//   }

//   void recreatePageController(int initialPage) {
//     pageController.dispose();
//     pageController = PageController(
//       viewportFraction: 0.7,
//       initialPage: initialPage,
//     );
//     setState(
//         () {}); // This will trigger a rebuild to use the new PageController
//   }

//   @override
//   Widget build(BuildContext context) {
//     return widget.child;
//   }

//   @override
//   void dispose() {
//     pageController.dispose();
//     super.dispose();
//   }
// }
