import 'package:engu/core/infrastructure/constant.dart';
import 'package:engu/core/infrastructure/custom_material_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme() {
  return ThemeData.from(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: customMaterialColor(CustomColor.primaryColor),
    ),
  ).copyWith(
    primaryColor: CustomColor.primaryColor,
    textTheme: GoogleFonts.latoTextTheme(),
    scaffoldBackgroundColor: CustomColor.primaryBgColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: CustomColor.primaryBgColor,
      foregroundColor: CustomColor.primaryColor,
      elevation: 0,
    ),
  );
}
