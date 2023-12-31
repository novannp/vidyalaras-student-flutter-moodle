import 'dart:developer';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:lms_pptik/src/utils/helper/background_service_helper/background_service_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuoteSettingCubit extends Cubit<Map<String, dynamic>> with HydratedMixin {
  QuoteSettingCubit()
      : super({
          'isEnabled': true,
          'frequency': 3,
          'tag': 'Education',
        });

  void setEnabled(bool isEnabled) async {
    emit(state..['isEnabled'] = isEnabled);

    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isEnabled', isEnabled);
    prefs.setInt('frequency', state['frequency']);
    prefs.setString('tag', state['tag']);
    if (isEnabled) {
      startAndroidAlarm(state['frequency']);
    } else {
      stopAndroidAlarm();
    }
  }

  void startAndroidAlarm(int frequency) async {
    log('Starting Quote Alarm EVERY $frequency hours .....');
    int id = 87;
    await AndroidAlarmManager.periodic(
      Duration(hours: frequency),
      id,
      BackgroundServiceHelper.callback,
      exact: true,
      wakeup: true,
    );
  }

  void stopAndroidAlarm() {
    log('Stopping Quote Alarm.....');
    AndroidAlarmManager.cancel(87);
  }

  void setFrequency(int frequency) async {
    emit(state..['frequency'] = frequency);
    stopAndroidAlarm();
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('frequency', frequency);
    startAndroidAlarm(state['frequency']);
  }

  void setTag(String tag) async {
    emit(state..['tag'] = tag);
    stopAndroidAlarm();
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('tag ', tag);
    startAndroidAlarm(state['frequency']);
  }

  @override
  Map<String, dynamic>? fromJson(Map<String, dynamic> json) {
    // No need to write to storage here
    return json;
  }

  @override
  Map<String, dynamic>? toJson(Map<String, dynamic> state) {
    return state;
  }
}
