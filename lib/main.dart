import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro/view/pomodoro_screen.dart';

import 'package:get/get.dart';

void main() {
  runApp(DevicePreview(
      enabled: true,
      builder: (BuildContext context) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: PomodoroScreen(),
            theme: ThemeData(
              colorSchemeSeed: const Color(0x63B9FF),
              useMaterial3: true,
            ),
          )));
}
