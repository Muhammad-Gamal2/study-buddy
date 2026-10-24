import 'package:flutter/material.dart';

// Colors from the Study Buddy style sheet.
class AppColors {
  static const primary = Color(0xFF00696B);
  static const background = Color(0xFFF4F8F7);
  static const card = Color(0xFFFFFFFF);
  static const cardBorder = Color(0xFFD5E0DE);
  static const text = Color(0xFF171D1C);
  static const secondaryText = Color(0xFF4A5856);
}

// The background and text color of one subject chip.
class SubjectColors {
  const SubjectColors(this.background, this.foreground);

  final Color background;
  final Color foreground;
}

// Each subject has its own chip colors. Unknown subjects use the last one.
SubjectColors subjectColorsFor(String subject) {
  switch (subject) {
    case 'Calculus':
      return const SubjectColors(Color(0xFFDCE6FF), Color(0xFF1F3B7A));
    case 'Data Structures':
      return const SubjectColors(Color(0xFFEADDFF), Color(0xFF4A2A7F));
    case 'Physics':
      return const SubjectColors(Color(0xFFFFE2CC), Color(0xFF7A3A00));
    case 'Accounting':
      return const SubjectColors(Color(0xFFD6F0DC), Color(0xFF1E5631));
    case 'English':
      return const SubjectColors(Color(0xFFFFD9E3), Color(0xFF7A1E3C));
    default:
      return const SubjectColors(Color(0xFFDDE4E3), Color(0xFF3A4745));
  }
}

// Builds the Material 3 theme for the whole app.
ThemeData buildAppTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.text,
      surfaceTintColor: Colors.transparent,
    ),
    cardTheme: CardThemeData(
      color: AppColors.card,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.cardBorder),
      ),
    ),
  );
}
