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
        backgroundColor: const Color(0xFF1F1F41),
        appBar: AppBar(
          title: const Text('Current Temp'),
        ),
        body: Obx(() {
          final weather = weatherController.currentWeather.value;
          return Column(

            children: [
              Card(
                color: Colors.cyanAccent,
                child: Row (
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.location_on,color: Colors.white,),
                            Text(weather.location,style: const TextStyle(color: Colors.white), ),
                          ],
                        ),
                        Text('T°: ${weather.temperature.toString()}°C',style: const TextStyle(color: Colors.white),),
                        Text('Clouds: ${weather.clouds.toString()}%',style: const TextStyle(color: Colors.white),),
                        Text(weather.main,style: const TextStyle(color: Colors.white)),
                        Text('H%: ${weather.humidity.toString()}%',style: const TextStyle(color: Colors.white),),

                        Row(
                           children: [
                             const Icon(Icons.air,color: Colors.white,),
                             Text(' ${weather.wind.toString()} m/s',style: const TextStyle(color: Colors.white),),
                           ],
                         ),
                      ],
                    ),
                    Image.network('https://openweathermap.org/img/wn/${weather.icon}.png',width: 100,height: 100,fit: BoxFit.fill,),

                  ],
                ),

              ),


            ],
          );
        }),
      );
  }
}
