import 'package:lms_pptik/src/data/models/badge_model/badge_model.dart';
import 'package:lms_pptik/src/data/models/chat_model/chat_model.dart';
import 'package:lms_pptik/src/data/models/conversation_model/conversation.dart';
import 'package:lms_pptik/src/data/models/event_model.dart';

const token = '10ee3ef5ad67dd3fb8e7e42f4d0668d2';
final testBadge = BadgeModel(
  id: 1,
  name: 'Sample Badge',
  description: 'This is a sample badge',
  timecreated: 1628719200,
  timemodified: 1628722800,
  usercreated: 123,
  usermodified: 456,
  issuername: 'Sample Issuer',
  issuerurl: 'https://sampleissuer.com',
  issuercontact: 'contact@sampleissuer.com',
  expiredate: 1680000000,
  expireperiod: 30,
  type: 1,
  courseid: 789,
  message: 'Congratulations!',
  messagesubject: 'Badge Earned',
  attachment: 0,
  notification: 1,
  status: 0,
  issuedid: 987,
  uniquehash: 'samplehash',
  dateissued: 1630408800,
  dateexpire: 1633000800,
  visible: 1,
  email: 'user@example.com',
  version: '1.0',
  language: 'en',
  imageauthorname: 'Author Name',
  imageauthoremail: 'author@example.com',
  imageauthorurl: 'https://author.com',
  imagecaption: 'Badge Image',
  badgeurl: 'https://badgeurl.com/badge.png',
);

final testListBadge = [testBadge];
final testBadgeImage = "${testBadge.badgeurl}?token=$token";

final testEvent = EventModel(
  id: 1,
  name: 'Sample Event',
  description: 'This is a sample event',
  format: 1,
  courseid: 123,
  categoryid: 456,
  groupid: 789,
  userid: 987,
  repeatid: 0,
  eventtype: 'event',
  timestart: 1670000000,
  timeduration: 3600,
  visible: 1,
  sequence: 1,
  timemodified: 1670100000,
  subscriptionid: 555,
);

final testListEvent = [testEvent];

final testChat = ChatModel(id: 1);

final testConversation = ConversationModel(id: 1);
