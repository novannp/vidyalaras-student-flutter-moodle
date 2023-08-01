import 'dart:developer';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:intl/intl.dart';
import 'package:lms_pptik/src/utils/helper/background_service_helper/background_service_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DateTimeService {
  static DateTime getNextScheduledDateTime(int frequency) {
    final now = DateTime.now();
    final completeFormat = DateFormat('d/M/y H:m:s');
    final startedTime = DateFormat('H:m:s').format(now);

    // Calculate the number of hours to add based on the frequency (1 hour in this case)
    final hoursToAdd = frequency;

    // Add the calculated hours to get the next scheduled date and time
    final scheduledDateTime = now.add(Duration(hours: hoursToAdd));

    // Set the time to 11:00:00 (or your preferred time)
    final nextScheduledDateAndTime =
        DateFormat('d/M/y $startedTime').format(scheduledDateTime);
    final result = completeFormat.parseStrict(nextScheduledDateAndTime);

    return result;
  }
}

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
    log('STARTING ON ${DateTimeService.getNextScheduledDateTime(frequency)}');
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
