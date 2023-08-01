import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:lms_pptik/src/utils/helper/background_service_helper/background_service_helper.dart';
import 'package:lms_pptik/src/utils/helper/secure_storage/secure_storage.dart';

class QuoteSettingCubit extends Cubit<Map<String, dynamic>> with HydratedMixin {
  final StorageHelper storage;
  QuoteSettingCubit(this.storage)
      : super({
          'isEnabled': true,
          'frequency': 3,
          'tag': 'Education',
        });

  void setEnabled(bool isEnabled) async {
    emit(state..['isEnabled'] = isEnabled);
    await storage.write('isEnabled', isEnabled.toString());
    await storage.write('frequancy', state['frequency'].toString());
    await storage.write('tag', state['tag']);

    if (isEnabled == true) {
      startAndroidAlarm();
    } else {
      stopAndroidAlarm();
    }
  }

  void startAndroidAlarm() async {
    await AndroidAlarmManager.periodic(
      const Duration(seconds: 2),
      1,
      BackgroundServiceHelper.callback,
      startAt: DateTime.now(),
      exact: true,
      wakeup: true,
    );
  }

  void stopAndroidAlarm() async {
    await AndroidAlarmManager.cancel(1);
  }

  void setFrequency(int frequency) async {
    emit(state..['frequency'] = frequency);
    await storage.write('frequancy', state['frequency']);
  }

  void setTag(String tag) async {
    emit(state..['tag'] = tag);
    await storage.write('tag', state['tag']);
  }

  @override
  Map<String, dynamic>? fromJson(Map<String, dynamic> json) {
    storage.write('isEnabled', json['isEnabled'].toString());
    storage.write('frequancy', json['frequency'].toString());
    storage.write('tag', json['tag']);
    return json;
  }

  @override
  Map<String, dynamic>? toJson(Map<String, dynamic> state) {
    return state;
  }
}
