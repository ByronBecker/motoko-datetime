import Types "Types";

module {
  /// Converts a timestamp in nanoseconds to all of its DateTimeParts.
  public func getDateTimeParts(timestampInNS: Nat) : Types.DateTimeParts {
    var year = 1970;
    let base = getDaysBaseFromNS(timestampInNS);
    var days = base;
    var leap = false;
    var size = 365;
    while (days >= size) {
      year += 1;
      days -= size;
      leap := isLeapYear(year);
      size := if leap 366 else 365;
    };
    let (month, day) = if (leap) {
      if (days > 181) {
        if (days > 273) {
          if (days > 334) {
            (12, days - 334: Nat)
          } else if (days > 304) {
            (11, days - 304: Nat)
          } else {
            (10, days - 273: Nat)
          }
        } else if (days > 243) {
          (9, days - 243: Nat)
        } else if (days > 212) {
          (8, days - 212: Nat)
        } else {
          (7, days - 181: Nat)
        }
      } else if (days > 90) {
        if (days > 151) {
          (6, days - 151: Nat)
        } else if (days > 120) {
          (5, days - 120: Nat)
        } else {
          (4, days - 90: Nat)
        }
      } else if (days > 59) {
        (3, days - 59: Nat)
      } else if (days > 30) {
        (2, days - 30: Nat)
      } else {
        (1, days + 1)
      }
    } else if (days > 180) {
      if (days > 272) {
        if (days > 333) {
          (12, days - 333: Nat)
        } else if (days > 303) {
          (11, days - 303: Nat)
        } else {
          (10, days - 272: Nat)
        }
      } else if (days > 242) {
        (9, days - 242: Nat)
      } else if (days > 211) {
        (8, days - 211: Nat)
      } else {
        (7, days - 180: Nat)
      }
    } else if (days > 89) {
      if (days > 151) {
        (6, days - 150: Nat)
      } else if (days > 119) {
        (5, days - 119: Nat)
      } else {
        (4, days - 89: Nat)
      }
    } else if (days > 58) {
      (3, days - 58: Nat)
    } else if (days > 30) {
      (2, days - 30: Nat)
    } else {
      (1, days + 1)
    };
    let wday = switch (1 + (base + 4) % 7) {
      case 1 #Sunday;
      case 2 #Monday;
      case 3 #Tuesday;
      case 4 #Wednesday;
      case 5 #Thursday;
      case 6 #Friday;
      case _ #Saturday;
    };
    {
      year = year;
      month = month;
      day = day;
      wday = wday;
      hours = getHoursFromNS(timestampInNS);
      minutes = getMinutesFromNS(timestampInNS);
      seconds = getSecondsFromNS(timestampInNS);
      milliseconds = getMillisecondsFromNS(timestampInNS);
    }
  };

  /* Helper functions */
  // Get the number of days since 1970-01-01. Does not account for leap years.
  func getDaysBaseFromNS(timestampInNS: Nat): Nat {
    timestampInNS / 86400000000000;
  };

  // Get the number of hours in the current day.
  func getHoursFromNS(timestampInNS: Nat): Nat {
    timestampInNS % 86400000000000 / 3600000000000;
  };

  // Get the number of minutes in the current day.
  func getMinutesFromNS(timestampInNS: Nat): Nat {
    timestampInNS % 3600000000000 / 60000000000;
  };

  // Get the number of seconds in the current day.
  func getSecondsFromNS(timestampInNS: Nat): Nat {
    timestampInNS % 60000000000 / 1000000000;
  };

  // Get the number of milliseconds in the current day.
  func getMillisecondsFromNS(timestampInNS: Nat): Nat {
    timestampInNS % 1000000000 / 1000000;
  };

  // Check if the given year is a leap year.
  func isLeapYear(year : Nat) : Bool {
    year % 400 == 0 or year % 100 != 0 and year % 4 == 0
  };
}