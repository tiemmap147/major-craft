// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/io_client.dart' as _i8;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i10;
import 'package:major_craft_application/core/http_client/app_http_client.dart'
    as _i26;
import 'package:major_craft_application/core/http_client/app_http_client_module.dart'
    as _i34;
import 'package:major_craft_application/core/http_client/dio_provider.dart'
    as _i16;
import 'package:major_craft_application/core/logging/app_logger.dart' as _i14;
import 'package:major_craft_application/core/logging/app_logger_module.dart'
    as _i35;
import 'package:major_craft_application/core/storage/app_storage.dart' as _i15;
import 'package:major_craft_application/core/storage/app_storage_module.dart'
    as _i33;
import 'package:major_craft_application/core/utils/delay_provider.dart' as _i5;
import 'package:major_craft_application/core/utils/json_converter.dart' as _i9;
import 'package:major_craft_application/features/home/data/datasources/recent_search_local_data_source.dart'
    as _i22;
import 'package:major_craft_application/features/home/data/repositories/recent_search_repository_impl.dart'
    as _i24;
import 'package:major_craft_application/features/home/domain/repositories/recent_search_repository.dart'
    as _i23;
import 'package:major_craft_application/features/home/domain/usecases/add_recent_search_usecase.dart'
    as _i25;
import 'package:major_craft_application/features/home/domain/usecases/get_recent_search_usecase.dart'
    as _i29;
import 'package:major_craft_application/features/home/presentation/bloc/home_bloc.dart'
    as _i30;
import 'package:major_craft_application/features/number_trivia/data/datasources/fake/number_trivia_fake.dart'
    as _i12;
import 'package:major_craft_application/features/number_trivia/data/datasources/number_trivia_local_data_source.dart'
    as _i18;
import 'package:major_craft_application/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart'
    as _i19;
import 'package:major_craft_application/features/number_trivia/data/repositories/number_trivia_repository_impl.dart'
    as _i21;
import 'package:major_craft_application/features/number_trivia/domain/mapper/number_trivia_from_model_to_entity_mapper.dart'
    as _i13;
import 'package:major_craft_application/features/number_trivia/domain/repositories/number_trivia_repository.dart'
    as _i20;
import 'package:major_craft_application/features/number_trivia/domain/usecases/get_concrete_number_trivia_usecase.dart'
    as _i27;
import 'package:major_craft_application/features/number_trivia/domain/usecases/get_random_number_trivia_usecase.dart'
    as _i28;
import 'package:major_craft_application/features/number_trivia/presentation/bloc/number_trivia_bloc.dart'
    as _i31;
import 'package:major_craft_application/service/connectivity_checker.dart'
    as _i4;
import 'package:major_craft_application/service/dialog_service.dart' as _i6;
import 'package:major_craft_application/service/navigation_logger.dart' as _i17;
import 'package:major_craft_application/service/navigation_service.dart'
    as _i11;
