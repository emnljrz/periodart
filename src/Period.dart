class Period {
  
  DateTime _baseValue;
  DateTime _newValue;
  int _periodValue = 0;

  Period(DateTime dateTimeValue) { 
  	_baseValue = dateTimeValue;
  }

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
    var _year = paddedFormat(_baseValue.year);
    var _month = paddedFormat(_baseValue.month + _periodValue);
    var _day = _baseValue.day <= 30 ? paddedFormat(_baseValue.day) : paddedFormat(endOfTheMonth((_baseValue.month + _periodValue)));

    _newValue = DateTime.parse(_year + "-" + _month + "-" + _day);
  }
  
  ofYears() {
    var _year = paddedFormat(_baseValue.year  + _periodValue);
    var _month = paddedFormat(_baseValue.month);
    var _day = paddedFormat(_baseValue.day);

    _newValue = DateTime.parse(_year + "-" + _month + "-" + _day);
  }

  paddedFormat(int value) {
    return value.toString().padLeft(2, "0");
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
