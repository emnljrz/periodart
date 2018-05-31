import 'package:test/test.dart';
import '../periodart.dart';

void main() {
  group('group test', () {
    String dateTimeString = "2018-05-31 12:45:00.123456";
    DateTime timeIn = DateTime.parse(dateTimeString);

    setUp(() {

    });

    print(timeIn);
    
    Period period = new Period(timeIn);

    test('Period Adjustment 1', () {
      period.Adjust(-15);
      period.ofMinutes();
      expect(period.Display() == DateTime.parse("2018-05-31 12:30:00.123456"), isTrue);
    });
  
    test('Period Adjustment 2', () {
      period.Adjust(15);
      period.ofMinutes();
      expect(period.Display() == DateTime.parse("2018-05-31 13:00:00.123456"), isTrue);
    });

    test('Period Adjustment 3', () {
      period.Adjust(6);
      period.ofMonths();
      expect(period.Display() == DateTime.parse("2018-11-30 12:45:00.123"), isTrue);
    });

    Fetch fetch = new Fetch(timeIn);

    test('Fetch 1', () {
      period.Adjust(15);
      period.ofMinutes();
      expect(fetch.TheDate() == "2018-05-31", isTrue);
    });

    test('Fetch 2', () {
      period.Adjust(15);
      period.ofMinutes();
      expect(fetch.TheMilitaryTimeWithMillisecond() == "12:45:00.123", isTrue);
    });

    test('Fetch 3', () {
      period.Adjust(15);
      period.ofMinutes();
      expect(fetch.TheRegularTime() == "12:45:00 PM", isTrue);
    });

    test('Fetch 4', () {
      period.Adjust(15);
      period.ofMinutes();
      expect(fetch.TheRegularTimeWithMillisecond() == "12:45:00.123 PM", isTrue);
    });

    test('Manipuldate 1', () {
      Manipulate manipulate = new Manipulate();
      manipulate.dateFrom  = timeIn;
      manipulate.dateTo    = DateTime.parse("2018-05-31 16:02:00");
      manipulate.WithPrefix();
      expect(manipulate.DisplayMoment() == "in 3 hours", isTrue);
    });

    test('Manipuldate 2', () {
      Manipulate manipulate = new Manipulate();
      manipulate.dateFrom  = DateTime.parse("2018-05-31 16:02:00");
      manipulate.dateTo    = timeIn;
      manipulate.WithPrefix();
      expect(manipulate.DisplayMoment() == "3 hours ago", isTrue);
    });

    test('Manipuldate 3', () {
      Manipulate manipulate = new Manipulate();
      manipulate.dateFrom  = DateTime.parse("2018-05-31 16:02:00");
      manipulate.dateTo    = timeIn;
      expect(manipulate.DisplayMoment() == "3 hours", isTrue);
    });

  });
}