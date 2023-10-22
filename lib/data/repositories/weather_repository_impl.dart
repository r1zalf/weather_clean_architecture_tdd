import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:weather_clean_architecture_tdd/core/error/exception.dart';
import 'package:weather_clean_architecture_tdd/core/error/failure.dart';
import 'package:weather_clean_architecture_tdd/data/data_source/weather_remote_data_source.dart';
import 'package:weather_clean_architecture_tdd/domain/entities/weahter.dart';
import 'package:weather_clean_architecture_tdd/domain/repositories/weahter_repository.dart';

class WeahterRepositoryImpl implements WeahterRepository {
  final WeatherRemoteDataSource weatherRemoteDataSource;
  WeahterRepositoryImpl({required this.weatherRemoteDataSource});
  @override
  Future<Either<Failure, WeatherEntity>> getCurrentWeather(
      String cityName) async {
    try {
      final result = await weatherRemoteDataSource.getCurrentWeather(cityName);
      return right(result);
    } on ServerException {
      return left(const ServerFailure("An error has occurred"));
    } on SocketException {
      return left(const ConnectionFailure("Failed to connect to the network"));
    }
  }
}
