import 'package:intl/intl.dart';

String getFormattedDate(DateTime dt , {String pattern = 'dd /MM/yyy'}){
  return DateFormat(pattern).format(dt);
}