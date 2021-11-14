import 'package:flutter_application_1/models/users.dart';

class Room {
  final String club;
  final String name;
  final List<User> speakers;
  final List<User> followedBySpeakers;
  final List<User> others;

  const Room({
    required this.club,
    required this.name,
    required this.speakers,
    required this.followedBySpeakers,
    required this.others,
  });
}
