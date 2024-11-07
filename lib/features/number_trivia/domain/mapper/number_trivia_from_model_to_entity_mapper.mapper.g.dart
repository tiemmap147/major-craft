// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_trivia_from_model_to_entity_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

@LazySingleton(as: NumberTriviaFromModelToEntityMapper)
class NumberTriviaFromModelToEntityMapperImpl
    extends NumberTriviaFromModelToEntityMapper {
  NumberTriviaFromModelToEntityMapperImpl() : super();

  @override
  NumberTriviaEntity? fromModel(NumberTriviaModel? model) {
    if (model == null) {
      return null;
    }
    ;
    final numbertriviaentity = NumberTriviaEntity(
      text: model.text,
      number: model.number,
    );
    return numbertriviaentity;
  }
}
