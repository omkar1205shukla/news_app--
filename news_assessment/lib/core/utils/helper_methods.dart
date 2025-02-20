import 'package:intl/intl.dart';

String dateFormatter(String date) {
  try {
    DateTime inputDate = DateTime.parse(date);

    // Format the date in the desired format
    String formattedDate =
        '${DateFormat('E, dd MMM yyyy').format(inputDate.toUtc())} GMT';

    return formattedDate;
  } catch (e) {
    DateTime inputDate = DateTime.now();
    String formattedDate =
        '${DateFormat('E, dd MMM yyyy').format(inputDate.toUtc())} GMT';

    return formattedDate;
  }
}
