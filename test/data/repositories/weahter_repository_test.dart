import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_clean_architecture_tdd/core/error/exception.dart';
import 'package:weather_clean_architecture_tdd/core/error/failure.dart';
import 'package:weather_clean_architecture_tdd/data/repositories/weather_repository_impl.dart';

import '../../helper/constant.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  group("get current weather", () {
    late MockWeatherRemoteDataSource mockWeatherRemoteDataSource;
    late WeahterRepositoryImpl weahterRepositoryImpl;

    setUp(() {
      mockWeatherRemoteDataSource = MockWeatherRemoteDataSource();
      weahterRepositoryImpl = WeahterRepositoryImpl(
          weatherRemoteDataSource: mockWeatherRemoteDataSource);
    });

    test(
        "should return current weather when a call to data source is successful",
        () async {
      //arrange
      when(mockWeatherRemoteDataSource.getCurrentWeather(ConstansTest.testCityName))
          .thenAnswer((_) async => ConstansTest.testWeatherDetailModel);
      //act
      final result = await weahterRepositoryImpl.getCurrentWeather(ConstansTest.testCityName);

      //assert
      expect(result, right(ConstansTest.testWeatherDetailModel));
    });

    test(
        "should return server failure when a call to data source is unsuccessful",
        () async {
      //arrange
      when(mockWeatherRemoteDataSource.getCurrentWeather(ConstansTest.testCityName))
          .thenThrow(ServerException());
      //act
      final result = await weahterRepositoryImpl.getCurrentWeather(ConstansTest.testCityName);

      //assert
      expect(result, left(const ServerFailure('An error has occurred')));
    });

    test(
        "should return connection failure when the device has no internet",
        () async {
      //arrange
      when(mockWeatherRemoteDataSource.getCurrentWeather(ConstansTest.testCityName))
          .thenThrow(const SocketException("Failed to connect to the network"));
      //act
      final result = await weahterRepositoryImpl.getCurrentWeather(ConstansTest.testCityName);

      //assert
      expect(result, left(const ConnectionFailure('Failed to connect to the network')));
    });
  });
}
