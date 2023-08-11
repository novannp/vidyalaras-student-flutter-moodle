import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lms_pptik/src/domain/usecase/calendar/calendar.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/test_helper.mocks.dart';

void main() {
  late MockCalendarRepository calendarRepository;
  late DeleteEvent deleteEvent;

  setUp(() {
    calendarRepository = MockCalendarRepository();
    deleteEvent = DeleteEvent(calendarRepository);
  });

  test('should return success when delete event success', () async {
    //Arrange
    when(calendarRepository.deleteEvent(1, true))
        .thenAnswer((_) async => const Right(true));
    //Act
    final result = await deleteEvent.execute(1, true);
    //Assert
    expect(result, const Right(true));
  });
}
