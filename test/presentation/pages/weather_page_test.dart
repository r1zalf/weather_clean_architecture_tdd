import 'dart:io';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter/material.dart';
import 'package:weather_clean_architecture_tdd/presentation/bloc/weather_bloc.dart';
import 'package:weather_clean_architecture_tdd/presentation/pages/weather_page.dart';

import '../../helper/constant.dart';

class MockWeatherBloc extends MockBloc<WeatherEvent, WeatherState>
    implements WeatherBloc {}

void main() {
  late MockWeatherBloc mockWeatherBloc;

  setUp(() {
    mockWeatherBloc = MockWeatherBloc();
    HttpOverrides.global = null;
  });


  Widget akeTestableWidget(Widget body) {
    return BlocProvider<WeatherBloc>(
      create: (context) => mockWeatherBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
    "text field should trigger state to change from empty to loading",
    (widgetTester) async {
      //arrange
      when(() => mockWeatherBloc.state).thenReturn(WeatherEmpty());

      //act
      await widgetTester.pumpWidget(akeTestableWidget(const WeatherPage()));
      var textField = find.byType(TextField);
      await widgetTester.enterText(textField, ConstansTest.testCityName);
      await widgetTester.pump();

      //assert
      expect(find.text(ConstansTest.testCityName), findsOneWidget);
    },
  );

  testWidgets(
    "should show progress indicator when state is loading",
    (widgetTester) async {
      //arrange
      when(() => mockWeatherBloc.state).thenReturn(WeatherLoading());

      //act
      await widgetTester.pumpWidget(akeTestableWidget(const WeatherPage()));
      //assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    },
  );

  testWidgets(
    "should show widget contain weather data when state is weather loaded",
    (widgetTester) async {
      //arrange
      when(() => mockWeatherBloc.state)
          .thenReturn(const WeatherLoaded(ConstansTest.testWeatherDetail));

      //act
      await widgetTester.pumpWidget(akeTestableWidget(const WeatherPage()));
      await widgetTester.pumpAndSettle(const Duration(milliseconds: 500));

      //assert
      expect(find.byKey(const Key("weather_data")), findsOneWidget);
    },
  );
}
