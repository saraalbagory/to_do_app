import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/common/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      primaryColor: AppColors.purple,
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
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.purple,
              textStyle: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600))),
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.lightPurple.withOpacity(0.9),
          selectedItemColor: AppColors.purple,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: const IconThemeData(size: 30)),
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.lightPurple,
          onPrimary: AppColors.purple,
          secondary: AppColors.purple,
          onSecondary: AppColors.purple,
          error: Colors.red,
          onError: Colors.red,
          surface: Colors.white,
          onSurface: Colors.black),
          datePickerTheme: DatePickerThemeData(headerBackgroundColor:AppColors.purple.withOpacity(0.8),
          headerForegroundColor: Colors.white,
          headerHeadlineStyle: TextStyle(
            fontWeight: FontWeight.w600,
          ) ,
          cancelButtonStyle: ButtonStyle(
            textStyle: WidgetStatePropertyAll(TextStyle(color: AppColors.purple))
          ),
          confirmButtonStyle: ButtonStyle(
            textStyle: WidgetStatePropertyAll(TextStyle(color: AppColors.purple))
          ),
          
          ),
          
          );
  static ThemeData darkTheme = ThemeData(
      appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    centerTitle: true,
  ));
}
