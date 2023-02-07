/// A module containing Types used by the DateTime module

module {
  /// A variant type to represent the day of the week.
  public type DayOfWeek = {
    #Sunday;
    #Monday;
    #Tuesday;
    #Wednesday;
    #Thursday;
    #Friday;
    #Saturday;
  };

  /// A variant type to represent the month of the year.
  public type MonthOfYear = {
    #January;
    #February;
    #March;
    #April;
    #May;
    #June;
    #July;
    #August;
    #September;
    #October;
    #November;
    #December;
  };

  /// Recording holding all the parts derived from a nanonseconds timestamp that make up a DateTime
  public type DateTimeParts = {
    year : Nat;
    month : Nat;
    day : Nat;
    wday : DayOfWeek;
    hours : Nat;
    minutes : Nat;
    seconds : Nat;
    milliseconds : Nat;
  };
}