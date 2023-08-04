import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_pptik/src/presentation/pages/chat_page.dart';
import 'package:lms_pptik/src/presentation/pages/course_detail.dart';
import 'package:lms_pptik/src/presentation/pages/lesson_page.dart';
import 'package:lms_pptik/src/presentation/pages/materi_detail_page.dart';
import 'package:lms_pptik/src/presentation/pages/permission_page.dart';
import 'package:lms_pptik/src/presentation/pages/resource_page.dart';
import 'package:lms_pptik/src/presentation/pages/search_page.dart';
import 'package:lms_pptik/src/presentation/pages/settings/settings_page.dart';

import '../data/models/course_model.dart';
import '../presentation/pages/assignment_page.dart';
import '../presentation/pages/chat_detail.dart';
import '../presentation/pages/login_page.dart';
import '../presentation/pages/main_page.dart';
import '../presentation/pages/notification_page.dart';
import '../presentation/pages/splash_page.dart';

class AppRoutes {
  static const String splash = '/';

  static GoRouter goRouter = GoRouter(
    initialLocation: '/',
    routerNeglect: true,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: splash,
        name: 'splash',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: SplashPage(),
          );
        },
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: LoginPage(),
          );
        },
      ),
      GoRoute(
        path: '/permission',
        name: 'permission',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: PermissionPage(),
          );
        },
      ),
      GoRoute(
        path: '/main',
        name: 'main',
        pageBuilder: (context, state) {
          return const MaterialPage(child: MainPage());
        },
        routes: [
          GoRoute(
            path: 'search',
            name: 'search',
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: SearchPage(),
              );
            },
          ),
          GoRoute(
            path: 'notification',
            name: 'notification',
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: NotificationPage(),
              );
            },
          ),
          GoRoute(
              path: 'chat',
              name: 'chat',
              pageBuilder: (context, state) {
                return const MaterialPage(
                  child: ChatPage(),
                );
              },
              routes: [
                GoRoute(
                    path: 'chat_detail',
                    name: 'chat_detail',
                    pageBuilder: (context, state) {
                      final param = state.extra as Map;
                      return MaterialPage(
                        child: ChatDetailPage(
                          conversationId: param['conversationId'],
                          memberId: param['memberId'],
                        ),
                      );
                    },
                    routes: [
                      GoRoute(
                          path: 'assignment',
                          name: 'assignment',
                          pageBuilder: (context, state) {
                            final courseId = state.extra as int;
                            return MaterialPage(
                              child: AssignmentPage(
                                courseId: courseId,
                              ),
                            );
                          }),
                      GoRoute(
                          path: 'resource',
                          name: 'resource',
                          pageBuilder: (context, state) {
                            final course = state.extra as CourseModel;
                            return MaterialPage(
                              child: ResourcePage(
                                course: course,
                              ),
                            );
                          }),
                      GoRoute(
                          path: 'lesson',
                          name: 'lesson',
                          pageBuilder: (context, state) {
                            final courseId = state.extra as int;
                            return MaterialPage(
                                child: LessonPage(courseId: courseId));
                          })
                    ]),
              ]),
          GoRoute(
            path: 'settings',
            name: 'settings',
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: SettingsPage(),
              );
            },
          ),
          GoRoute(
            path: 'course_detail',
            name: 'course_detail',
            pageBuilder: (context, state) {
              final course = state.extra as CourseModel;
              return MaterialPage(
                child: CourseDetailPage(course: course),
              );
            },
            routes: [
              GoRoute(
                path: 'materi_detail',
                name: 'materi_detail',
                pageBuilder: (context, state) {
                  final materis = state.extra as Map;

                  return MaterialPage(
                    child: MateriDetailPage(
                      selectedIndex: materis['selectedIndex'],
                      courseId: materis['courseId'],
                    ),
                  );
                },
              ),
            ],
          )
        ],
      )
    ],
  );
}
