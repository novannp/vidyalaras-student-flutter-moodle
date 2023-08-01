import 'package:dartz/dartz.dart';

import '../../data/models/quote_model.dart';
import '../../data/models/tag_model.dart';
import '../../utils/failures.dart';

abstract class QuoteRepository {
  Future<Either<Failure, List<TagModel>>> getTags();
  Future<Either<Failure, QuoteModel>> getQuotes(String tag);
}
