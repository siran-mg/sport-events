import 'package:sport_events/user/domain/entity/organizer.dart';
import 'package:sport_events/user/domain/entity/player.dart';
import 'package:sport_events/user/domain/entity/supporter.dart';
import 'package:sport_events/user/domain/entity/team.dart';

class User {
  final String id;
  final String authId;
  final Organizer? organizer;
  final List<Team?> teams;
  final List<Player?> players;
  final Supporter? supporter;

  User({
    required this.authId,
    required this.id,
    this.organizer,
    this.teams = const [],
    this.players = const [],
    this.supporter,
  });
}
