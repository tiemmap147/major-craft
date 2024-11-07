import 'package:injectable/injectable.dart';
import 'package:major_craft_application/features/home/data/datasources/recent_search_local_data_source.dart';
import 'package:major_craft_application/features/home/domain/repositories/recent_search_repository.dart';

@LazySingleton(as: RecentSearchRepository)
class RecentSearchRepositoryImpl extends RecentSearchRepository {
  RecentSearchRepositoryImpl(
    this._recentSearchLocalDataSource,
  );
  final RecentSearchLocalDataSource _recentSearchLocalDataSource;

  @override
  Future<List<String>> getRecentSearches(
    String keyword,
  ) async {
    try {
      final List<String> models = await _recentSearchLocalDataSource.getRecentSearches(
        keyword,
      );

      return models;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> addRecentSearches(String keyword) async {
    try {
      await _recentSearchLocalDataSource.writeRecentSearch(keyword);
    } catch (error) {
      rethrow;
    }
  }
}
