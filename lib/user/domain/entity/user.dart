import 'package:sport_events/user/domain/entity/organizer.dart';
import 'package:sport_events/user/domain/entity/player.dart';
import 'package:sport_events/user/domain/entity/supporter.dart';
import 'package:sport_events/user/domain/entity/team.dart';
import 'package:uuid/uuid.dart';

class User {
  final String id = const Uuid().v4();
  final String authId;
  final Organizer? organizer;
  final List<Team?> teams;
  final List<Player?> players;
  final Supporter? supporter;

  User({
    required this.authId,
    this.organizer,
    this.teams = const [],
    this.players = const [],
    this.supporter,
  });
}
