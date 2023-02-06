import Int "mo:base/Int";
import Nat "mo:base/Nat";
import Time "mo:base/Time";

import DateTimeParts "DateTimeParts";
import Types "./Types";

module {
  /// Create a new DateTime object with the current time.
  public func now() : DateTime {
    DateTime(null)
  };

  /// Create a new DateTime object from the provided timestamp. If no timestamp is provided, the current time is used.
  public class DateTime(initialTimestampInNS : ?Nat) {
    let timestampInNS = switch(initialTimestampInNS) {
      case (?t) t;
      case null Int.abs(Time.now());
    };
    let dateTimeParts = DateTimeParts.getDateTimeParts(timestampInNS);

    /// Returns the timestamp in nanoseconds that seeded the current DateTime object.
    public func getTimestampInNS() : Nat {
      timestampInNS
    };

    /// Returns all of the DateTimeParts of the current DateTime object.
    public func getDateTimeObject() : Types.DateTimeParts {
      dateTimeParts
    };

    /// Returns an (poorly) opinionated string representation of the current DateTime object.
    public func show(): Text {
      var accum = "";
      accum #= showYear();
      accum #= "/";
      accum #= showMonth(); 
      accum #= "/";
      accum #= showDay();
      accum #= " ";
      accum #= showHours();
      accum #= ":";
      accum #= showMinutes();
      accum #= ":";
      accum #= showSeconds();
      accum #= " ";
      accum #= showMilliseconds();
      accum
    };

    /// Returns the current year of the DateTime object.
    public func getYear() : Nat {
      dateTimeParts.year
    };

    /// Returns the current month of the DateTime object.
    public func getMonth() : Nat {
      dateTimeParts.month
    };

    /// Returns the current month name of the DateTime object as a string.
    public func getMonthName() : Text {
      switch(dateTimeParts.month) {
        case 1 "January";
        case 2 "February";
        case 3 "March";
        case 4 "April";
        case 5 "May";
        case 6 "June";
        case 7 "July";
        case 8 "August";
        case 9 "September";
        case 10 "October";
        case 11 "November";
        case _ "December";
      };
    };

    /// Returns the current month name of the DateTime object as a MonthOfYear variant.
    public func getMonthOfYear(): Types.MonthOfYear {
      switch(dateTimeParts.month) {
        case 1 #January;
        case 2 #February;
        case 3 #March;
        case 4 #April;
        case 5 #May;
        case 6 #June;
        case 7 #July;
        case 8 #August;
        case 9 #September;
        case 10 #October;
        case 11 #November;
        case _ #December;
      };
    };

    /// Returns the current day of the DateTime object.
    public func getDay() : Nat {
      dateTimeParts.day
    };

    /// Returns the current day of the week of the DateTime object.
    public func getDayOfWeek() : Types.DayOfWeek {
      dateTimeParts.wday
    };

    /// Returns the current hour of the DateTime object.
    public func getHour() : Nat {
      dateTimeParts.hours
    };

    /// Returns the current minute of the DateTime object.
    public func getMinutes() : Nat {
      dateTimeParts.minutes
    };

    /// Returns the current second of the DateTime object.
    public func getSeconds() : Nat {
      dateTimeParts.seconds
    };

    /// Returns the current millisecond of the DateTime object.
    public func getMilliseconds() : Nat {
      dateTimeParts.milliseconds
    };

    /// Returns the current year of the DateTime object as a string.
    public func showYear() : Text {
      showWithPad(4, Nat.toText(dateTimeParts.year))
    };

    /// Returns a zero padded numerical representation of the current month of the DateTime object as a string.
    public func showMonth() : Text {
      showWithPad(2, Nat.toText(dateTimeParts.month))
    };

    /// Returns a zero padded numerical representation of the current day of the DateTime object as a string.
    public func showDay() : Text {
      showWithPad(2, Nat.toText(dateTimeParts.day))
    };

    /// Returns a zero padded numerical representation of the current hours of the DateTime object as a string.
    public func showHours() : Text {
      showWithPad(2, Nat.toText(dateTimeParts.hours))
    };

    /// Returns a zero padded numerical representation of the current minutes of the DateTime object as a string.
    public func showMinutes() : Text {
      showWithPad(2, Nat.toText(dateTimeParts.minutes))
    };

    /// Returns a zero padded numerical representation of the current seconds of the DateTime object as a string.
    public func showSeconds() : Text {
      showWithPad(2, Nat.toText(dateTimeParts.seconds))
    };

    /// Returns a zero padded numerical representation of the current milliseconds of the DateTime object as a string.
    public func showMilliseconds() : Text {
      showWithPad(3, Nat.toText(dateTimeParts.milliseconds))
    };

    // Apply a zero pad prefix up to the given length.
    private func showWithPad(n : Nat, text : Text) : Text {
      var accum = text;
      var i = accum.size();
      while (i < n) {
        accum := "0" # accum;
        i += 1;
      };
      accum
    };
  };
};