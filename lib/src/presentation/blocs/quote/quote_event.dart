part of 'quote_bloc.dart';

@freezed
class QuoteEvent with _$QuoteEvent {
  const factory QuoteEvent.getTags() = _GetTags;
  const factory QuoteEvent.getQuote(String tag) = _GetQuote;
}
