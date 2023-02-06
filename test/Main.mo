import Option "mo:base/Option";
import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Time "mo:base/Time";

import DateTime "../src/DateTime";
import Types "../src/Types";

actor {
  public func getDateTime(): async Types.DateTimeParts {
    DateTime.now().getDateTimeObject();
  };

  public func showDateTime(): async Text {
    DateTime.now().show();
  };
};
