import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lms_pptik/src/domain/usecase/chat/chat.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_object.dart';
import '../../../helper/test_helper.mocks.dart';

void main() {
  late MockChatRepository chatRepository;
  late GetConversationsBetweenUser getConversationsBetweenUser;

  setUp(() {
    chatRepository = MockChatRepository();
    getConversationsBetweenUser = GetConversationsBetweenUser(chatRepository);
  });

  test(
      'should return ConversationModel when getConversationBetweenUser successfully',
      () async {
    int otherUserId = 1;
    //Arrange
    when(chatRepository.getConversationsBetweenUser(otherUserId))
        .thenAnswer((_) async => Right(testConversation));
    //Act
    final result = await getConversationsBetweenUser.execute(otherUserId);

    //Assert
    expect(result, Right(testConversation));
  });
}
