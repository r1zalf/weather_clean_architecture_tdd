import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_clean_architecture_tdd/data/model/weahter.dart';
import 'package:weather_clean_architecture_tdd/domain/entities/weahter.dart';

import '../../helper/constant.dart';
import '../../helper/json_reader.dart';

void main() {
  
  test("should be a subclass of weather entity", () {
    expect(ConstansTest.testWeatherDetailModel, isA<WeatherEntity>());
  });

  test("should return a valid model from json", () {
    //arrange
    final Map<String, dynamic> jsonMap =
        json.decode(readJson("helper/dummy/dummy_weather_response.json"));

    // act
    final result = WeahterModel.fromJson(jsonMap);

    //assert
    expect(result, ConstansTest.testWeatherDetailModel);
  });

  test('should return a json map containing proper data', () {
    //act
    final result = ConstansTest.testWeatherDetailModel.toMap();

    final expectedMap = {
      'weather': [
        {
          'main': 'Clear',
          'description': 'clear sky',
          'icon': '01n',
        }
      ],
      'main': {
        'temp': 292.87,
        'pressure': 1012,
        'humidity': 70,
      },
      'name': 'New York',
    };

    expect(result, expectedMap);
  });
}
