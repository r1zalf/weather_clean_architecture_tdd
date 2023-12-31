import 'package:mockito/annotations.dart';
import 'package:weather_clean_architecture_tdd/data/data_source/weather_remote_data_source.dart';
import 'package:weather_clean_architecture_tdd/domain/repositories/weahter_repository.dart';
import 'package:http/http.dart' as http;
import 'package:weather_clean_architecture_tdd/domain/usecase/get_current_weather.dart';


@GenerateMocks(
  [
    WeahterRepository,
    WeatherRemoteDataSource,
    GetCurrentWeahterUseCase,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)]
)


void main() {
  
}