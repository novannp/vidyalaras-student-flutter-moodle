import 'package:get_it/get_it.dart';

import 'package:lms_pptik/src/data/repositories/auth_repository_impl.dart';
import 'package:lms_pptik/src/data/repositories/badge_repository_impl.dart';
import 'package:lms_pptik/src/data/repositories/calendar_repository_impl.dart';
import 'package:lms_pptik/src/data/repositories/chat_repository_impl.dart';
import 'package:lms_pptik/src/data/repositories/course_repository_impl.dart';
import 'package:lms_pptik/src/data/repositories/user_repository_impl.dart';
import 'package:lms_pptik/src/domain/usecase/auth/logout.dart';
import 'package:lms_pptik/src/domain/usecase/badge/get_badge.dart';
import 'package:lms_pptik/src/domain/usecase/badge/get_badge_image.dart';
import 'package:lms_pptik/src/domain/usecase/calendar/get_all_event.dart';
import 'package:lms_pptik/src/domain/usecase/chat/get_conversation_message.dart';
import 'package:lms_pptik/src/domain/usecase/chat/get_conversations.dart';
import 'package:lms_pptik/src/domain/usecase/chat/get_member_info.dart';
import 'package:lms_pptik/src/domain/usecase/chat/get_unread_message_count.dart';
import 'package:lms_pptik/src/domain/usecase/chat/send_instant_message.dart';
import 'package:lms_pptik/src/domain/usecase/course/add_course_to_favourite.dart';
import 'package:lms_pptik/src/domain/usecase/course/get_enrolled_user.dart';
import 'package:lms_pptik/src/domain/usecase/course/get_filtered_course.dart';
import 'package:lms_pptik/src/domain/usecase/course/get_materi.dart';
import 'package:lms_pptik/src/domain/usecase/course/get_recent_course.dart';
import 'package:lms_pptik/src/domain/usecase/course/search_course.dart';
import 'package:lms_pptik/src/domain/usecase/user/get_current_user.dart';
import 'package:lms_pptik/src/domain/usecase/auth/login.dart';
import 'package:lms_pptik/src/presentation/blocs/auth/auth_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/badge/badge_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/bloc/chat_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/calendar/calendar_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/course/course_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/cubit/dark_mode_cubit.dart';
import 'package:lms_pptik/src/presentation/blocs/dropdown_course/dropdown_course_cubit.dart';
import 'package:lms_pptik/src/presentation/blocs/main_index/main_index_cubit.dart';
import 'package:lms_pptik/src/presentation/blocs/user/user_bloc.dart';

import 'src/data/data_sources/auth_api.dart';
import 'src/data/data_sources/badge_api.dart';
import 'src/data/data_sources/calendar_api.dart';
import 'src/data/data_sources/chat_api.dart';
import 'src/data/data_sources/course_api.dart';
import 'src/data/data_sources/user_api.dart';
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

  // CHAT
  locator.registerFactory(() => GetConversations(locator()));
  locator.registerFactory(() => GetConversationMessage(locator()));
  locator.registerFactory(() => GetMemberInfo(locator()));
  locator.registerFactory(() => SendInstantMessage(locator()));
  locator.registerFactory(() => GetUnreadMessageCount(locator()));

  // REPOSITORIES
  locator.registerLazySingleton(() => AuthRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton(() => UserRepositoryImpl(locator(), locator()));
  locator
      .registerLazySingleton(() => BadgeRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton(
      () => CalendarRepositoryImpl(locator(), locator()));
  locator
      .registerLazySingleton(() => CourseRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton(() => ChatRepositoryImpl(locator(), locator()));

  // API
  locator.registerLazySingleton(() => AuthApiImpl(locator()));
  locator.registerLazySingleton(() => UserApiImpl(locator()));
  locator.registerLazySingleton(() => BadgeApiImpl(locator()));
  locator.registerLazySingleton(() => CalendarApiImpl(locator()));
  locator.registerLazySingleton(() => CourseApiImpl(locator()));
  locator.registerLazySingleton(() => ChatApiImpl(locator()));
  // HTTP
  locator.registerLazySingleton(() => HttpHelper.client);

  // STORAGE
  locator.registerLazySingleton(() => StorageHelper());
}
