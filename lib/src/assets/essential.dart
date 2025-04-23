//
// essential.dart
//
// Central hub for exporting essential widgets, utilities, and imports used 
// throughout the app. Centralizing these dependencies here simplifies 
// maintenance and ensures consistency across the project by allowing updates 
// to propagate from a single point.
//
// Containing things such as:
// - Universal Flutter imports
// - Core Widgets
// - Constants (as needed)
//

import 'dart:ui';
import 'package:flutter/material.dart';
export 'package:flutter/material.dart';
export '../widgets/custom_page_stacks.dart';
export '../widgets/route_handler.dart';
export 'package:shared_preferences/shared_preferences.dart';

const double screenWidth = 360.0;

class AppTheme {
  // Map of seed colors with [light, dark] arrays
  static const themeColors = {
    'primary': [Color(0xFF546E7A), Color(0xFF78909C)], // BlueGrey seeds
    'accent': [Color(0xFF26A69A), Color(0xFF4DB6AC)], // Teal seeds
  };

  // Cache ColorSchemes for light and dark modes
  static final _lightColorScheme = ColorScheme.fromSeed(
    seedColor: themeColors['primary']![0],
    secondary: themeColors['accent']![0],
    brightness: Brightness.light,
  );

  static final _darkColorScheme = ColorScheme.fromSeed(
    seedColor: themeColors['primary']![1],
    secondary: themeColors['accent']![1],
    brightness: Brightness.dark,
  );

  // Get color based on context's brightness
  static Color getColor(String key, BuildContext context) {
    final scheme = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? _darkColorScheme
        : _lightColorScheme;
    switch (key) {
      case 'primary':
        return scheme.primary;
      case 'accent':
        return scheme.secondary;
      case 'background':
        return scheme.surface;
      case 'text':
        return scheme.onSurface;
      default:
        throw Exception('Invalid color key: $key');
    }
  }

  // Single ThemeData object
  static ThemeData getTheme(BuildContext context) {
    final scheme = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? _darkColorScheme
        : _lightColorScheme;
    return ThemeData(
      useMaterial3: true, // Enable Material Design 3
      colorScheme: scheme,
      primaryColor: scheme.primary,
      scaffoldBackgroundColor: scheme.surface,
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: scheme.onSurface),
        bodyMedium: TextStyle(color: scheme.onSurface),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
      ),
    );
  }
}