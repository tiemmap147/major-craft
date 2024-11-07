import 'package:injectable/injectable.dart';
import 'package:major_craft_application/core/usecase/usecase.dart';
import 'package:major_craft_application/features/number_trivia/domain/entities/number_trivia_entity.dart';
import 'package:major_craft_application/features/number_trivia/domain/repositories/number_trivia_repository.dart';

@lazySingleton
class GetConcreteNumberTriviaUsecase extends UseCase<NumberTriviaEntity, ConcreteNumberTriviaParams> {
  GetConcreteNumberTriviaUsecase(this._numberTriviaRepository);

  final NumberTriviaRepository _numberTriviaRepository;

  @override
  Future<NumberTriviaEntity> call(ConcreteNumberTriviaParams param) async {
    final NumberTriviaEntity repo = await _numberTriviaRepository.getConcreteNumberTrivia(param.number);

    return repo;
  }
}

class ConcreteNumberTriviaParams {
  ConcreteNumberTriviaParams(this.number);
  final String number;
}
