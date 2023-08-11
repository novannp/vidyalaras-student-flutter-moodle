import 'package:flutter_test/flutter_test.dart';
import 'package:lms_pptik/src/domain/usecase/badge/badge.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_object.dart';
import '../../../helper/test_helper.mocks.dart';

void main() {
  late MockBadgeRepository badgeRepository;
  late GetBadgeImage getBadgeImage;

  setUp(() {
    badgeRepository = MockBadgeRepository();
    getBadgeImage = GetBadgeImage(badgeRepository);
  });

  test('should return image url of badge image when success', () async {
    //Arrange
    when(badgeRepository.getBadgeImage(testBadge))
        .thenAnswer((_) async => testBadgeImage);
    //Act
    final result = await getBadgeImage.execute(testBadge);
    //Assert
    expect(result, testBadgeImage);
  });
}
