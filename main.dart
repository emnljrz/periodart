import 'periodart.dart';

void main() {
  DateTime timeIn = new DateTime.now();

  Period period = new Period(timeIn)..Adjust(-20)..ofYears();
  print(" == PERIOD ==");
  print(timeIn);
  print(period.Display());

  Fetch fetch = new Fetch(timeIn);
  print(" == FETCH == ");
  print(fetch.TheDate());
  print(fetch.TheMilitaryTimeWithMillisecond());
  print(fetch.TheRegularTime());
  print(fetch.TheRegularTimeWithMillisecond());

  Manipulate manipulate = new Manipulate();
  print("== MANIPULATE ==");
  manipulate.dateFrom  = timeIn;
  manipulate.dateTo    = DateTime.parse("2018-05-29 16:02:00");
  manipulate.WithPrefix();
  print(manipulate.DisplayMoment());
  
}