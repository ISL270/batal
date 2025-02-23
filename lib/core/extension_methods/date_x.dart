import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String toMMMM(BuildContext context) {
    final locale = Localizations.localeOf(context).toString();
    return 'Today, $day ${DateFormat.MMMM(locale).format(this)}';
  }

  String getWeekRange(DateTime date) {
    final startOfWeek = date.subtract(Duration(days: date.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 6));
    final formatter = DateFormat('MMM d'); // Example: Nov 11
    return '${formatter.format(startOfWeek)} - ${formatter.format(endOfWeek)}';
  }
}
