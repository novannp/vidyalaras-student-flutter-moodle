import 'package:get_it/get_it.dart';
import 'package:lms_pptik/src/data/data_sources/notification_api.dart';

import 'package:lms_pptik/src/data/repositories/auth_repository_impl.dart';
import 'package:lms_pptik/src/data/repositories/badge_repository_impl.dart';
import 'package:lms_pptik/src/data/repositories/calendar_repository_impl.dart';
import 'package:lms_pptik/src/data/repositories/chat_repository_impl.dart';
import 'package:lms_pptik/src/data/repositories/course_repository_impl.dart';
import 'package:lms_pptik/src/data/repositories/user_repository_impl.dart';
import 'package:lms_pptik/src/domain/usecase/mods/mod_resource/mod_resource.dart';
import 'package:lms_pptik/src/presentation/blocs/auth/auth_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/badge/badge_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/calendar/calendar_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/course/course_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/cubit/dark_mode_cubit.dart';
import 'package:lms_pptik/src/presentation/blocs/dropdown_course/dropdown_course_cubit.dart';
import 'package:lms_pptik/src/presentation/blocs/main_index/main_index_cubit.dart';
import 'package:lms_pptik/src/presentation/blocs/mods/mod_resource/mod_resource_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/user/user_bloc.dart';
import 'package:lms_pptik/src/utils/helper/notification_plugin/notification_plugin.dart';

import 'src/data/data_sources/auth_api.dart';
import 'src/data/data_sources/badge_api.dart';
import 'src/data/data_sources/calendar_api.dart';
import 'src/data/data_sources/chat_api.dart';
import 'src/data/data_sources/course_api.dart';
import 'src/data/data_sources/mod_apis/mod_apis.dart';
import 'src/data/data_sources/user_api.dart';
import 'src/data/repositories/mods/mods.dart';
import 'src/data/repositories/notification_repository_impl.dart';
import 'src/domain/usecase/auth/auth.dart';
import 'src/domain/usecase/badge/badge.dart';
import 'src/domain/usecase/calendar/calendar.dart';
import 'src/domain/usecase/chat/chat.dart';
import 'src/domain/usecase/course/course.dart';
import 'src/domain/usecase/mods/mod_assign/mod_assign.dart';
import 'src/domain/usecase/notification/notification.dart';
import 'src/domain/usecase/user/user.dart';
import 'src/presentation/blocs/chat/chat_bloc.dart';
import 'src/presentation/blocs/mods/mod_assign/mod_assign_bloc.dart';
import 'src/presentation/blocs/notification/notification_bloc.dart';
import 'src/utils/helper/http_helper/http_helper.dart';
import 'src/utils/helper/secure_storage/secure_storage.dart';

final locator = GetIt.instance;

