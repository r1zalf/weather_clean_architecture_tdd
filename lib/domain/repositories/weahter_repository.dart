import 'package:weather_clean_architecture_tdd/core/error/failure.dart';
import 'package:weather_clean_architecture_tdd/domain/entities/weahter.dart';
import 'package:dartz/dartz.dart';

abstract class WeahterRepository {
  Future<Either<Failure, WeatherEntity>> getCurrentWeather(String cityName);
}
