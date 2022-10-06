import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insta_daleel/domain/entities/history_note.dart';

part 'history_note_dto.freezed.dart';
part 'history_note_dto.g.dart';

@freezed
@JsonSerializable(
    explicitToJson: true, createFactory: true, includeIfNull: false)
class HistoryNoteDto with _$HistoryNoteDto {
  const HistoryNoteDto._();
  const factory HistoryNoteDto({
    required int id,
    required int customer_id,
    required String note,
    required double amount,
  }) = _HistoryNoteDto;

  factory HistoryNoteDto.fromJson(Map<String, dynamic> json) {
    return _$HistoryNoteDtoFromJson(json);
  }

  factory HistoryNoteDto.fromDomain(HistoryNote note) {
    return HistoryNoteDto(
      id: note.id,
      amount: note.amount,
      customer_id: note.customer_id,
      note: note.note,
    );
  }

  HistoryNote toDomain() {
    return HistoryNote(
      id: id,
      amount: amount,
      customer_id: customer_id,
      note: note,
    );
  }

  Map<String, dynamic> toJson() {
    return _$HistoryNoteDtoToJson(this);
  }
}
