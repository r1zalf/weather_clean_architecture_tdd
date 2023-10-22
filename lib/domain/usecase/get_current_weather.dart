import 'package:dartz/dartz.dart';
import 'package:weather_clean_architecture_tdd/core/error/failure.dart';
import 'package:weather_clean_architecture_tdd/domain/entities/weahter.dart';
import 'package:weather_clean_architecture_tdd/domain/repositories/weahter_repository.dart';

class GetCurrentWeahterUseCase {
  final WeahterRepository weahterRepository;

  GetCurrentWeahterUseCase(this.weahterRepository);

 Future<Either<Failure, WeatherEntity>> execute(String cityName) {
    return weahterRepository.getCurrentWeather(cityName);
  }
}