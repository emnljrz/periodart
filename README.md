# PerioDart
[![Pub](https://img.shields.io/pub/v/periodart.svg)](https://pub.dartlang.org/packages/periodart)
[![Build Status](https://travis-ci.org/emnljrz/periodart.svg?branch=master)](https://travis-ci.org/emnljrz/periodart)

Ez Dart DateTime Library :package:

It's a DateTime library for Dart if you want to use it see the file for usage.

## Usage
```dart
import 'periodart.dart';

void main() {
  DateTime timeIn = new DateTime.now();

  Period period = new Period(timeIn)..Adjust(-15)..ofMinutes();
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
```


## Features and bugs

Suggest feature requests and bugs at the [issue tracker][tracker].
[tracker]: https://github.com/emnljrz/periodart/issues


**License** : BSD-2-Clause
Use it on your own risk.

**Let's make the DartLang a better place.**
