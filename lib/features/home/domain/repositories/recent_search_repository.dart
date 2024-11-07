abstract class RecentSearchRepository {
  Future<List<String>> getRecentSearches(String keyword);
  Future<void> addRecentSearches(String keyword);
}
