import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/style/app_theme.dart';

const String _spThemeKey = 'is_light_theme';

// Renaming provider for clarity
final themeControllerProvider = ChangeNotifierProvider((ref) => ThemeController());

class ThemeController with ChangeNotifier {
  // Initialize with platform brightness
  ThemeController() : _isLight = PlatformDispatcher.instance.platformBrightness != Brightness.dark {
    // Load stored theme preference from SharedPreferences
    SharedPreferences.getInstance().then<void>(
          (sp) {
        final theme = sp.getBool(_spThemeKey);
        if (theme != null && theme != isLight) {
          _isLight = theme;
          notifyListeners(); // Notify listeners about theme change
        }
      },
      onError: (e) {
        log('Error loading theme from SharedPreferences: $e');
      },
    );
  }

  // Return the correct theme (light or dark)
  ThemeData get theme => isLight ? AppThemes.light() : AppThemes.dark();

  // Getter for light theme
  bool get isLight => _isLight;

  // Getter for dark theme (opposite of isLight)
  bool get isDark => !isLight;

  // Private variable to hold theme state
  bool _isLight;

  // Method to switch between themes and save to SharedPreferences
  void switchTheme() {
    _isLight = !_isLight; // Toggle the theme

    // Save the new theme preference
    SharedPreferences.getInstance().then<void>(
          (sp) {
        sp.setBool(_spThemeKey, _isLight);
      },
      onError: (e) {
        log('Error saving theme to SharedPreferences: $e');
      },
    );
    notifyListeners(); // Notify listeners about theme change
  }
}
