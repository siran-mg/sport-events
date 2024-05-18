import 'package:sport_events/user/domain/entity/user.dart';

abstract class UserRepository {
  Future<User?> getUserByAuthId(String authId);
}
