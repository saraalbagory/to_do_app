import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/common/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: GoogleFonts.lexendDeca(
          fontSize: 19,
          fontWeight: FontWeight.w600,
          color: Colors.black,
         ),
      //   titleTextStyle:TextStyle(
      //      fontSize: 19,
      //     fontWeight: FontWeight.w500,
      //     color: Colors.black,

      //   )
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.purple,
        shape: const CircleBorder(),
        iconSize: 26,
       //elevation: 10.0,
      ),
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(backgroundColor: AppColors.lightPurple.withOpacity(0.9),selectedItemColor: AppColors.purple,showSelectedLabels: false,showUnselectedLabels: false,selectedIconTheme: const IconThemeData(
            size: 30
          )),
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.lightPurple,
          onPrimary: AppColors.purple,
          secondary: AppColors.purple,
          onSecondary:AppColors.purple,
          error: Colors.red,
          onError: Colors.red,
          surface:Colors.white,
          onSurface:Colors.black));
  static ThemeData darkTheme = ThemeData(
      appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    centerTitle: true,
  ));
}
