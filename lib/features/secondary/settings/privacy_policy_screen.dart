// import 'package:astro/config/remote_config.dart';
// import 'package:astro/main.dart';
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// @RoutePage()
// class PrivacyPolicyScreen extends StatelessWidget {
//   const PrivacyPolicyScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Privacy Policy'),
//       ),
//       body: Builder(
//         builder: (context) {
//           final privacyPolicy = di<RemoteConfig>().privacyPolicy;
//           if (privacyPolicy != null && privacyPolicy != '') {
//             return InAppWebView(
//               initialUrlRequest: URLRequest(
//                 url: WebUri(privacyPolicy),
//               ),
//             );
//           } else {
//             return const Center(
//               child: Text('Failed to load Privacy Policy'),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
