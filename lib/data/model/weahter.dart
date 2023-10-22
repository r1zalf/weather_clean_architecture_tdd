import 'package:weather_clean_architecture_tdd/domain/entities/weahter.dart';

class WeahterModel extends WeatherEntity {
  const WeahterModel({
    required super.cityName,
    required super.main,
    required super.description,
    required super.iconCode,
    required super.temperature,
    required super.pressure,
    required super.humidity,
  });

  factory WeahterModel.fromJson(Map<String, dynamic> json) {
    return WeahterModel(
      cityName: json['name'],
      main: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      iconCode: json['weather'][0]['icon'],
      temperature: (json['main']['temp'] as num).toDouble(),
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
    );
  }

  Map<String, dynamic> toMap() => {
        'weather': [
          {
            'main': main,
            'description': description,
            'icon': iconCode,
          },
        ],
        'main': {
          'temp': temperature,
          'pressure': pressure,
          'humidity': humidity,
        },
        'name': cityName,
      };
}
