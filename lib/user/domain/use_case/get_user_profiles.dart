import 'package:sport_events/user/domain/entity/user.dart';
import 'package:sport_events/user/domain/repository/user_repository.dart';

sealed class GetUserProfilesResult {}

class UserNotFound extends GetUserProfilesResult {}

class Result extends GetUserProfilesResult {
  Result({required this.value});

  final User value;
}

class GetUserProfiles {
  GetUserProfiles({
    required this.userRepository,
  });

  final UserRepository userRepository;

  Future<GetUserProfilesResult> execute({required String id}) async {
    final user = await userRepository.getUserByAuthId(id);
    if (user == null) {
      return UserNotFound();
    }
    return Result(value: user);
  }
}
