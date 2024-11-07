import 'package:injectable/injectable.dart';
import 'package:major_craft_application/core/usecase/usecase.dart';
import 'package:major_craft_application/features/home/domain/repositories/recent_search_repository.dart';

@lazySingleton
class GetRecentSearchUsecase extends UseCase<List<String>, GetRecentSearchParams> {
  GetRecentSearchUsecase(this._numberTriviaRepository);

  final RecentSearchRepository _numberTriviaRepository;

  @override
  Future<List<String>> call(GetRecentSearchParams param) async {
    final List<String> repo = await _numberTriviaRepository.getRecentSearches(
      param.keyword,
    );

    return repo;
  }
}

class GetRecentSearchParams {
  GetRecentSearchParams(this.keyword);
  final String keyword;
}
