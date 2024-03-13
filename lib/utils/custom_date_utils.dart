import 'package:intl/intl.dart';


class CustomDateUtils {
  static String formatDate(String date) {
    if (date.isEmpty) {
      return '';
    }

    String day = DateFormat('dd').format(DateTime.parse(date));
    String month = DateFormat('MMMM', 'en')
        .format(DateTime.parse(date).toLocal());
    String year = DateFormat('yyyy').format(DateTime.parse(date).toLocal());
    return '$day $month $year';
  }

}
