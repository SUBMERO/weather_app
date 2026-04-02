import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitialState());

  getWeather({required String cityName}) async {
    try {
      WeatherModel weatherModel = await WeatherServices().getWeather(
        cityName: cityName,
      );

      emit(WeatherLoadedState(weatherModel: weatherModel));
    } catch (e) {
      emit(WeatherErrorState(errorMessage: e.toString()));
    }
  }
}
