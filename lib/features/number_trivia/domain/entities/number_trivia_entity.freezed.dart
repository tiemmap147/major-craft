// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'number_trivia_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NumberTriviaEntity {
  String get text => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NumberTriviaEntityCopyWith<NumberTriviaEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumberTriviaEntityCopyWith<$Res> {
  factory $NumberTriviaEntityCopyWith(
          NumberTriviaEntity value, $Res Function(NumberTriviaEntity) then) =
      _$NumberTriviaEntityCopyWithImpl<$Res, NumberTriviaEntity>;
  @useResult
  $Res call({String text, int number});
}

/// @nodoc
class _$NumberTriviaEntityCopyWithImpl<$Res, $Val extends NumberTriviaEntity>
    implements $NumberTriviaEntityCopyWith<$Res> {
  _$NumberTriviaEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? number = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NumberTriviaEntityCopyWith<$Res>
    implements $NumberTriviaEntityCopyWith<$Res> {
  factory _$$_NumberTriviaEntityCopyWith(_$_NumberTriviaEntity value,
          $Res Function(_$_NumberTriviaEntity) then) =
      __$$_NumberTriviaEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, int number});
}

/// @nodoc
class __$$_NumberTriviaEntityCopyWithImpl<$Res>
    extends _$NumberTriviaEntityCopyWithImpl<$Res, _$_NumberTriviaEntity>
    implements _$$_NumberTriviaEntityCopyWith<$Res> {
  __$$_NumberTriviaEntityCopyWithImpl(
      _$_NumberTriviaEntity _value, $Res Function(_$_NumberTriviaEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? number = null,
  }) {
    return _then(_$_NumberTriviaEntity(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_NumberTriviaEntity extends _NumberTriviaEntity {
  _$_NumberTriviaEntity({required this.text, required this.number}) : super._();

  @override
  final String text;
  @override
  final int number;

  @override
  String toString() {
    return 'NumberTriviaEntity(text: $text, number: $number)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NumberTriviaEntity &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.number, number) || other.number == number));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text, number);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NumberTriviaEntityCopyWith<_$_NumberTriviaEntity> get copyWith =>
      __$$_NumberTriviaEntityCopyWithImpl<_$_NumberTriviaEntity>(
          this, _$identity);
}

abstract class _NumberTriviaEntity extends NumberTriviaEntity {
  factory _NumberTriviaEntity(
      {required final String text,
      required final int number}) = _$_NumberTriviaEntity;
  _NumberTriviaEntity._() : super._();

  @override
  String get text;
  @override
  int get number;
  @override
  @JsonKey(ignore: true)
  _$$_NumberTriviaEntityCopyWith<_$_NumberTriviaEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