void init() {
  // BLOC
  locator.registerFactory(() => DarkModeCubit(locator()));
  locator.registerFactory(() => AuthLoginBloc(locator()));
  locator.registerFactory(() => GetCurrentUserBloc(locator()));
  locator.registerFactory(() => MainIndexCubit());
  locator.registerFactory(() => GetBadgeBloc(locator()));
  locator.registerFactory(() => GetBadgeImageBloc(locator()));
  locator.registerFactory(() => GetEventBloc(locator()));
  locator.registerFactory(() => GetRecentCourseBloc(locator()));
  locator.registerFactory(() => GetFilteredCourseBloc(locator()));
  locator.registerFactory(() => GetUserGradeBloc(locator()));
  locator.registerFactory(() => DropdownCourseCubit());
  locator.registerFactory(() => SearchCourseBloc(locator()));
  locator.registerFactory(() => GetEnrolledUserBloc(locator()));
  locator.registerFactory(() => GetMateriBloc(locator()));
  locator.registerFactory(() => AddCourseToFavouriteBloc(locator()));
  locator.registerFactory(() => GetConversationsBloc(locator()));
  locator.registerFactory(() => GetConversationMessageBloc(locator()));
  locator.registerFactory(() => GetMemberInfoBloc(locator()));
  locator.registerFactory(() => SendInstantMessageBloc(locator()));
  locator.registerFactory(() => AuthLogoutBloc(locator()));
  locator.registerFactory(() => GetUnreadMessageCountBloc(locator()));
  locator.registerFactory(() => GetNotificationsBloc(locator()));
  locator.registerFactory(() => GetNotificationCountBloc(locator()));
  locator.registerFactory(() => GetAssignmentListBloc(locator()));
  locator.registerFactory(() => GetSubmissionStatusBloc(locator()));
  locator.registerFactory(() => GetResourceByCourseBloc(locator()));
  locator.registerFactory(() => ViewResourceBloc(locator()));

  //USECASE
  // AUTH
  locator.registerFactory(() => Login(locator()));
  locator.registerFactory(() => Logout(locator()));

  //USER
  locator.registerFactory(() => GetCurrentUser(locator()));

  // BADGE
  locator.registerFactory(() => GetBadge(locator()));
  locator.registerFactory(() => GetBadgeImage(locator()));

  // CALENDAR EVENT
  locator.registerFactory(() => GetAllEvent(locator()));

  // COURSE
  locator.registerFactory(() => GetRecentCourse(locator()));
  locator.registerFactory(() => GetFilteredCourse(locator()));
  locator.registerFactory(() => SearchCourse(locator()));
  locator.registerFactory(() => GetEnrolledUser(locator()));
  locator.registerFactory(() => GetMateri(locator()));
  locator.registerFactory(() => AddCourseToFavourite(locator()));
  locator.registerFactory(() => GetUserGrade(locator()));

  // CHAT
  locator.registerFactory(() => GetConversations(locator()));
  locator.registerFactory(() => GetConversationMessage(locator()));
  locator.registerFactory(() => GetMemberInfo(locator()));
  locator.registerFactory(() => SendInstantMessage(locator()));
  locator.registerFactory(() => GetUnreadMessageCount(locator()));

  // NOTIFICATION
  locator.registerFactory(() => GetNotifications(locator()));
  locator.registerFactory(() => GetNotificationCount(locator()));

  // MOD ASSIGN
  locator.registerFactory(() => GetAssignmentList(locator()));
  locator.registerFactory(() => GetSubmissionStatus(locator()));

  // MOD RESOURCE
  locator.registerFactory(() => GetResourceByCourse(locator()));
  locator.registerFactory(() => ViewResource(locator()));

  // REPOSITORIES
  locator.registerLazySingleton(() => AuthRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton(
      () => UserRepositoryImpl(locator(), locator(), locator()));
  locator
      .registerLazySingleton(() => BadgeRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton(
      () => CalendarRepositoryImpl(locator(), locator()));
  locator
      .registerLazySingleton(() => CourseRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton(() => ChatRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton(
      () => NotificationRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton(
      () => ModAssignRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton(
      () => ModResourceRepositoryImpl(locator(), locator()));

  // API
  locator.registerLazySingleton(() => AuthApiImpl(locator()));
  locator.registerLazySingleton(() => UserApiImpl(locator()));
  locator.registerLazySingleton(() => BadgeApiImpl(locator()));
  locator.registerLazySingleton(() => CalendarApiImpl(locator()));
  locator.registerLazySingleton(() => CourseApiImpl(locator()));
  locator.registerLazySingleton(() => ChatApiImpl(locator()));
  locator.registerLazySingleton(() => NotificationApiImpl(locator()));
  locator.registerLazySingleton(() => ModAssignApiImpl(locator()));
  locator.registerLazySingleton(() => ModResourceApiImpl(locator()));
  // HTTP
  locator.registerLazySingleton(() => HttpHelper.client);

  // STORAGE
  locator.registerLazySingleton(() => StorageHelper());

  // Notification PLugin
  locator.registerLazySingleton(() => NotificationPlugin());
}
