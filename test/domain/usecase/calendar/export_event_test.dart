import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lms_pptik/src/domain/usecase/calendar/calendar.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/test_helper.mocks.dart';

void main() {
  late MockCalendarRepository calendarRepository;
  late ExportEvent exportEvent;

  setUp(() {
    calendarRepository = MockCalendarRepository();
    exportEvent = ExportEvent(calendarRepository);
  });

  test('should return download link when export done', () async {
    //Arrange
    when(calendarRepository.exportEvents('month'))
        .thenAnswer((_) async => const Right('link'));
    //Act
    final result = await exportEvent.execute('month');
    //Assert
    expect(result, const Right('link'));
  });
}
