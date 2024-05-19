import 'package:sport_events/user/domain/entity/player.dart';
import 'package:sport_events/user/domain/value_object/team_name.dart';

class Team {
  final String id;
  final TeamName? name;
  final List<Player?> players;

  Team({
    required this.id,
    this.name,
    this.players = const [],
  });
}
