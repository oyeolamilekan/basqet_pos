import 'package:intl/intl.dart';

extension StringExtension on String {
  bool get validateEmail {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(this);
  }

  String get removeSpace {
    return replaceAll(RegExp("\n"), "");
  }

  bool get strip {
    return replaceAll(RegExp(r"\s+"), "").isEmpty;
  }

  String turnStringToDate(String format) {
    return DateFormat(format).format(DateTime.parse(this).toLocal()).toString();
  }
}
