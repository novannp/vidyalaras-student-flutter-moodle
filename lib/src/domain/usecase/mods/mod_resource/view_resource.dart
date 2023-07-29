part of 'mod_resource.dart';

class ViewResource {
  final ModResourceRepositoryImpl _resourceRepositoryImpl;

  ViewResource(this._resourceRepositoryImpl);

  Future<Either<Failure, bool>> execute(int resourceId) async {
    return await _resourceRepositoryImpl.viewResource(resourceId);
  }
}
