import 'package:injectable/injectable.dart';
import 'package:major_craft_application/core/usecase/usecase.dart';
import 'package:major_craft_application/features/home/domain/repositories/recent_search_repository.dart';

@lazySingleton
class AddRecentSearchUsecase extends UseCase<void, AddRecentSearchParams> {
  AddRecentSearchUsecase(this._recentSearchRepository);

  final RecentSearchRepository _recentSearchRepository;

  @override
  Future<void> call(AddRecentSearchParams param) async {
    await _recentSearchRepository.addRecentSearches(
      param.keyword,
    );
  }
}

class AddRecentSearchParams {
  AddRecentSearchParams(this.keyword);
  final String keyword;
}
