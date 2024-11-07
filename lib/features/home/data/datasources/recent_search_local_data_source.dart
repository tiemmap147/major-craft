import 'package:injectable/injectable.dart';
import 'package:major_craft_application/core/exception/api_exception.dart';
import 'package:major_craft_application/core/storage/app_storage.dart';

abstract class RecentSearchLocalDataSource {
  /// Gets the cached [String] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<List<String>> getRecentSearches(String keyword);
  Future<void> writeRecentSearch(String keyword);
}

const String cachedRecentSearches = 'RECENT_SEARCHES';

@LazySingleton(as: RecentSearchLocalDataSource)
class RecentSearchLocalDataSourceImpl implements RecentSearchLocalDataSource {
  RecentSearchLocalDataSourceImpl(
    // this._jsonConverter,
    this._appStorage,
  );
  // final JsonConverter _jsonConverter;
  final AppStorage _appStorage;

  @override
  Future<List<String>> getRecentSearches(
    String keyword,
  ) async {
    final jsonString = await _appStorage.readRecentSearches(
      key: cachedRecentSearches,
      keyword: keyword,
    );
    if (jsonString.isEmpty) {
      return [];
    }

    return Future.value(List<String>.of(jsonString));
  }

  @override
  Future<void> writeRecentSearch(
    String keyword,
  ) async {
    await _appStorage.writeRecentSearch(keyword: keyword);
  }
}
