import 'package:dartz/dartz.dart';

import '../../utils/failures.dart';

abstract class CompletionRepository {
  Future<Either<Failure, bool>> setCompletionStatus(int cmId, int completed);
}
