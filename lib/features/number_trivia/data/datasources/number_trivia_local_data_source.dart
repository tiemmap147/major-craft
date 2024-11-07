import 'package:injectable/injectable.dart';
import 'package:major_craft_application/core/exception/api_exception.dart';
import 'package:major_craft_application/core/storage/app_storage.dart';
import 'package:major_craft_application/core/utils/json_converter.dart';
import 'package:major_craft_application/features/number_trivia/data/models/number_trivia_model.dart';

abstract class NumberTriviaLocalDataSource {
  /// Gets the cached [NumberTriviaModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<NumberTriviaModel> getLastNumberTrivia();

  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}

const String cachedNumberTrivia = 'CACHED_NUMBER_TRIVIA';

@LazySingleton(as: NumberTriviaLocalDataSource)
class NumberTriviaLocalDataSourceImpl implements NumberTriviaLocalDataSource {
  NumberTriviaLocalDataSourceImpl(
    this._jsonConverter,
    this._appStorage,
  );
  final JsonConverter _jsonConverter;
  final AppStorage _appStorage;

  @override
  Future<NumberTriviaModel> getLastNumberTrivia() async {
    final jsonString = await _appStorage.readValue(key: cachedNumberTrivia);
    if (jsonString != null) {
      return Future.value(_jsonConverter.decodeToObject(jsonString, converter: NumberTriviaModel.fromJson));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache) async {
    await _appStorage.writeValue(key: cachedNumberTrivia, value: _jsonConverter.encode(triviaToCache.toJson()));
  }
}
