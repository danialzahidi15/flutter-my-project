import 'package:flutter_riverpod/flutter_riverpod.dart';

enum TimerState {
  start,
  stop,
  reset,
}

class TimerController extends StateNotifier {
  TimerController(super.state);

  void setSeconds(int seconds) {
    String showSec = (seconds >= 10) ? '$seconds' : '0$seconds';
    state = state.copyWith(seconds: seconds, displaySec: showSec);
  }
}
