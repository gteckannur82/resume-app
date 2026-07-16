import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// General helper utilities.
abstract final class Helpers {
  /// Format a date relative to now.
  static String timeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final diff = now.difference(dateTime);

    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    return DateFormat('MMM d, yyyy').format(dateTime);
  }

  /// Format date as "Edited 2 hours ago".
  static String editedTimeAgo(DateTime dateTime) {
    return 'Edited ${timeAgo(dateTime).toLowerCase()}';
  }

  /// Format date for resume sections.
  static String formatDate(DateTime? date) {
    if (date == null) return 'Present';
    return DateFormat('MMM yyyy').format(date);
  }

  /// Date range string (e.g., "2021 — Present").
  static String dateRange(DateTime? start, DateTime? end) {
    final startStr = start != null ? DateFormat('yyyy').format(start) : '';
    final endStr = end != null ? DateFormat('yyyy').format(end) : 'Present';
    return '$startStr — $endStr';
  }

  /// Show a snack bar.
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  /// Calculate completion percentage from filled fields.
  static int completionPercentage(Map<String, dynamic> fields) {
    if (fields.isEmpty) return 0;
    int filled = 0;
    for (final value in fields.values) {
      if (value != null) {
        if (value is String && value.isNotEmpty) filled++;
        if (value is List && value.isNotEmpty) filled++;
        if (value is bool && value) filled++;
        if (value is int || value is double) filled++;
      }
    }
    return ((filled / fields.length) * 100).round();
  }
}
