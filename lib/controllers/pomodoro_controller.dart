import 'dart:async';


class PomodoroController {
  String status = 'Iniciar';
  bool started = false;

  Timer? _timer;
  int time = 25 * 60;

  void start() {
    _timer = Timer.periodic(
        const Duration(seconds: 1), (Timer timer) {
      if (time <= 0) {
        timer.cancel();
      } else {
        if (time > 0) {
          time -= 1;
        }
      }
    });
    started = true;
    status = 'Pausar';
  }

  void updateStatus() {
    if (!started) {
      started = true;
    }
  }
}