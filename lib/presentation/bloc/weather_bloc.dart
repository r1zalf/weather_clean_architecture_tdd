import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

import 'package:weather_clean_architecture_tdd/domain/entities/weahter.dart';
import 'package:weather_clean_architecture_tdd/domain/usecase/get_current_weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetCurrentWeahterUseCase _getCurrentWeahterUseCase;
  WeatherBloc(this._getCurrentWeahterUseCase) : super(WeatherEmpty()) {
    on<OnCityChanged>(
      (event, emit) async {
       emit(WeatherLoading());

        var result = await _getCurrentWeahterUseCase.execute(event.cityName);

        result.fold(
          (l) => emit(WeatherFailure(l.message)),
          (weatherEntity) => emit(WeatherLoaded(weatherEntity)),
        );
      },
      transformer: (events, mapper) {
        return events.debounceTime(const Duration(milliseconds: 500)).flatMap(mapper);
      },
    );
  }
}
