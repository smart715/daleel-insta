// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'history_note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HistoryNote {
  int get id => throw _privateConstructorUsedError;
  int get customer_id => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoryNoteCopyWith<HistoryNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryNoteCopyWith<$Res> {
  factory $HistoryNoteCopyWith(
          HistoryNote value, $Res Function(HistoryNote) then) =
      _$HistoryNoteCopyWithImpl<$Res>;
  $Res call({int id, int customer_id, String note, double amount});
}

/// @nodoc
class _$HistoryNoteCopyWithImpl<$Res> implements $HistoryNoteCopyWith<$Res> {
  _$HistoryNoteCopyWithImpl(this._value, this._then);

  final HistoryNote _value;
  // ignore: unused_field
  final $Res Function(HistoryNote) _then;

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
abstract class _$$_HistoryNoteCopyWith<$Res>
    implements $HistoryNoteCopyWith<$Res> {
  factory _$$_HistoryNoteCopyWith(
          _$_HistoryNote value, $Res Function(_$_HistoryNote) then) =
      __$$_HistoryNoteCopyWithImpl<$Res>;
  @override
  $Res call({int id, int customer_id, String note, double amount});
}

/// @nodoc
class __$$_HistoryNoteCopyWithImpl<$Res> extends _$HistoryNoteCopyWithImpl<$Res>
    implements _$$_HistoryNoteCopyWith<$Res> {
  __$$_HistoryNoteCopyWithImpl(
      _$_HistoryNote _value, $Res Function(_$_HistoryNote) _then)
      : super(_value, (v) => _then(v as _$_HistoryNote));

  @override
  _$_HistoryNote get _value => super._value as _$_HistoryNote;

  @override
  $Res call({
    Object? id = freezed,
    Object? customer_id = freezed,
    Object? note = freezed,
    Object? amount = freezed,
  }) {
    return _then(_$_HistoryNote(
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

class _$_HistoryNote extends _HistoryNote {
  const _$_HistoryNote(
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
    return 'HistoryNote(id: $id, customer_id: $customer_id, note: $note, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoryNote &&
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
  _$$_HistoryNoteCopyWith<_$_HistoryNote> get copyWith =>
      __$$_HistoryNoteCopyWithImpl<_$_HistoryNote>(this, _$identity);
}

abstract class _HistoryNote extends HistoryNote {
  const factory _HistoryNote(
      {required final int id,
      required final int customer_id,
      required final String note,
      required final double amount}) = _$_HistoryNote;
  const _HistoryNote._() : super._();

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
  _$$_HistoryNoteCopyWith<_$_HistoryNote> get copyWith =>
      throw _privateConstructorUsedError;
}
