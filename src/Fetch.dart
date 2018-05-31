import 'util.dart';

class Fetch {

  DateTime _baseValue;
  String _year, _month, _day;
  String _hour, _minute, _second, _mls;
  String _timePeriod;
  Util _util;


  Fetch(DateTime dateTimeValue) { 
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
