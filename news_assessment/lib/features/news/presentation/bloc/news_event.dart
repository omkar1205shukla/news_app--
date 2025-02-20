import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_event.freezed.dart';

@freezed
abstract class NewsEvent with _$NewsEvent {
  factory NewsEvent.getNewsEvent(
      {required String category,
      required int limit,
      required int pageNo}) = GetNewsEvent;
}
