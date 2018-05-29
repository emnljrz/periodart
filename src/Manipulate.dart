
class Manipulate {

  DateTime dateFrom;
  DateTime dateTo;
  bool _prefix = false;

  Manipulate() {
   
  }

  WithPrefix() { _prefix = true; }

  DisplayMoment() {
    Duration timeDiff = dateTo.difference(dateFrom);
    String newTime = "";

    if      (timeDiff.inSeconds.abs() < 45) newTime = "a few moments";
    else if (timeDiff.inMinutes.abs() < 2)  newTime = "a minute";
    else if (timeDiff.inMinutes.abs() < 45) newTime = "${timeDiff.inMinutes.abs()} minutes";
    else if (timeDiff.inHours.abs() < 2)    newTime = "an hour";
    else if (timeDiff.inHours.abs() < 22)   newTime = "${timeDiff.inHours.abs()} hours";
    else if (timeDiff.inDays.abs() < 2)     newTime = "a day";
    else if (timeDiff.inDays.abs() < 26)    newTime = "${timeDiff.inDays.abs()} days";
    else if (timeDiff.inDays.abs() < 60)    newTime = "a month";
    else if (timeDiff.inDays.abs() < 320)   newTime = "${timeDiff.inDays.abs() ~/ 30} months";
    else if (timeDiff.inDays.abs() < 547)   newTime = "a year";
    else                                    newTime = "${timeDiff.inDays.abs() ~/ 356} years";

    if (_prefix) {
      if (timeDiff.isNegative)
        newTime += " ago";
      else
        newTime = "in " + newTime;
    }
    return newTime;
  }

}
