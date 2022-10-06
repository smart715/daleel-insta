import 'package:freezed_annotation/freezed_annotation.dart';
part 'history_note.freezed.dart';

@freezed
class HistoryNote with _$HistoryNote {
  const HistoryNote._();
  const factory HistoryNote({
    required int id,
    required int customer_id,
    required String note,
    required double amount,
  }) = _HistoryNote;
}
