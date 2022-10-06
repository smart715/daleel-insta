// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'history_note_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HistoryNoteDto {
  int get id => throw _privateConstructorUsedError;
  int get customer_id => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoryNoteDtoCopyWith<HistoryNoteDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryNoteDtoCopyWith<$Res> {
  factory $HistoryNoteDtoCopyWith(
          HistoryNoteDto value, $Res Function(HistoryNoteDto) then) =
      _$HistoryNoteDtoCopyWithImpl<$Res>;
  $Res call({int id, int customer_id, String note, double amount});
}

/// @nodoc
class _$HistoryNoteDtoCopyWithImpl<$Res>
    implements $HistoryNoteDtoCopyWith<$Res> {
  _$HistoryNoteDtoCopyWithImpl(this._value, this._then);

  final HistoryNoteDto _value;
  // ignore: unused_field
  final $Res Function(HistoryNoteDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? customer_id = freezed,
    Object? note = freezed,
    Object? amount = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      customer_id: customer_id == freezed
          ? _value.customer_id
          : customer_id // ignore: cast_nullable_to_non_nullable
              as int,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_HistoryNoteDtoCopyWith<$Res>
    implements $HistoryNoteDtoCopyWith<$Res> {
  factory _$$_HistoryNoteDtoCopyWith(
          _$_HistoryNoteDto value, $Res Function(_$_HistoryNoteDto) then) =
      __$$_HistoryNoteDtoCopyWithImpl<$Res>;
  @override
  $Res call({int id, int customer_id, String note, double amount});
}

/// @nodoc
class __$$_HistoryNoteDtoCopyWithImpl<$Res>
    extends _$HistoryNoteDtoCopyWithImpl<$Res>
    implements _$$_HistoryNoteDtoCopyWith<$Res> {
  __$$_HistoryNoteDtoCopyWithImpl(
      _$_HistoryNoteDto _value, $Res Function(_$_HistoryNoteDto) _then)
      : super(_value, (v) => _then(v as _$_HistoryNoteDto));

  @override
  _$_HistoryNoteDto get _value => super._value as _$_HistoryNoteDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? customer_id = freezed,
    Object? note = freezed,
    Object? amount = freezed,
  }) {
    return _then(_$_HistoryNoteDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      customer_id: customer_id == freezed
          ? _value.customer_id
          : customer_id // ignore: cast_nullable_to_non_nullable
              as int,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_HistoryNoteDto extends _HistoryNoteDto {
  const _$_HistoryNoteDto(
      {required this.id,
      required this.customer_id,
      required this.note,
      required this.amount})
      : super._();

  @override
  final int id;
  @override
  final int customer_id;
  @override
  final String note;
  @override
  final double amount;

  @override
  String toString() {
    return 'HistoryNoteDto(id: $id, customer_id: $customer_id, note: $note, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoryNoteDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.customer_id, customer_id) &&
            const DeepCollectionEquality().equals(other.note, note) &&
            const DeepCollectionEquality().equals(other.amount, amount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(customer_id),
      const DeepCollectionEquality().hash(note),
      const DeepCollectionEquality().hash(amount));

  @JsonKey(ignore: true)
  @override
  _$$_HistoryNoteDtoCopyWith<_$_HistoryNoteDto> get copyWith =>
      __$$_HistoryNoteDtoCopyWithImpl<_$_HistoryNoteDto>(this, _$identity);
}

abstract class _HistoryNoteDto extends HistoryNoteDto {
  const factory _HistoryNoteDto(
      {required final int id,
      required final int customer_id,
      required final String note,
      required final double amount}) = _$_HistoryNoteDto;
  const _HistoryNoteDto._() : super._();

  @override
  int get id;
  @override
  int get customer_id;
  @override
  String get note;
  @override
  double get amount;
  @override
  @JsonKey(ignore: true)
  _$$_HistoryNoteDtoCopyWith<_$_HistoryNoteDto> get copyWith =>
      throw _privateConstructorUsedError;
}
