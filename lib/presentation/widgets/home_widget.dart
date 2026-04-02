// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/presentation/helper/get_weather_image.dart';
import 'package:weather_app/presentation/widgets/text_widget.dart';

class HomeWidget extends StatelessWidget {
  final WeatherModel weatherModel;
  const HomeWidget({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextWidget(text: weatherModel.cityName, size: 32),
          TextWidget(
            text:
                'Updated at ${weatherModel.time.hour}:${weatherModel.time.minute}:${weatherModel.time.second}',
            size: 18,
          ),
          TextWidget(
            text:
                '${weatherModel.time.day}-${weatherModel.time.month}-${weatherModel.time.year}',
            size: 18,
          ),

          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Image.asset(
                  getWeatherImage(weatherModel.condition),
                  width: 100,
                ),
                Spacer(flex: 2),
                TextWidget(
                  text: weatherModel.temp.round().toString(),
                  size: 48,
                ),
                Spacer(flex: 2),
                Column(
                  children: [
                    Text(
                      'Max. T.: ${weatherModel.maxTemp.round()}',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    Text(
                      'Min. T.: ${weatherModel.minTemp.round()}',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
          const SizedBox(height: 50),
          TextWidget(text: weatherModel.condition.toString(), size: 32),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