import 'package:major_craft_application/service/platform_module.dart' as _i32;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final platformModule = _$PlatformModule();
  final appStorageModule = _$AppStorageModule();
  final appHttpClientModule = _$AppHttpClientModule();
  final appLoggerModule = _$AppLoggerModule();
  gh.lazySingleton<_i3.Connectivity>(() => platformModule.getConnected());
  gh.lazySingleton<_i4.ConnectivityChecker>(
    () => _i4.ConnectivityCheckerImpl(gh<_i3.Connectivity>()),
    dispose: (i) => i.dispose(),
  );
  gh.lazySingleton<_i5.DelayProvider>(() => _i5.DelayProviderImpl());
  gh.lazySingleton<_i6.DialogService>(() => _i6.DialogServiceImpl());
  gh.lazySingleton<_i7.FlutterSecureStorage>(
      () => appStorageModule.setupSecureStorage());
  gh.lazySingleton<_i8.IOClient>(() => appHttpClientModule.ioClient);
  gh.lazySingleton<_i9.JsonConverter>(() => _i9.JsonConverterImpl());
  gh.lazySingleton<_i10.Logger>(() => appLoggerModule.setupLogger());
  gh.lazySingleton<_i11.NavigationService>(() => _i11.NavigationServiceImpl());
  gh.lazySingleton<_i12.NumberTriviaFake>(() => _i12.NumberTriviaFakeImpl());
  gh.lazySingleton<_i13.NumberTriviaFromModelToEntityMapper>(
      () => _i13.NumberTriviaFromModelToEntityMapperImpl());
  gh.factory<_i14.AppLogger>(() => _i14.AppLoggerImpl(gh<_i10.Logger>()));
  gh.factory<_i15.AppStorage>(() => _i15.AppStorageImpl(
        gh<_i7.FlutterSecureStorage>(),
        gh<_i14.AppLogger>(),
      ));
  gh.factory<_i16.DioProvider>(
      () => _i16.DioProviderImpl(gh<_i14.AppLogger>()));
  gh.lazySingleton<_i17.NavigationLogger>(
      () => _i17.NavigationLoggerImpl(gh<_i14.AppLogger>()));
  gh.lazySingleton<_i18.NumberTriviaLocalDataSource>(
      () => _i18.NumberTriviaLocalDataSourceImpl(
            gh<_i9.JsonConverter>(),
            gh<_i15.AppStorage>(),
          ));
  gh.lazySingleton<_i19.NumberTriviaRemoteDataSource>(
      () => _i19.NumberTriviaRemoteDataSourceImpl(gh<_i16.DioProvider>()));
  gh.lazySingleton<_i20.NumberTriviaRepository>(
      () => _i21.NumberTriviaRepositoryImpl(
            gh<_i19.NumberTriviaRemoteDataSource>(),
            gh<_i13.NumberTriviaFromModelToEntityMapper>(),
          ));
  gh.lazySingleton<_i22.RecentSearchLocalDataSource>(
      () => _i22.RecentSearchLocalDataSourceImpl(gh<_i15.AppStorage>()));
  gh.lazySingleton<_i23.RecentSearchRepository>(() =>
      _i24.RecentSearchRepositoryImpl(gh<_i22.RecentSearchLocalDataSource>()));
  gh.lazySingleton<_i25.AddRecentSearchUsecase>(
      () => _i25.AddRecentSearchUsecase(gh<_i23.RecentSearchRepository>()));
  gh.factory<_i26.AppHttpClient>(() => _i26.AppHttpClientImpl(
        gh<_i8.IOClient>(),
        gh<_i14.AppLogger>(),
      ));
  gh.lazySingleton<_i27.GetConcreteNumberTriviaUsecase>(() =>
      _i27.GetConcreteNumberTriviaUsecase(gh<_i20.NumberTriviaRepository>()));
  gh.lazySingleton<_i28.GetRandomNumberTriviaUsecase>(() =>
      _i28.GetRandomNumberTriviaUsecase(gh<_i20.NumberTriviaRepository>()));
  gh.lazySingleton<_i29.GetRecentSearchUsecase>(
      () => _i29.GetRecentSearchUsecase(gh<_i23.RecentSearchRepository>()));
  gh.factory<_i30.HomeBloc>(() => _i30.HomeBloc(
        gh<_i29.GetRecentSearchUsecase>(),
        gh<_i25.AddRecentSearchUsecase>(),
      ));
  gh.factory<_i31.NumberTriviaBloc>(() => _i31.NumberTriviaBloc(
        gh<_i27.GetConcreteNumberTriviaUsecase>(),
        gh<_i28.GetRandomNumberTriviaUsecase>(),
      ));
  return getIt;
}

class _$PlatformModule extends _i32.PlatformModule {}

class _$AppStorageModule extends _i33.AppStorageModule {}

class _$AppHttpClientModule extends _i34.AppHttpClientModule {}

class _$AppLoggerModule extends _i35.AppLoggerModule {}
