import 'package:weather_clean_architecture_tdd/data/model/weahter.dart';
import 'package:weather_clean_architecture_tdd/domain/entities/weahter.dart';

class ConstansTest {
  static const testCityName = "New Yowk";
  static const testWeatherDetail = WeatherEntity(
    cityName: "New York",
    main: "Clouds",
    description: "few clouds",
    iconCode: "02d",
    temperature: 302.28,
    pressure: 1009,
    humidity: 70,
  );

static const testWeatherDetailModel = WeahterModel(
    cityName: 'New York',
    main: 'Clear',
    description: 'clear sky',
    iconCode: '01n',
    temperature: 292.87,
    pressure: 1012,
    humidity: 70,
  );
}
