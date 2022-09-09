import 'package:intl/intl.dart';

extension DateTimeExtention on DateTime {
  String formatDate(format) {
    return DateFormat(format).format(this);
    // return DateFormat("MM/dd/yyyy").format(this);
  }
}
