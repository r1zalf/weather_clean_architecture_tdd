import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_clean_architecture_tdd/locator.dart';
import 'package:weather_clean_architecture_tdd/presentation/bloc/weather_bloc.dart';
import 'package:weather_clean_architecture_tdd/presentation/pages/weather_page.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<WeatherBloc>())
      ],
      child: MaterialApp(
        title: 'Weahter app',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black,),
          useMaterial3: true,
        ),
        home: const WeatherPage(),
      ),
    );
  }
}
