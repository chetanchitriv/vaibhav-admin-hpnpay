import 'package:flutter/material.dart';

const Color appColor = Colors.orange;
Color? darkOrange = Colors.deepOrange[800];
Color? swiggyOrange = Colors.orange[900];

const Color textFieldGrey = Color.fromRGBO(209, 209, 209, 1);
const Color fontGrey = Color.fromRGBO(107, 115, 119, 1);
const Color darkFontGrey = Color.fromRGBO(62, 68, 71, 1);
const Color whiteColor = Color.fromRGBO(255, 255, 255, 1);
const Color lightGrey = Color.fromRGBO(239, 239, 239, 1);
const Color redColor = Color.fromRGBO(230, 46, 4, 1);
const Color golden = Color.fromRGBO(255, 168, 0, 1);
const Color greenAccent = Colors.greenAccent;

const Color lightGolden = Color(0xffFEEAD1);
const Color darkBlue = Color(0xff242760);
const Color primaryColor = Color(0xff002A53);
const Color skyColor = Color.fromRGBO(255, 168, 0, 1);
// const kPrimaryColor = Color(0xFFFF7643);
// const kPrimaryColor = Color.fromRGBO(255, 168, 0, 1);
const kPrimaryColor = Colors.yellow;
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
LinearGradient kskyGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [golden.withOpacity(0.5), golden.withOpacity(0.9)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const purpleColor = Color.fromRGBO(66, 39, 116, 1.0);
const white = Color.fromRGBO(255, 255, 255, 1);
const greyColor = Colors.grey;
const darkGrey = Color.fromRGBO(112, 112, 112, 1);
const red = Color.fromRGBO(0, 0, 0, 1.0);
const green = Color.fromRGBO(52, 168, 83, 1.0);
const magenta = Color.fromRGBO(243, 51, 152, 1.0);
const bluelight = Color.fromRGBO(227, 156, 66, 1.0);

// final Color kPrimaryColor = Colors.green[700];
final Color? kShadowColor = Colors.grey[700];
const Color blackColor = Colors.black;
final Color? kSubtitleColor = Colors.grey[600];
// final Color kSecondaryColor = Colors.white;
final Color? kBorderColor = Colors.grey[200];
final Color shimmerBaseColor = Colors.grey.withOpacity(0.4);
final Color shimmerHighlightColor = Colors.grey.withOpacity(0.7);

final TextStyle kTitleStyle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold,
  color: blackColor,
);

final TextStyle kDescriptionStyle = TextStyle(
  color: kSubtitleColor,
  fontSize: 13,
);


class AppColor {
  static LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF3EE0CC), Color(0xFF4A7973FF)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static Color primary = Color(0xFF548DF3);
  // static Color primary = Color(0xFF3EE0CC);
  static Color primarySoft = Color(0xFF548DF3);
  static Color primaryExtraSoft = Color(0xFFEFF3FC);
  // static Color secondary = Color(0xFF1B1F24);
  static Color secondary = Color(0xff132137);
  static Color secondarySoft = Color(0xFF9D9D9D);
  static Color secondaryExtraSoft = Color(0xFFE9E9E9);
  static Color error = Color(0xFFD00E0E);
  static Color success = Color(0xFF16AE26);
  static Color warning = Color(0xFFEB8600);
}
