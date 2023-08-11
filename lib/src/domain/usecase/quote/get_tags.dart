part of 'quote.dart';

class GetTags {
  final QuoteRepository _quoteRepositoryImpl;

  GetTags(this._quoteRepositoryImpl);

  Future<Either<Failure, List<TagModel>>> execute() async {
    return await _quoteRepositoryImpl.getTags();
  }
}
