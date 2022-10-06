// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_note_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryNoteDto _$HistoryNoteDtoFromJson(Map<String, dynamic> json) =>
    HistoryNoteDto(
      id: json['id'] as int,
      customer_id: json['customer_id'] as int,
      note: json['note'] as String,
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$HistoryNoteDtoToJson(HistoryNoteDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer_id': instance.customer_id,
      'note': instance.note,
      'amount': instance.amount,
    };
