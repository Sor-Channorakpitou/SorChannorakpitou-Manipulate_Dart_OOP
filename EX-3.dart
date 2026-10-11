class MyDuration {
  // final int _seconds;
  // final int _hours;
  final int _milliseconds;

  MyDuration(this._milliseconds) {
    if(_milliseconds < 0) throw ArgumentError('Duration must be positive!');
  }

  // Name constructors
  MyDuration.fromHours(int hours): _milliseconds = hours * 3600 * 1000;
  MyDuration.fromMinutes(int minutes): _milliseconds = minutes * 60 * 1000;
  MyDuration.fromSeconds(int seconds): _milliseconds = seconds * 1000;

  bool operator >(MyDuration secondOp) {
    return _milliseconds > secondOp._milliseconds;
  }

  MyDuration operator +(MyDuration secondOp) {
    return MyDuration(_milliseconds + secondOp._milliseconds);
  }

  MyDuration operator -(MyDuration secondOp) {
    return (_milliseconds > secondOp._milliseconds) ? 
    MyDuration(_milliseconds - secondOp._milliseconds) :
    throw ArgumentError('The second operand must be smaller than the first operand!');
  }

  // Display the duration in a readable format
  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  MyDuration duration1 = MyDuration.fromHours(3); // 3 hours
  MyDuration duration2 = MyDuration.fromMinutes(45); // 45 minutes
  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1>duration2); //true

  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e); 
  }
}
