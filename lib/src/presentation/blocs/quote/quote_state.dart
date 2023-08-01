part of 'quote_bloc.dart';

@freezed
class QuoteState with _$QuoteState {
  const factory QuoteState.initial() = _Initial;
  const factory QuoteState.loading() = _Loading;
  const factory QuoteState.loaded(Object data) = _Loaded;
  const factory QuoteState.error(String message) = _Error;
}
