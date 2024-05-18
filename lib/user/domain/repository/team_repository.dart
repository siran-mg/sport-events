import 'package:sport_events/user/domain/entity/team.dart';

abstract class TeamRepository {
  Future<List<Team>> getTeams(List<String> id);
}
