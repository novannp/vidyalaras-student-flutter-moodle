import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../utils/helper/secure_storage/secure_storage.dart';

class DarkModeCubit extends HydratedCubit<bool> {
  final StorageHelper storageHelper;
  DarkModeCubit(this.storageHelper) : super(false);

  void changeMode(bool value) async {
    await storageHelper.write('darkMode', value.toString());
    emit(value);
  }

  @override
  bool? fromJson(Map<String, dynamic> json) {
    return json['darkMode'] as bool;
  }

  @override
  Map<String, dynamic>? toJson(bool state) {
    return {
      'darkMode': state,
    };
  }
}
