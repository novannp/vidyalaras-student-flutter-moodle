import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lms_pptik/src/domain/usecase/chat/chat.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_object.dart';
import '../../../helper/test_helper.mocks.dart';

void main() {
  late MockChatRepository chatRepository;
  late GetConversationMessage getConversationMessage;

  setUp(() {
    chatRepository = MockChatRepository();
    getConversationMessage = GetConversationMessage(chatRepository);
  });

  test('should return ChatModel when succesfully', () async {
    int convId = 1;
    //Arrange
    when(chatRepository.getConversationMessage(convId))
        .thenAnswer((_) async => Right(testChat));

    //Act

    final result = await getConversationMessage.execute(convId);
    //Assert
    expect(result, Right(testChat));
  });
}
