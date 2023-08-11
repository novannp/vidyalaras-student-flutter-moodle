import 'package:lms_pptik/src/domain/repositories/auth_repository.dart';
import 'package:lms_pptik/src/domain/repositories/badge_repository.dart';
import 'package:lms_pptik/src/domain/repositories/calendar_repository.dart';
import 'package:lms_pptik/src/domain/repositories/chat_repository.dart';
import 'package:lms_pptik/src/domain/repositories/completion_repository.dart';
import 'package:lms_pptik/src/domain/repositories/course_repository.dart';
import 'package:lms_pptik/src/domain/repositories/mods_repository.dart';
import 'package:lms_pptik/src/domain/repositories/notification_repository.dart';
import 'package:lms_pptik/src/domain/repositories/quote_repository.dart';
import 'package:lms_pptik/src/domain/repositories/user_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [
    AuthRepository,
    BadgeRepository,
    CalendarRepository,
    CourseRepository,
    QuoteRepository,
    ChatRepository,
    CompletionRepository,
    NotificationRepository,
    UserRepository,
    ModAssignRepository,
    ModLessonRepository,
    ModResourceRepository,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockClient)],
)
void main() {}
