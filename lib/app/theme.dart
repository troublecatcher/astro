import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final theme = ThemeData(
  brightness: Brightness.dark,
  splashFactory: NoSplash.splashFactory,
  highlightColor: Colors.transparent,
  hoverColor: Colors.transparent,
);

final br10 = BorderRadius.circular(10);
const color1 = Color.fromRGBO(214, 156, 255, 1);
const color2 = Color.fromRGBO(183, 138, 246, 1);
const color3 = Color.fromRGBO(104, 91, 222, 1);
const surfaceColor = Color.fromRGBO(42, 39, 49, 1);
const hightlightColor = Color.fromRGBO(79, 145, 255, 1);
const gradient1 = LinearGradient(
  colors: [color3, color2, color1],
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
);
const gradient2 = LinearGradient(
  colors: [color1, color2, color3],
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
);
const gradient3 = LinearGradient(
  colors: [
    Color.fromRGBO(33, 212, 253, 1),
    Color.fromRGBO(109, 128, 254, 1),
  ],
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
);
const borderColor = Color.fromRGBO(72, 90, 159, 1);

const horoscopeBorderedChipTextStyle = TextStyle(fontFamily: 'Abel');
final horoscopeDayTextStyle = TextStyle(
  fontFamily: 'Avenir',
  fontSize: 30.sp,
  fontWeight: FontWeight.w900,
);
final horoscopeTextStyle = TextStyle(
  fontFamily: 'Raleway',
  fontSize: 16.sp,
);
