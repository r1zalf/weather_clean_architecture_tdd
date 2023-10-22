// Mocks generated by Mockito 5.4.2 from annotations
// in weather_clean_architecture_tdd/test/helper/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:convert' as _i11;
import 'dart:typed_data' as _i12;

import 'package:dartz/dartz.dart' as _i2;
import 'package:http/http.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:weather_clean_architecture_tdd/core/error/failure.dart' as _i7;
import 'package:weather_clean_architecture_tdd/data/data_source/weather_remote_data_source.dart'
    as _i9;
import 'package:weather_clean_architecture_tdd/data/model/weahter.dart' as _i3;
import 'package:weather_clean_architecture_tdd/domain/entities/weahter.dart'
    as _i8;
import 'package:weather_clean_architecture_tdd/domain/repositories/weahter_repository.dart'
    as _i4;
import 'package:weather_clean_architecture_tdd/domain/usecase/get_current_weather.dart'
    as _i10;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWeahterModel_1 extends _i1.SmartFake implements _i3.WeahterModel {
  _FakeWeahterModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWeahterRepository_2 extends _i1.SmartFake
    implements _i4.WeahterRepository {
  _FakeWeahterRepository_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_3 extends _i1.SmartFake implements _i5.Response {
  _FakeResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_4 extends _i1.SmartFake
    implements _i5.StreamedResponse {
  _FakeStreamedResponse_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [WeahterRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeahterRepository extends _i1.Mock implements _i4.WeahterRepository {
  MockWeahterRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, _i8.WeatherEntity>> getCurrentWeather(
          String? cityName) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCurrentWeather,
          [cityName],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, _i8.WeatherEntity>>.value(
                _FakeEither_0<_i7.Failure, _i8.WeatherEntity>(
          this,
          Invocation.method(
            #getCurrentWeather,
            [cityName],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i8.WeatherEntity>>);
}

/// A class which mocks [WeatherRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherRemoteDataSource extends _i1.Mock
    implements _i9.WeatherRemoteDataSource {
  MockWeatherRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i3.WeahterModel> getCurrentWeather(String? cityName) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCurrentWeather,
          [cityName],
        ),
        returnValue: _i6.Future<_i3.WeahterModel>.value(_FakeWeahterModel_1(
          this,
          Invocation.method(
            #getCurrentWeather,
            [cityName],
          ),
        )),
      ) as _i6.Future<_i3.WeahterModel>);
}

/// A class which mocks [GetCurrentWeahterUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetCurrentWeahterUseCase extends _i1.Mock
    implements _i10.GetCurrentWeahterUseCase {
  MockGetCurrentWeahterUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.WeahterRepository get weahterRepository => (super.noSuchMethod(
        Invocation.getter(#weahterRepository),
        returnValue: _FakeWeahterRepository_2(
          this,
          Invocation.getter(#weahterRepository),
        ),
      ) as _i4.WeahterRepository);

  @override
  _i6.Future<_i2.Either<_i7.Failure, _i8.WeatherEntity>> execute(
          String? cityName) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [cityName],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, _i8.WeatherEntity>>.value(
                _FakeEither_0<_i7.Failure, _i8.WeatherEntity>(
          this,
          Invocation.method(
            #execute,
            [cityName],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i8.WeatherEntity>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i5.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i5.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<_i5.Response>);

  @override
  _i6.Future<_i5.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<_i5.Response>);

  @override
  _i6.Future<_i5.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i11.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i5.Response>);

  @override
  _i6.Future<_i5.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i11.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i5.Response>);

  @override
  _i6.Future<_i5.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i11.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i5.Response>);

  @override
  _i6.Future<_i5.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i11.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i5.Response>);

  @override
  _i6.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);

  @override
  _i6.Future<_i12.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i12.Uint8List>.value(_i12.Uint8List(0)),
      ) as _i6.Future<_i12.Uint8List>);

  @override
  _i6.Future<_i5.StreamedResponse> send(_i5.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i6.Future<_i5.StreamedResponse>.value(_FakeStreamedResponse_4(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i6.Future<_i5.StreamedResponse>);

  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
