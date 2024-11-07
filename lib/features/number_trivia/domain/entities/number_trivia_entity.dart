import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:major_craft_application/core/data/domain_entity.dart';

part 'number_trivia_entity.freezed.dart';

@freezed
class NumberTriviaEntity with _$NumberTriviaEntity implements DomainEntity {
  factory NumberTriviaEntity({
    required String text,
    required int number,
  }) = _NumberTriviaEntity;

  NumberTriviaEntity._();
}
