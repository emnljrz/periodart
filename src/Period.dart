import 'util.dart';

class Period {
  
  DateTime _baseValue;
  DateTime _newValue;
  String _year, _month, _day;
  String _hour, _minute, _second, _mls;
  int _periodValue = 0;
  Util _util;

  Period(DateTime dateTimeValue) { 
  	_util = new Util();
  	_baseValue = dateTimeValue;
    _year   = _util.paddedFormat(_baseValue.year);
    _month  = _util.paddedFormat(_baseValue.month);
    _day    = _util.paddedFormat(_baseValue.day);
    _hour   = _util.paddedFormat(_baseValue.hour);
    _minute = _util.paddedFormat(_baseValue.minute);
    _second = _util.paddedFormat(_baseValue.second);
    _mls    = _util.paddedFormat(_baseValue.millisecond);
  }

  Now() { return new DateTime.now(); }

  Adjust(int value) {
    _periodValue = value;
  }

  Display() {
    return _newValue;
  }
  
  ofSeconds() {
    Duration duration = new Duration(seconds: _periodValue);
    _newValue = _baseValue.add(duration);
  }

  ofMinutes() {
    Duration duration = new Duration(minutes: _periodValue);
    _newValue = _baseValue.add(duration);
  }

  ofHours() {
    Duration duration = new Duration(hours: _periodValue);
    _newValue = _baseValue.add(duration);
  }
  
  ofDays() {
    Duration duration = new Duration(days: _periodValue);
    _newValue = _baseValue.add(duration);
  }

  ofMonths() {
    _year   = _util.paddedFormat(_baseValue.year);
    _month  = _util.paddedFormat(_baseValue.month + _periodValue);
    _day    = _baseValue.day <= 30 ? _util.paddedFormat(_baseValue.day) : _util.paddedFormat(endOfTheMonth((_baseValue.month + _periodValue)));

    _newValue = DateTime.parse(_year + "-" + _month + "-" + _day + " " + _hour + ":" + _minute + ":" + _second + "." + _mls);
  }
  
  ofYears() {
    _year   = _util.paddedFormat(_baseValue.year  + _periodValue);
    _month  = _util.paddedFormat(_baseValue.month);
    _day    = _util.paddedFormat(_baseValue.day);

    _newValue = DateTime.parse(_year + "-" + _month + "-" + _day + " " + _hour + ":" + _minute + ":" + _second + "." + _mls);
  }
  
  isMonthWith31(Object value) {
    return endOfTheMonth(value) == 31 ? true : false;
  }

  endOfTheMonth(Object value) {
    int month = value is DateTime ? value.month : value;
    int maxDate;

    if (month == 1) maxDate = 31;
    else if (month == 2 && !isLeapYear(value)) maxDate = 28;
    else if (month == 2 && isLeapYear(value)) maxDate = 29;
    else if (month == 3) maxDate = 31;
    else if (month == 4) maxDate = 30;
    else if (month == 5) maxDate = 31;
    else if (month == 6) maxDate = 30;
    else if (month == 7) maxDate = 31;
    else if (month == 8) maxDate = 31;
    else if (month == 9) maxDate = 30;
    else if (month == 10) maxDate = 31;
    else if (month == 11) maxDate = 30;
    else if (month == 12) maxDate = 31;

    return maxDate;
  }

  isLeapYear(Object value) {
      int year = value is DateTime ? value.year : value;

      if (year % 4 == 0) return true;
      else if (year % 400 == 0) return true;
      else if (year % 100 == 0) return false;
      else return false;
  }

}
