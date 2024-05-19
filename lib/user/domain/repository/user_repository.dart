import 'package:sport_events/user/domain/entity/user.dart';

abstract class UserRepository {
  Future<User?> getUserByAuthId(String authId);

  Future<void> createUser(User user);

  Future<bool> isUserExist(String authId);
}
