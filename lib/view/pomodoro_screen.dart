import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:pomodoro/controller/pomodoro_controller.dart';

class PomodoroScreen extends StatefulWidget {
  const PomodoroScreen({super.key});

  @override
  State<PomodoroScreen> createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> {
  PomodoroController controller = Get.put(PomodoroController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text('${controller.currentTimer}/8',
                  style: const TextStyle(fontSize: 20.0))),
              const SizedBox(height: 20,),
              Obx(() => Container(
                    height: MediaQuery.sizeOf(context).height / 3 + 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: controller.started.value == true
                                ? Colors.blueAccent
                                : Colors.grey)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => Text(
                            controller.getRemainingTime(),
                            style: const TextStyle(fontSize: 100.0),
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width / 2,
                      child: ElevatedButton(
                        onPressed: () => controller.runTimer(),
                        child: Obx(() => Text(controller.status.toString())),
                      ),
                    ),
                    Obx(() => Visibility(
                          visible: controller.status.value == 'Retomar',
                          child: IconButton(
                              onPressed: () => controller.resetTimer(),
                              icon: const Icon(Icons.restart_alt_outlined)),
                        )),
                    Obx(() => Visibility(
                          visible: controller.status.value == 'Pausar',
                          child: IconButton(
                              onPressed: () => controller.nextTimer(),
                              icon: const Icon(Icons.skip_next)),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
