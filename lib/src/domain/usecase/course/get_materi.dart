import 'package:dartz/dartz.dart';

import '../../../data/models/materi_model.dart';
import '../../../data/repositories/course_repository_impl.dart';
import '../../../utils/failures.dart';

class GetMateri {
  final CourseRepositoryImpl courseRepositoryImpl;

  GetMateri(this.courseRepositoryImpl);

  Future<Either<Failure, List<MateriModel>>> execute(int courseId) async {
    return await courseRepositoryImpl.getMateri(courseId);
  }
}
