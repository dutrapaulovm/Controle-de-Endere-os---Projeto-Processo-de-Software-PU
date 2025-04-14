import 'package:flutter/material.dart';

/// [AppTextStyles] constants which represent the text styles for this app
///
/// {@tool snippet}
///
/// To select a constant color can used directly. For example:
///
/// ```dart
/// TextStyle selection = AppTextStyles.smalText
/// ```
/// {@end-tool}
///
abstract class AppTextStyles {
  AppTextStyles._();

  /// A tiny-sized text style used for very small text elements.
  ///
  /// This style uses a font size of 8, bold weight, and white color.
  static const TextStyle tinyText =
      TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.white);

  /// A small-sized text style used for smaller text elements.
  ///
  /// This style uses a font size of 12, bold weight, and white color.
  static const TextStyle smallText =
      TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white);

  /// A large-sized text style used for more prominent text elements.
  ///
  /// This style uses a font size of 18, bold weight, and white color.
  static const TextStyle largeText =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);

  /// A big-sized text style used for very large text elements.
  ///
  /// This style uses a font size of 24, bold weight, and white color.
  static const TextStyle bigText =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white);
}
