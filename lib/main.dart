import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:lms_pptik/src/presentation/blocs/auth/auth_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/badge/badge_bloc.dart';

import 'package:lms_pptik/src/presentation/blocs/calendar/calendar_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/course/course_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/cubit/dark_mode_cubit.dart';
import 'package:lms_pptik/src/presentation/blocs/dropdown_course/dropdown_course_cubit.dart';
import 'package:lms_pptik/src/presentation/blocs/main_index/main_index_cubit.dart';
import 'package:lms_pptik/src/presentation/blocs/mods/mod_resource/mod_resource_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/upload/upload_file_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/user/user_bloc.dart';
import 'package:lms_pptik/src/utils/helper/notification_plugin/notification_plugin.dart';

import 'package:lms_pptik/src/utils/observer.dart';
import 'app.dart';
import 'injection.dart' as di;
import 'src/presentation/blocs/chat/chat_bloc.dart';
import 'src/presentation/blocs/mods/mod_assign/mod_assign_bloc.dart';
import 'src/presentation/blocs/notification/notification_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  di.init();
  di.locator<NotificationPlugin>().init();
  di
      .locator<NotificationPlugin>()
      .flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()!
      .requestPermission();
  // Bloc.observer = MyGlobalObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.locator<DarkModeCubit>()),
        BlocProvider(create: (context) => di.locator<AuthLoginBloc>()),
        BlocProvider(create: (context) => di.locator<GetCurrentUserBloc>()),
        BlocProvider(create: (context) => di.locator<MainIndexCubit>()),
        BlocProvider(create: (context) => di.locator<GetBadgeBloc>()),
        BlocProvider(create: (context) => di.locator<GetBadgeImageBloc>()),
        BlocProvider(create: (context) => di.locator<GetEventBloc>()),
        BlocProvider(create: (context) => di.locator<GetRecentCourseBloc>()),
        BlocProvider(create: (context) => di.locator<GetFilteredCourseBloc>()),
        BlocProvider(create: (context) => di.locator<DropdownCourseCubit>()),
        BlocProvider(create: (context) => di.locator<SearchCourseBloc>()),
        BlocProvider(create: (context) => di.locator<GetMateriBloc>()),
        BlocProvider(create: (context) => di.locator<GetEnrolledUserBloc>()),
        BlocProvider(
            create: (context) => di.locator<AddCourseToFavouriteBloc>()),
        BlocProvider(create: (context) => di.locator<GetConversationsBloc>()),
        BlocProvider(
            create: (context) => di.locator<GetConversationMessageBloc>()),
        BlocProvider(
          create: (context) => di.locator<GetMemberInfoBloc>(),
        ),
        BlocProvider(create: (context) => di.locator<SendInstantMessageBloc>()),
        BlocProvider(create: (context) => di.locator<GetConversationBetweenUserBloc>()),
        BlocProvider(create: (context) => di.locator<SetConversationsFavoriteBloc>()),
        BlocProvider(create: (context) => di.locator<UnsetConversationsFavoriteBloc>()),
        BlocProvider(create: (context)=>di.locator<DeleteConversationBloc>()),
        BlocProvider(create: (context)=>di.locator<BlockUserBloc>()),
        BlocProvider(create: (context)=>di.locator<UnblockUserBloc>()),
        BlocProvider(
          create: (context) => di.locator<AuthLogoutBloc>(),
        ),
        BlocProvider(
            create: (context) => di.locator<GetUnreadMessageCountBloc>()),
        BlocProvider(create: (context) => di.locator<GetNotificationsBloc>()),
        BlocProvider(
            create: (context) => di.locator<GetNotificationCountBloc>()),
        BlocProvider(create: (context) => di.locator<GetUserGradeBloc>()),
        BlocProvider(create: (context) => di.locator<GetAssignmentListBloc>()),
        BlocProvider(
            create: (context) => di.locator<GetSubmissionStatusBloc>()),
        BlocProvider(
            create: (context) => di.locator<GetResourceByCourseBloc>()),
        BlocProvider(create: (context) => di.locator<ViewResourceBloc>()),
        BlocProvider(create: (context) => di.locator<UploadFileBloc>()),
        BlocProvider(create: (context) => di.locator<UpdatePictureBloc>()),
      ],
      child: const LmsPPTIK(),
    ),
  );
}
