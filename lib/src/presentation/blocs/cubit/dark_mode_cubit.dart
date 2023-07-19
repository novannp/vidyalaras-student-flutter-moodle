import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/helper/secure_storage/secure_storage.dart';

class DarkModeCubit extends Cubit<bool> {
  final StorageHelper storageHelper;
  DarkModeCubit(this.storageHelper) : super(false);

  void changeMode(bool value) async {
    await storageHelper.write('darkMode', value.toString());
    emit(value);
  }
}
