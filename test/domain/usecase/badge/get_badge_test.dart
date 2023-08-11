import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lms_pptik/src/domain/usecase/badge/badge.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_object.dart';
import '../../../helper/test_helper.mocks.dart';

void main() {
  late MockBadgeRepository badgeRepository;
  late GetBadge getBadge;

  setUp(() {
    badgeRepository = MockBadgeRepository();
    getBadge = GetBadge(badgeRepository);
  });

  test('should return list of badge when success', () async {
    //Arrange
    when(badgeRepository.getBadge())
        .thenAnswer((_) async => Right(testListBadge));
    //Act
    final result = await getBadge.execute();
    //Assert
    expect(result, Right(testListBadge));
  });
}
