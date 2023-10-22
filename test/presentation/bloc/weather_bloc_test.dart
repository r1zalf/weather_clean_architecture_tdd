import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_clean_architecture_tdd/core/error/failure.dart';
import 'package:weather_clean_architecture_tdd/presentation/bloc/weather_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import '../../helper/constant.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late MockGetCurrentWeahterUseCase mockGetCurrentWeahterUseCase;
  late WeatherBloc weatherBloc;

  setUp(() {
    mockGetCurrentWeahterUseCase = MockGetCurrentWeahterUseCase();
    weatherBloc = WeatherBloc(mockGetCurrentWeahterUseCase);
  });

  test('initial state should be empty', () {
    expect(weatherBloc.state, WeatherEmpty());
  });

  blocTest<WeatherBloc, WeatherState>(
    'should emit [WeatherLoading, WeatherLoaded] when data is gotten successfully',
    build: () {
      when(mockGetCurrentWeahterUseCase.execute(ConstansTest.testCityName))
          .thenAnswer((_) async => const Right(ConstansTest.testWeatherDetail));

      return weatherBloc;
    },
    act: (bloc) => bloc.add(const OnCityChanged(ConstansTest.testCityName)),
    wait: const Duration(milliseconds: 500),
    expect: () => <WeatherState>[
      WeatherLoading(),
      const WeatherLoaded(ConstansTest.testWeatherDetail),
    ],
  );

  blocTest<WeatherBloc, WeatherState>(
    'should emit [WeatherLoading, WeatherLoadFailure] when get data is unsuccessful',
    build: () {
      when(mockGetCurrentWeahterUseCase.execute(ConstansTest.testCityName))
          .thenAnswer((_) async => const Left(ServerFailure('Server failure')));

      return weatherBloc;
    },
    act: (bloc) => bloc.add(const OnCityChanged(ConstansTest.testCityName)),
    wait: const Duration(milliseconds: 500),
    expect: () => <WeatherState>[
      WeatherLoading(),
      const WeatherFailure('Server failure'),
    ],
  );
}
