import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/cubit/weather_cubit/weather_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

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
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Search City',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: TextField(
                    onSubmitted: (value) {
                      var weatherCubit = BlocProvider.of<WeatherCubit>(context);
                      weatherCubit.getWeather(cityName: value);
                      Navigator.pop(context);
                    },
                    style: TextStyle(fontSize: 24, color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 24,
                      ),
                      labelText: 'City name',
                      labelStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.lightBlueAccent,
                      ),
                      suffixIcon: Icon(Icons.search, color: Colors.white),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
              Image.asset('assets/images/newlogo.png', width: 150),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
