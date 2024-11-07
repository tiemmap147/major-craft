// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'number_trivia_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NumberTriviaModel _$NumberTriviaModelFromJson(Map<String, dynamic> json) {
  return _NumberTriviaModel.fromJson(json);
}

/// @nodoc
mixin _$NumberTriviaModel {
  String get text => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NumberTriviaModelCopyWith<NumberTriviaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumberTriviaModelCopyWith<$Res> {
  factory $NumberTriviaModelCopyWith(
          NumberTriviaModel value, $Res Function(NumberTriviaModel) then) =
      _$NumberTriviaModelCopyWithImpl<$Res, NumberTriviaModel>;
  @useResult
  $Res call({String text, int number});
}

/// @nodoc
class _$NumberTriviaModelCopyWithImpl<$Res, $Val extends NumberTriviaModel>
    implements $NumberTriviaModelCopyWith<$Res> {
  _$NumberTriviaModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_NumberTriviaModelCopyWith<$Res>
    implements $NumberTriviaModelCopyWith<$Res> {
  factory _$$_NumberTriviaModelCopyWith(_$_NumberTriviaModel value,
          $Res Function(_$_NumberTriviaModel) then) =
      __$$_NumberTriviaModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, int number});
}

/// @nodoc
class __$$_NumberTriviaModelCopyWithImpl<$Res>
    extends _$NumberTriviaModelCopyWithImpl<$Res, _$_NumberTriviaModel>
    implements _$$_NumberTriviaModelCopyWith<$Res> {
  __$$_NumberTriviaModelCopyWithImpl(
      _$_NumberTriviaModel _value, $Res Function(_$_NumberTriviaModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? number = null,
  }) {
    return _then(_$_NumberTriviaModel(
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
@JsonSerializable()
class _$_NumberTriviaModel implements _NumberTriviaModel {
  _$_NumberTriviaModel({required this.text, required this.number});

  factory _$_NumberTriviaModel.fromJson(Map<String, dynamic> json) =>
      _$$_NumberTriviaModelFromJson(json);

  @override
  final String text;
  @override
  final int number;

  @override
  String toString() {
    return 'NumberTriviaModel(text: $text, number: $number)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NumberTriviaModel &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.number, number) || other.number == number));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, number);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NumberTriviaModelCopyWith<_$_NumberTriviaModel> get copyWith =>
      __$$_NumberTriviaModelCopyWithImpl<_$_NumberTriviaModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NumberTriviaModelToJson(
      this,
    );
  }
}

abstract class _NumberTriviaModel implements NumberTriviaModel {
  factory _NumberTriviaModel(
      {required final String text,
      required final int number}) = _$_NumberTriviaModel;

  factory _NumberTriviaModel.fromJson(Map<String, dynamic> json) =
      _$_NumberTriviaModel.fromJson;

  @override
  String get text;
  @override
  int get number;
  @override
  @JsonKey(ignore: true)
  _$$_NumberTriviaModelCopyWith<_$_NumberTriviaModel> get copyWith =>
      throw _privateConstructorUsedError;
}
