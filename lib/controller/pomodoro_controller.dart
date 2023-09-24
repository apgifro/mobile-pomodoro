import 'dart:async';

import 'package:get/get.dart';
import 'package:pomodoro/model/pomodoro_model.dart';


class PomodoroController extends GetxController {
  PomodoroModel model = PomodoroModel();
  late RxInt _remainingTime;

  PomodoroController() {
    _remainingTime = model.pomodoro.obs;
  }

  var status = 'Iniciar'.obs;
  Timer? _timer;
  RxBool started = false.obs;
  var currentTimer = 1.obs;

  void runTimer() {
    if (!started.value) {
      startTimer();
      status.value = 'Pausar';
      started.value = true;
    } else {
      started.value = false;
      status.value = 'Retomar';
      _timer?.cancel();
    }
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_remainingTime == 0) {
            nextTimer();
        } else {
            _remainingTime--;
        }
      },
    );
  }

  void resetTimer() {
    status.value = 'Iniciar';
    _remainingTime.value = 1500;
    started.value = false;
  }

  void nextTimer() {
    currentTimer++;
    if (currentTimer == 9) {
      currentTimer.value = 1;
    }
    started.value = false;
    status.value = 'Iniciar';
    _remainingTime.value = model.timers[currentTimer.toInt() - 1];
    _timer?.cancel();
  }

  String getRemainingTime() {
    return '${(_remainingTime ~/ 60)}:'
           '${(_remainingTime % 60).toString().padLeft(2, '0')}';
  }
}
