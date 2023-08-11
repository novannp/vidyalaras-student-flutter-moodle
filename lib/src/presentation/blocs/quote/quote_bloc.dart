import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../data/models/tag_model.dart';
import '../../../domain/usecase/quote/quote.dart';

part 'quote_event.dart';
part 'quote_state.dart';
part 'quote_bloc.freezed.dart';

class GetTagsBloc extends Bloc<QuoteEvent, List<TagModel>> with HydratedMixin {
  final GetTags _getTags;

  GetTagsBloc(this._getTags) : super(const []) {
    on<QuoteEvent>((event, emit) async {
      await event.whenOrNull(
        getTags: () async {
          final result = await _getTags.execute();
          result.fold(
            (l) => emit([]),
            (r) => emit(r),
          );
        },
      );
    });
  }

  @override
  List<TagModel>? fromJson(Map<String, dynamic> json) {
    return json['tags'] as List<TagModel>;
  }

  @override
  Map<String, dynamic>? toJson(List<TagModel> state) {
    return {
      'tags': state.map((e) => e.toJson()).toList(),
    };
  }
}

class GetQuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  final GetQuote _getQuote;

  GetQuoteBloc(this._getQuote) : super(const QuoteState.initial()) {
    on<QuoteEvent>((event, emit) async {
      await event.whenOrNull(
        getQuote: (tag) async {
          emit(const QuoteState.loading());
          final result = await _getQuote.execute(tag);
          result.fold(
            (l) => emit(QuoteState.error(l.message)),
            (r) => emit(QuoteState.loaded(r)),
          );
        },
      );
    });
  }
}
