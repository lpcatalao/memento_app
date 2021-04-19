import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  return DateFormat('dd/MM/yyyy').format(date);
}

String formatHour(TimeOfDay time) {
  return '${checkDigit(time.hour)}:${checkDigit(time.minute)}';
}

String checkDigit(int number) {
  return number <= 9 ? "0${number}" : number.toString();
}
