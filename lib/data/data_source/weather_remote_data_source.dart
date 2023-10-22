import 'dart:convert';

import 'package:weather_clean_architecture_tdd/core/constants.dart';
import 'package:weather_clean_architecture_tdd/core/error/exception.dart';
import 'package:weather_clean_architecture_tdd/data/model/weahter.dart';
import 'package:http/http.dart' as http;

abstract class WeatherRemoteDataSource {
  Future<WeahterModel> getCurrentWeather(String cityName);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  WeatherRemoteDataSourceImpl({required this.client});

  final http.Client client;

  @override
  Future<WeahterModel> getCurrentWeather(String cityName) async {
    final response = await client.get(Urls.currentWeatherByName(cityName));

    if (response.statusCode == 200) {
      return WeahterModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
