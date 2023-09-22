import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pomodoro/controllers/pomodoro_controller.dart';

class PomodoroScreen extends StatefulWidget {
  const PomodoroScreen({super.key});

  @override
  State<PomodoroScreen> createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> {

  Timer? _timer;
  int _start = 25 * 60;
  bool started = false;
  String _status = 'Iniciar';

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${(_start ~/ 60)}:${(_start % 60).toString().padLeft(2, '0')}',
                style: const TextStyle(
                    fontSize: 120.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    if (!started) {
                      startTimer();
                      _status = 'Pausar';
                      started = true;
                    } else {
                      setState(() {
                        started = false;
                        _status = 'Continuar';
                        _timer?.cancel();
                      });
                    }
                    },
                  child: Text(_status)
              ),
              if (_status == 'Continuar') ... [
                IconButton(onPressed: () {
                  setState(() {
                    started = false;
                    _status = 'Iniciar';
                    _start = 25 * 60;
                  });
                }, icon: Icon(Icons.restart_alt_outlined)),
              ],
              if (started) ... [
                IconButton(onPressed: () {
                  setState(() {
                    started = false;
                    _status = 'Iniciar';
                    _start = 5 * 60;
                    _timer?.cancel();
                  });
                }, icon: Icon(Icons.skip_next)),
              ]
            ],
          )
        ],
      ),
    );
  }
}
