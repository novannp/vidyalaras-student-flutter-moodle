import 'dart:ui';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:lms_pptik/src/presentation/blocs/auth/auth_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/badge/badge_bloc.dart';

import 'package:lms_pptik/src/presentation/blocs/calendar/calendar_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/completion/completion_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/course/course_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/dark_mode/dark_mode_cubit.dart';
import 'package:lms_pptik/src/presentation/blocs/dropdown_course/dropdown_course_cubit.dart';
import 'package:lms_pptik/src/presentation/blocs/main_index/main_index_cubit.dart';
import 'package:lms_pptik/src/presentation/blocs/mods/mod_lesson/mod_lesson_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/mods/mod_resource/mod_resource_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/quote/quote_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/quote_setting/quote_setting_cubit.dart';
import 'package:lms_pptik/src/presentation/blocs/upload/upload_file_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/user/user_bloc.dart';
import 'package:lms_pptik/src/utils/helper/background_service_helper/background_service_helper.dart';
import 'package:lms_pptik/src/utils/helper/notification_plugin/notification_plugin.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'app.dart';
import 'injection.dart' as di;
import 'src/presentation/blocs/chat/chat_bloc.dart';
import 'src/presentation/blocs/mods/mod_assign/mod_assign_bloc.dart';
import 'src/presentation/blocs/notification/notification_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

// Be sure to annotate your callback function to avoid issues in release mode on Flutter >= 3.3.0

  di.init();
  BackgroundServiceHelper().initializeIsolate();
  await AndroidAlarmManager.initialize();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  di.locator<NotificationPlugin>().init();
  di
      .locator<NotificationPlugin>()
      .flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()!
      .requestPermission();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.locator<DarkModeCubit>()),
        BlocProvider(create: (_) => di.locator<AuthLoginBloc>()),
        BlocProvider(create: (_) => di.locator<GetCurrentUserBloc>()),
        BlocProvider(create: (_) => di.locator<MainIndexCubit>()),
        BlocProvider(create: (_) => di.locator<GetBadgeBloc>()),
        BlocProvider(create: (_) => di.locator<GetBadgeImageBloc>()),
        BlocProvider(create: (_) => di.locator<GetEventBloc>()),
        BlocProvider(create: (_) => di.locator<GetRecentCourseBloc>()),
        BlocProvider(create: (_) => di.locator<GetFilteredCourseBloc>()),
        BlocProvider(create: (_) => di.locator<DropdownCourseCubit>()),
        BlocProvider(create: (_) => di.locator<SearchCourseBloc>()),
        BlocProvider(create: (_) => di.locator<GetMateriBloc>()),
        BlocProvider(create: (_) => di.locator<GetEnrolledUserBloc>()),
        BlocProvider(create: (_) => di.locator<AddCourseToFavouriteBloc>()),
        BlocProvider(create: (_) => di.locator<GetConversationsBloc>()),
        BlocProvider(create: (_) => di.locator<GetConversationMessageBloc>()),
        BlocProvider(
          create: (_) => di.locator<GetMemberInfoBloc>(),
        ),
        BlocProvider(create: (_) => di.locator<SendInstantMessageBloc>()),
        BlocProvider(
            create: (_) => di.locator<GetConversationBetweenUserBloc>()),
        BlocProvider(create: (_) => di.locator<SetConversationsFavoriteBloc>()),
        BlocProvider(
            create: (_) => di.locator<UnsetConversationsFavoriteBloc>()),
        BlocProvider(create: (_) => di.locator<DeleteConversationBloc>()),
        BlocProvider(create: (_) => di.locator<BlockUserBloc>()),
        BlocProvider(create: (_) => di.locator<UnblockUserBloc>()),
        BlocProvider(
          create: (_) => di.locator<AuthLogoutBloc>(),
        ),
        BlocProvider(create: (_) => di.locator<GetUnreadMessageCountBloc>()),
        BlocProvider(create: (_) => di.locator<GetNotificationsBloc>()),
        BlocProvider(create: (_) => di.locator<GetNotificationCountBloc>()),
        BlocProvider(create: (_) => di.locator<GetUserGradeBloc>()),
        BlocProvider(create: (_) => di.locator<GetAssignmentListBloc>()),
        BlocProvider(create: (_) => di.locator<GetSubmissionStatusBloc>()),
        BlocProvider(create: (_) => di.locator<GetResourceByCourseBloc>()),
        BlocProvider(create: (_) => di.locator<ViewResourceBloc>()),
        BlocProvider(create: (_) => di.locator<UploadFileBloc>()),
        BlocProvider(create: (_) => di.locator<UpdatePictureBloc>()),
        BlocProvider(create: (_) => di.locator<SubmitSubmissionBloc>()),
        BlocProvider(create: (_) => di.locator<ViewAssignmentBloc>()),
        BlocProvider(create: (_) => di.locator<GetQuoteBloc>()),
        BlocProvider(create: (_) => di.locator<GetTagsBloc>()),
        BlocProvider(create: (_) => di.locator<QuoteSettingCubit>()),
        BlocProvider(create: (_) => di.locator<AddEventBloc>()),
        BlocProvider(create: (_) => di.locator<DeleteEventBloc>()),
        BlocProvider(
            create: (_) => di.locator<MarkAllNotificationsAsReadBloc>()),
        BlocProvider(create: (_) => di.locator<SelfCompletionBloc>()),
        BlocProvider(create: (_) => di.locator<ExportEventsBloc>()),
        BlocProvider(create: (_)=> di.locator<GetLessonByCourseBloc>()),
        BlocProvider(create: (_)=> di.locator<GetLessonBloc>()),
      ],
      child: const LmsPPTIK(),
    ),
  );
}
