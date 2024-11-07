import 'package:injectable/injectable.dart';
import 'package:major_craft_application/features/number_trivia/domain/entities/number_trivia_entity.dart';

abstract class NumberTriviaFake {
  Future<NumberTriviaEntity> getConcreteNumberTrivia(int number);
  Future<NumberTriviaEntity> getRandomNumberTrivia();
}

@LazySingleton(as: NumberTriviaFake)
class NumberTriviaFakeImpl implements NumberTriviaFake {
  @override
  Future<NumberTriviaEntity> getConcreteNumberTrivia(int number) {
    throw UnimplementedError();
  }

  @override
  Future<NumberTriviaEntity> getRandomNumberTrivia() {
    throw UnimplementedError();
  }
}
