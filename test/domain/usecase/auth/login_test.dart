import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lms_pptik/src/domain/usecase/auth/auth.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_object.dart';
import '../../../helper/test_helper.mocks.dart';

void main() {
  late Login login;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    login = Login(mockAuthRepository);
  });

  const String username = 'novantest';
  const String password = 'Novan2153#';

  test('should return token when login account was right', () async {
    //Arrange
    when(mockAuthRepository.login(username, password)).thenAnswer((_) async {
      return const Right(token);
    });

    //ACT
    final result = await login.execute(username, password);

    //   ASSERT
    expect(result, const Right(token));
  });
}
