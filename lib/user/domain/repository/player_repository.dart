import 'package:sport_events/user/domain/entity/player.dart';

abstract class PlayerRepository {
  Future<List<Player?>> getPlayers(List<String> ids);
}
