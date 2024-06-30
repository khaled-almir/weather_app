import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/pages/current_temp_controller.dart';

class CurrentTemp extends StatefulWidget {
  const CurrentTemp({super.key});

  @override
  State<CurrentTemp> createState() => _CurrentTempState();
}

class _CurrentTempState extends State<CurrentTemp> {
  final CurrentTempController weatherController = Get.put(CurrentTempController());
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: const Text('Current Temp'),
        ),
        body: Obx(() {
          final weather = weatherController.currentWeather.value;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('Location: ${weather.location}'),
                Text('Temperature: ${weather.temperature.toString()}°C'),
                Text('Clouds: ${weather.clouds.toString()}%'),
                Text('Humidity: ${weather.humidity.toString()}%'),
                Text('Wind: ${weather.wind.toString()} m/s'),
              ],
            ),
          );
        }),
      );
  }
}
