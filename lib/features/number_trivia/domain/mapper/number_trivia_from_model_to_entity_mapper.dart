import 'package:major_craft_application/core/data/domain_mapper.dart';
import 'package:major_craft_application/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:major_craft_application/features/number_trivia/domain/entities/number_trivia_entity.dart';

part 'number_trivia_from_model_to_entity_mapper.mapper.g.dart';

@Mapper(useInjection: true)
abstract class NumberTriviaFromModelToEntityMapper
    extends EntityFromModelMapper<NumberTriviaEntity, NumberTriviaModel> {}
