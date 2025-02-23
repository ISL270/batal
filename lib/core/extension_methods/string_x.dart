import 'package:batal_core/core/extension_methods/arabic_x.dart';
import 'package:batal_core/core/extension_methods/english_x.dart';

extension StringX on String {
  /// Adds definite Alif Lam if Arabic,
  ///
  /// and capitalizes first letter if Enlish.
  /// ```dart
  /// print(context.l10n.champion.capitalizedDefinite) //if en: "Champion" / if ar: "البطل"
  /// ```
  String get capitalizedDefinite => capitalized.definite;

  String get initials {
    final parts = trim().split(' '); // Trim leading/trailing whitespace and split by space
    if (parts.isEmpty) return '';
    final firstInitial = parts.isNotEmpty ? parts.first[0] : '';
    final lastInitial = parts.length > 1 ? parts.last[0] : '';
    return (firstInitial + lastInitial).toUpperCase();
  }
}
