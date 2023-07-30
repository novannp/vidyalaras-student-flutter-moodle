import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:lms_pptik/src/utils/exceptions.dart';

import '../../utils/endpoints.dart';
import '../models/course_model.dart';
import '../models/materi_model/materi_model.dart';
import '../models/user_grade_model/user_grade_model.dart';
import '../models/user_model.dart';

abstract class CourseApi {
  Future<List<CourseModel>> getRecentCourse(String token);

  Future<List<CourseModel>> getFilteredCourse(String token, String category);

  Future<List<CourseModel>> searchCourse(String token, String query);

  Future<List<MateriModel>> getMateri(String token, int courseId);

  Future<List<UserModel>> getEnrolledUser(String token, int courseId);

  Future<void> addCourseToFavorite(String token, CourseModel course);

  Future<List<UserGradeModel>> getUserGrade(
      String token, int courseId, int userId);
}

class CourseApiImpl implements CourseApi {
  final Client client;

  CourseApiImpl(this.client);

  @override
  Future<List<CourseModel>> getRecentCourse(String token) async {
    Uri url = Uri.https(Endpoints.baseUrl, Endpoints.rest, {
      'wstoken': token,
      'wsfunction': 'core_course_get_recent_courses',
      'moodlewsrestformat': 'json',
    });
    final response = await client.get(url);
    if (response.statusCode == 200) {
      final result = json.decode(response.body) as List;
      if (result.isEmpty) {
        return <CourseModel>[];
      }
      return result.map<CourseModel>((e) => CourseModel.fromJson(e)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<CourseModel>> getFilteredCourse(
      String token, String category) async {
    Uri url = Uri.https(Endpoints.baseUrl, Endpoints.rest, {
      'wstoken': token,
      'wsfunction':
          'core_course_get_enrolled_courses_by_timeline_classification',
      'moodlewsrestformat': 'json',
      'classification': category,
    });

    final response = await client.get(url);
    if (response.statusCode == 200) {
      final result = json.decode(response.body)['courses'] as List;
      if (result.isEmpty) {
        return <CourseModel>[];
      }
      return result.map<CourseModel>((e) => CourseModel.fromJson(e)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<CourseModel>> searchCourse(String token, String query) async {
    Uri url = Uri.https(Endpoints.baseUrl, Endpoints.rest, {
      'wstoken': token,
      'wsfunction': 'core_course_search_courses',
      'moodlewsrestformat': 'json',
      'criterianame': 'search',
      'criteriavalue': query,
    });

    final response = await client.get(url);

    if (response.statusCode == 200) {
      final result = json.decode(response.body)['courses'] as List;
      if (result.isEmpty) {
        return <CourseModel>[];
      }
      return result.map<CourseModel>((e) => CourseModel.fromJson(e)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MateriModel>> getMateri(String token, int courseId) async {
    Uri url = Uri.https(
      Endpoints.baseUrl,
      Endpoints.rest,
      {
        'wstoken': token,
        'wsfunction': 'core_course_get_contents',
        'moodlewsrestformat': 'json',
        'courseid': courseId,
      }.map((key, value) => MapEntry(key, value.toString())),
    );

    final response = await client.get(url);
    if (response.statusCode == 200) {
      final result = json.decode(response.body) as List;
      if (result.isEmpty) {
        return <MateriModel>[];
      }
      return result.map<MateriModel>((e) => MateriModel.fromJson(e)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<UserModel>> getEnrolledUser(String token, int courseId) async {
    Uri url = Uri.https(
      Endpoints.baseUrl,
      Endpoints.rest,
      {
        'wstoken': token,
        'wsfunction': 'core_enrol_get_enrolled_users',
        'moodlewsrestformat': 'json',
        'courseid': courseId,
      }.map((key, value) => MapEntry(key, value.toString())),
    );

    final response = await client.get(url);

    if (response.statusCode == 200) {
      final result = json.decode(response.body) as List;

      if (result.isEmpty) {
        return <UserModel>[];
      }
      return result.map<UserModel>((e) => UserModel.fromJson(e)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> addCourseToFavorite(String token, CourseModel course) async {
    Uri url = Uri.https(
      Endpoints.baseUrl,
      Endpoints.rest,
      {
        'wstoken': token,
        'wsfunction': 'core_course_set_favourite_courses',
        'moodlewsrestformat': 'json',
        'courses[0][id]': course.id,
        'courses[0][favourite]': course.isfavourite! ? 0 : 1,
      }.map(
        (key, value) => MapEntry(key, value.toString()),
      ),
    );

    final response = await client.post(url);
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      debugPrint(result.toString());
      if (result['warnings'].isEmpty) {
        return;
      } else {
        throw ServerException();
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<UserGradeModel>> getUserGrade(
      String token, int courseId, int userId) async {
    Uri url = Uri.https(
      Endpoints.baseUrl,
      Endpoints.rest,
      {
        'wstoken': token,
        'wsfunction': 'gradereport_user_get_grade_items',
        'moodlewsrestformat': 'json',
        'courseid': courseId,
        'userid': userId,
      }.map(
        (key, value) => MapEntry(key, value.toString()),
      ),
    );

    final response = await client.get(url);
    if (response.statusCode == 200) {
      final result = json.decode(response.body) as Map<String, dynamic>;
      if (result['usergrades'] == null) {
        throw ServerException();
      } else {
        if (result['usergrades'].isEmpty) {
          return <UserGradeModel>[];
        } else {
          return result['usergrades']
              .map<UserGradeModel>((e) => UserGradeModel.fromJson(e))
              .toList();
        }
      }
    } else {
      throw ServerException();
    }
  }
}
