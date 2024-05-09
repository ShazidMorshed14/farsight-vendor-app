// formate date Date Month, Year
import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  return DateFormat('dd MMMM, yyyy').format(date.toLocal());
}

String formatTimeWithFormatter({required DateTime date, String? formatter}) {
  return DateFormat(formatter ?? 'dd MMMM, yyyy hh:mm a')
      .format(date.toLocal());
}
