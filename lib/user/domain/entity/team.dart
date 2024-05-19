import 'package:sport_events/user/domain/entity/player.dart';
import 'package:sport_events/user/domain/value_object/team_name.dart';
import 'package:uuid/uuid.dart';

class Team {
  late String? id = const Uuid().v4();
  final TeamName? name;
  final List<Player?> players;

  Team({
    this.id,
    this.name,
    this.players = const [],
  });
}
