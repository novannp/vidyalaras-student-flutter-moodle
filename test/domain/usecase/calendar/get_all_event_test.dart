import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lms_pptik/src/domain/usecase/calendar/calendar.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_object.dart';
import '../../../helper/test_helper.mocks.dart';

void main() {
  late MockCalendarRepository calendarRepository;
  late GetAllEvent getAllEvent;

  setUp(() {
    calendarRepository = MockCalendarRepository();
    getAllEvent = GetAllEvent(calendarRepository);
  });

  test('should return list of events', () async {
    //Arrange
    when(calendarRepository.getAllEvent())
        .thenAnswer((_) async => Right(testListEvent));
    //Act
    final result = await getAllEvent.execute();
    //Assert
    expect(result, Right(testListEvent));
  });
}
