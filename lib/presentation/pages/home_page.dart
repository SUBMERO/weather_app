import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/cubit/weather_cubit/weather_cubit.dart';
import 'package:weather_app/presentation/pages/search_page.dart';
import 'package:weather_app/presentation/widgets/custom_error_widget.dart';
import 'package:weather_app/presentation/widgets/home_widget.dart';
import 'package:weather_app/presentation/widgets/no_weather_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0A2D65), Color(0xFF0C42AB)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );
                },
                icon: Icon(
                  Icons.search_outlined,
                  weight: 80,
                  color: Colors.white,
                ),
              ),
            ),
          ],
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Weather App',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<WeatherCubit, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherInitialState) {
                    return NoWeatherWidget();
                  } else if (state is WeatherLoadedState) {
                    return HomeWidget(weatherModel: state.weatherModel);
                  } else {
                    return CustomErrorWidget();
                  }
                },
              ),
            ),
            Image.asset('assets/images/newlogo.png', width: 150),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
