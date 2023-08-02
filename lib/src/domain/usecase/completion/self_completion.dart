part of 'completion.dart';

class SelfCompletion {
  final CompletionRepositoryImpl _completionRepositoryImpl;

  SelfCompletion(this._completionRepositoryImpl);

  Future<Either<Failure, bool>> execute(int cmId, int completed) async {
    return await _completionRepositoryImpl.setCompletionStatus(cmId, completed);
  }
}
