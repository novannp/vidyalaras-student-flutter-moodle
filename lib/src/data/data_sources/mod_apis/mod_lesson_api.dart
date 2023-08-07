part of 'mod_apis.dart';

abstract class ModLessonApi{
  Future<List<Lesson>> getModLesson(String token, int courseId);
  Future<Lesson> getLesson(String token, int lessonId);
  Future<List<PageLesson>> getPagesLesson(String token, int lessonId);
}

class ModLessonApiImpl implements ModLessonApi{

  final Client client;

  ModLessonApiImpl(this.client);
  @override
  Future<List<Lesson>> getModLesson(String token, int courseId) async{
    Uri url = Uri.https(Endpoints.baseUrl, Endpoints.rest, {
    'wstoken': token,
    'wsfunction': 'mod_lesson_get_lessons_by_courses',
    'moodlewsrestformat': 'json',
    'courseids[0]': courseId.toString(),
    });

    final response = await client.get(url);
    print(url);
    print(response.body);
    if (response.statusCode == 200) {
    final result = json.decode(response.body)['lessons'] as List;
    if (result.isEmpty) {
    return <Lesson>[];
    }
    return result
        .map<Lesson>((e) => Lesson.fromJson(e))
        .toList();
    } else {
    throw ServerException();
    }
  }

  @override
  Future<Lesson> getLesson(String token, int lessonId)async {
    Uri url = Uri.https(Endpoints.baseUrl, Endpoints.rest, {
      'wstoken': token,
      'wsfunction': 'mod_lesson_get_lesson',
      'moodlewsrestformat': 'json',
      'lessonid': lessonId.toString(),
    });

    final response = await client.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      final result = json.decode(response.body)['lesson'];
      final lesson = Lesson.fromJson(result);
      return lesson;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<PageLesson>> getPagesLesson(String token, int lessonId)async {
    Uri url = Uri.https(Endpoints.baseUrl, Endpoints.rest, {
      'wstoken': token,
      'wsfunction': 'mod_lesson_get_pages',
      'moodlewsrestformat': 'json',
      'lessonid': lessonId.toString(),
    });

    final response = await client.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      List result = json.decode(response.body)['pages'];
      List<PageLesson> lesson = result.map((e) => PageLesson.fromJson(e)).toList();
      return lesson;
    } else {
      throw ServerException();
    }
  }
  
}