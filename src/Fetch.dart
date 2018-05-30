class Fetch {

  DateTime _baseValue;
  String _year, _month, _day;
  String _hour, _minute, _second, _mls;
  String _timePeriod;


  Fetch(DateTime dateTimeValue) { 
  	_baseValue = dateTimeValue;
    _year   = _baseValue.year.toString().padLeft(2, "0");
    _month  = _baseValue.month.toString().padLeft(2, "0");
    _day    = _baseValue.day.toString().padLeft(2, "0");
    _hour   = _baseValue.hour.toString().padLeft(2, "0");
    _minute = _baseValue.minute.toString().padLeft(2, "0");
    _second = _baseValue.second.toString().padLeft(2, "0");
    _mls    = _baseValue.millisecond.toString();
  }

  TheDate() {
    return _year + "-" + _month  + "-" + _day;
  }

  TheMilitaryTime() {
    return _hour + ":" + _minute  + ":" + _second;
  }

  TheMilitaryTimeWithMillisecond() {
    return _hour + ":" + _minute + ":" + _second + "." + _mls;
  }

  TheRegularTime() {
    _timePeriod = int.parse(_hour) >= 12 && int.parse(_minute) > 0 ? "PM" : "AM";
    var nHour = int.parse(_hour) > 12 ? int.parse(_hour) - 12 : _hour;
    return  nHour.toString() + ":" + _minute.toString() + ":" + _second.toString() + " " + _timePeriod;
  }

  TheRegularTimeWithMillisecond() {
    _timePeriod = int.parse(_hour) >= 12 && int.parse(_minute) > 0  ? "PM" : "AM";
    var nHour = int.parse(_hour) > 12 ? int.parse(_hour) - 12 : _hour;
    return nHour.toString() + ":" + _minute.toString() + ":" + _second.toString() + "." + _mls + " " + _timePeriod;
  }


}
