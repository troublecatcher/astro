// import 'package:astro/config/remote_config.dart';
// import 'package:astro/main.dart';
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// @RoutePage()
// class TermsOfUseScreen extends StatelessWidget {
//   const TermsOfUseScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Terms of Use'),
//       ),
//       body: Builder(
//         builder: (context) {
//           final termsOfUse = di<RemoteConfig>().termsOfUse;
//           if (termsOfUse != null && termsOfUse != '') {
//             return InAppWebView(
//               initialUrlRequest: URLRequest(
//                 url: WebUri(termsOfUse),
//               ),
//             );
//           } else {
//             return const Center(
//               child: Text('Failed to load Terms of Use'),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
