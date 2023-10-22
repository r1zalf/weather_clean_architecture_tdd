import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_clean_architecture_tdd/core/constants.dart';
import 'package:weather_clean_architecture_tdd/core/error/exception.dart';
import 'package:weather_clean_architecture_tdd/data/data_source/weather_remote_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:weather_clean_architecture_tdd/data/model/weahter.dart';
import '../../helper/constant.dart';
import '../../helper/json_reader.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late WeatherRemoteDataSourceImpl weatherRemoteDataSourceImpl;

  group("get current weather", () {

    setUp(() {
      mockHttpClient = MockHttpClient();
      weatherRemoteDataSourceImpl =
          WeatherRemoteDataSourceImpl(client: mockHttpClient);
    });

    test('should return weather model when the response code is 200', () async {
      //arrange
      when(mockHttpClient.get(Urls.currentWeatherByName(ConstansTest.testCityName)))
          .thenAnswer((_) async => http.Response(
              readJson('helper/dummy/dummy_weather_response.json'), 200));

      // act
      final result =
          await weatherRemoteDataSourceImpl.getCurrentWeather(ConstansTest.testCityName);

      //assert
      expect(result, isA<WeahterModel>());
    });

    test(
        'should throw a server exception when the response code is 404 or other',
        () async {
      //arrange
      when(mockHttpClient.get(Urls.currentWeatherByName(ConstansTest.testCityName)))
          .thenAnswer((_) async => http.Response("not found", 404));

      // act
      final result =
          weatherRemoteDataSourceImpl.getCurrentWeather(ConstansTest.testCityName);

      //assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });
}
