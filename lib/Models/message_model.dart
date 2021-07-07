import 'package:bloved/Models/user_model.dart';

class Message {
  final User sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool unread;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.unread,
  });
}

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: ironMan,
    time: '5:30 PM',
    text:
        "Yes I'm would like to meet. I'm at work right now let's meet at 6:00PM is that alright with you?",
    unread: true,
  ),
  Message(
    sender: captainAmerica,
    time: '4:30 PM',
    text:
        "Yes I'm would like to meet. I'm at work right now let's meet at 6:00PM is that alright with you?",
    unread: true,
  ),
  Message(
    sender: blackWindow,
    time: '3:30 PM',
    text:
        "Yes I'm would like to meet. I'm at work right now let's meet at 6:00PM is that alright with you?",
    unread: false,
  ),
  Message(
    sender: spiderMan,
    time: '2:30 PM',
    text: 'I\'m exposed now. Please help me to hide my identity.',
    unread: true,
  ),
  Message(
    sender: hulk,
    time: '1:30 PM',
    text: 'HULK SMASH!!',
    unread: false,
  ),
  Message(
    sender: thor,
    time: '12:30 PM',
    text:
        'I\'m hitting gym bro. I\'m immune to mortal deseases. Are you coming?',
    unread: false,
  ),
  Message(
    sender: scarletWitch,
    time: '11:30 AM',
    text: 'My twins are giving me headache. Give me some time please.',
    unread: false,
  ),
  Message(
    sender: captainMarvel,
    time: '12:45 AM',
    text: 'You\'re always special to me nick! But you know my struggle.',
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: ironMan,
    time: '5:30 PM',
    text:
        "Yes I'm would like to meet. I'm at work right now let's meet at 6:00PM is that alright with you?",
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text:
        "Yes I'm would like to meet. I'm at work right now let's meet at 6:00PM is that alright with you?",
    unread: true,
  ),
  Message(
    sender: ironMan,
    time: '3:45 PM',
    text: 'Take care of peter. Give him all the protection & his aunt.',
    unread: true,
  ),
  Message(
    sender: ironMan,
    time: '3:15 PM',
    text: 'I\'m always proud of her and blessed to have both of them.',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text:
        'But that spider kid is having some difficulties due his identity reveal by a blog called daily bugle.',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text:
        "Yes I'm would like to meet. I'm at work right now let's meet at 6:00PM is that alright with you?",
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text:
        "Yes I'm would like to meet. I'm at work right now let's meet at 6:00PM is that alright with you?",
    unread: true,
  ),
  Message(
    sender: ironMan,
    time: '2:00 PM',
    text:
        "Yes I'm would like to meet. I'm at work right now let's meet at 6:00PM is that alright with you?",
    unread: true,
  ),
];
