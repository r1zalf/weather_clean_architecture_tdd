import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_clean_architecture_tdd/domain/usecase/get_current_weather.dart';

import '../../helper/constant.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late GetCurrentWeahterUseCase getCurrentWeahterUseCase;
  late MockWeahterRepository mockWeahterRepository;

  setUp(() {
    mockWeahterRepository = MockWeahterRepository();
    getCurrentWeahterUseCase = GetCurrentWeahterUseCase(mockWeahterRepository);
  });

  test("should get current weather detail from the repository", () async {
    // arrange
    when(mockWeahterRepository.getCurrentWeather(ConstansTest.testCityName))
        .thenAnswer((_) async => const Right(ConstansTest.testWeatherDetail));

    // act
    final result =
        await getCurrentWeahterUseCase.execute(ConstansTest.testCityName);

    //assert
    expect(result, const Right(ConstansTest.testWeatherDetail));
  });
}
