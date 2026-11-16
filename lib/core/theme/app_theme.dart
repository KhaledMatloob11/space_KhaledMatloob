import 'package:flutter/material.dart';
import 'package:space/core/assets/app_colors.dart';

abstract final class AppTheme {
  static const TextStyle _displayLargeStyle = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
  static const TextStyle _titleLargeStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
  static const TextStyle _titleMediumStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
  static const TextStyle _bodyLargeStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
  static const TextStyle _bodyMediumStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.white70,
  );
  static final BoxDecoration headerGradientDecoration = BoxDecoration(
    gradient:  LinearGradient
      (colors: [
        AppColors.black,
        AppColors.black.withValues(alpha: 0.6),
        Colors.transparent,
      ],
      begin:  Alignment.bottomCenter,
      end: Alignment.topCenter,
    ),
  );

  static final ThemeData appTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.black,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.red,
      onPrimary: AppColors.white,
      surface: AppColors.black,
      onSurface: AppColors.white,
    ),
    iconTheme: const IconThemeData(
      color:  AppColors.white,
      size: 24,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: AppColors.red,
        foregroundColor: AppColors.white,
        padding:  const EdgeInsets.all(12),
        shape: const CircleBorder(),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.red,
        foregroundColor: AppColors.white,
        iconColor: AppColors.white,
        iconSize: 24,
        padding: const EdgeInsets.all(16),
        shape: const StadiumBorder(),
        textStyle: _titleMediumStyle,
        elevation: 0,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: _displayLargeStyle,
      titleLarge:  _titleLargeStyle,
      titleMedium: _titleMediumStyle,
      bodyLarge: _bodyLargeStyle,
      bodyMedium: _bodyMediumStyle,
    ),
  );

}