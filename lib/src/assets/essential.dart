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

import 'package:flutter/material.dart';
export 'package:flutter/material.dart';
export '../widgets/custom_page_stacks.dart';
export '../widgets/route_handler.dart';
export 'package:shared_preferences/shared_preferences.dart';

class AppTheme {
  // Map of seed colors with [light, dark] arrays
  static const themeColors = {
    'primary': [
      Color(0xFF6200EE), // Vibrant purple for light
      Color(0xFF3700B3), // Deeper purple for dark
    ],
    'accent': [
      Color(0xFF03DAC6), // Teal accent for light
      Color(0xFF018786), // Darker teal for dark
    ],
    'surface': [
      Color(0xFFFFFFFF), // White surface for light
      Color(0xFF121212), // Dark surface for dark
    ],
    'onSurface': [
      Color(0xFF000000), // Black text for light
      Color(0xFFFFFFFF), // White text for dark
    ],
  };

  // Cache ColorSchemes for light and dark modes
  static final _lightColorScheme = ColorScheme.fromSeed(
    seedColor: themeColors['primary']![0],
    secondary: themeColors['accent']![0],
    surface: themeColors['surface']![0],
    onSurface: themeColors['onSurface']![0],
    brightness: Brightness.light,
  );

  static final _darkColorScheme = ColorScheme.fromSeed(
    seedColor: themeColors['primary']![1],
    secondary: themeColors['accent']![1],
    surface: themeColors['surface']![1],
    onSurface: themeColors['onSurface']![1],
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
      useMaterial3: true,
      colorScheme: scheme,
      primaryColor: scheme.primary,
      scaffoldBackgroundColor: scheme.surface,
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: scheme.onSurface,
          fontWeight: FontWeight.normal,
        ),
        bodyMedium: TextStyle(
          color: scheme.onSurface,
          fontWeight: FontWeight.normal,
        ),
        titleLarge: TextStyle(
          color: scheme.onPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: scheme.onPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: scheme.surface,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: scheme.onPrimary,
          backgroundColor: scheme.primary,
        ),
      ),
    );
  }
}