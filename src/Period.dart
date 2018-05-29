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
    var _year = _baseValue.year.toString().padLeft(2, "0");;
    var _month = (_baseValue.month + _periodValue).toString().padLeft(2, "0");
    var _day = _baseValue.day.toString().padLeft(2, "0");

    _newValue = DateTime.parse(_year + "-" + _month + "-" + _day);
  }
  
  ofYears() {
    var _year = (_baseValue.year  + _periodValue).toString().padLeft(2, "0");;
    var _month = _baseValue.month.toString().padLeft(2, "0");
    var _day = _baseValue.day.toString().padLeft(2, "0");

    _newValue = DateTime.parse(_year + "-" + _month + "-" + _day);
  }

}
