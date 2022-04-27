import 'package:intl/intl.dart';

class CommonUtils {
  static final _yearMonthDateFormatter = DateFormat('MMM dd, yyyy');
  static final _yearDateMonthTimeFormatter = DateFormat('MMM dd, yyyy  HH:mm');

   yearMonthDateFormat (DateTime dateTime){
      return _yearMonthDateFormatter.format(dateTime);
  }

  yearDateMonthTimeFormat (DateTime dateTime){
     return _yearDateMonthTimeFormatter.format(dateTime);
  }


}