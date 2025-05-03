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

// Spacing/Padding constants
const defaultPadding = EdgeInsets.all(24.0); // Standard 24-point padding
const closePadding = EdgeInsets.all(12.0); // Closer 12-point padding for cohesive layouts
const defaultSpacing = 24.0; // Standard 24-point spacing
const closeSpacing = 12.0; // Closer 12-point spacing for tighter layouts

// Text styles
const headlineTextStyle = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
  letterSpacing: 0.5,
);
const bodyTextStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.normal,
);
const captionTextStyle = TextStyle(
  fontSize: 12.0,
  fontWeight: FontWeight.w400,
  color: Colors.grey,
);

// Animation durations
const shortAnimationDuration = Duration(milliseconds: 200); // Fast animations (e.g., button press)
const mediumAnimationDuration = Duration(milliseconds: 400); // Standard animations (e.g., page transitions)
const longAnimationDuration = Duration(milliseconds: 800); // Slow animations (e.g., fades)

// Border radius constants
const defaultBorderRadius = BorderRadius.all(Radius.circular(12.0)); // Standard for buttons, cards
const smallBorderRadius = BorderRadius.all(Radius.circular(8.0)); // Smaller for compact widgets
const largeBorderRadius = BorderRadius.all(Radius.circular(20.0)); // Larger for modals, dialogs

// Elevation levels
const lowElevation = 2.0; // Subtle shadows (e.g., buttons)
const mediumElevation = 4.0; // Standard shadows (e.g., cards)
const highElevation = 8.0; // Prominent shadows (e.g., dialogs)

class AppUtils {
  // Calculate responsive width based on screen size
  static double getResponsiveWidth(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.width * percentage;
  }

  // Calculate responsive height based on screen size
  static double getResponsiveHeight(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.height * percentage;
  }

  // Check if the device is in dark mode
  static bool isDarkMode(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark;
  }
}

// App-wide constants
class AppConstants {
  static const String appName = 'Study Hall';
}

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