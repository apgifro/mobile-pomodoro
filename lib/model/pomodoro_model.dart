class PomodoroModel {
  int pomodoro = 25 * 60;
  int shortBreak = 5 * 60;
  int longBreak = 15 * 60;
  
  late List<int> timers;
  
  PomodoroModel () {
    timers = [
      pomodoro, shortBreak,
      pomodoro, shortBreak,
      pomodoro, shortBreak,
      pomodoro, longBreak
    ];
  }
  
}