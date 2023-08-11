import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lms_pptik/src/domain/usecase/calendar/calendar.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_object.dart';
import '../../../helper/test_helper.mocks.dart';

void main() {
  late MockCalendarRepository calendarRepository;
  late AddEvent addEvent;

  setUp(() {
    calendarRepository = MockCalendarRepository();
    addEvent = AddEvent(calendarRepository);
  });

  test('should return true when add event success', () async {
    //Arrange
    when(calendarRepository.addEvent(testEvent, 1))
        .thenAnswer((_) async => const Right(true));
    //Act
    final result = await addEvent.execute(testEvent, 1);
    //Assert
    expect(result, const Right(true));
  });
}
