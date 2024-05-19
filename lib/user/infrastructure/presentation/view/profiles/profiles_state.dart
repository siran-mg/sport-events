import 'package:sport_events/user/domain/entity/user.dart';

sealed class ProfilesState {}

class Loading extends ProfilesState {}

class Success extends ProfilesState {
  Success({required this.user});

  final User user;
}

class UserProfilesNotFound extends ProfilesState {}
