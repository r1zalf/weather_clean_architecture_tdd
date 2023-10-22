import 'package:get_it/get_it.dart';
import 'package:weather_clean_architecture_tdd/data/data_source/weather_remote_data_source.dart';
import 'package:weather_clean_architecture_tdd/data/repositories/weather_repository_impl.dart';
import 'package:weather_clean_architecture_tdd/domain/repositories/weahter_repository.dart';
import 'package:weather_clean_architecture_tdd/domain/usecase/get_current_weather.dart';
import 'package:weather_clean_architecture_tdd/presentation/bloc/weather_bloc.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

setupLocator() {
  //bloc
  locator.registerFactory(() => WeatherBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => GetCurrentWeahterUseCase(locator()));

  //reposity
  locator.registerLazySingleton<WeahterRepository>(
      () => WeahterRepositoryImpl(weatherRemoteDataSource: locator()));

  // datasource
  locator.registerLazySingleton<WeatherRemoteDataSource>(
      () => WeatherRemoteDataSourceImpl(client:  locator()));

  // external
  locator.registerLazySingleton(() => http.Client());
}
