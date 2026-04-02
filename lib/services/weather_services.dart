import 'package:dio/dio.dart';
import 'package:weather_app/data/models/weather_model.dart';

class WeatherServices {
  final Dio dio = Dio();
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'c422211d88b84d70aae220251262403';

  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName',
      );
      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ??
          'oops, there was an error, try again later';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('Unexpected error occurred');
    }
  }
}
