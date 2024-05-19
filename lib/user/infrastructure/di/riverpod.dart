import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sport_events/user/domain/repository/organizer_repository.dart';
import 'package:sport_events/user/domain/repository/player_repository.dart';
import 'package:sport_events/user/domain/repository/supporter_repository.dart';
import 'package:sport_events/user/domain/repository/team_repository.dart';
import 'package:sport_events/user/domain/repository/user_repository.dart';
import 'package:sport_events/user/domain/use_case/get_user_profiles.dart';
import 'package:sport_events/user/infrastructure/repository/firestore_organizer_repository.dart';
import 'package:sport_events/user/infrastructure/repository/firestore_player_repository.dart';
import 'package:sport_events/user/infrastructure/repository/firestore_supporter_repository.dart';
import 'package:sport_events/user/infrastructure/repository/firestore_team_repository.dart';
import 'package:sport_events/user/infrastructure/repository/firestore_user_repository.dart';

part 'riverpod.g.dart';

@riverpod
OrganizerRepository organizerRepository(OrganizerRepositoryRef ref) {
  return FirestoreOrganizerRepository();
}

@riverpod
PlayerRepository playerRepository(PlayerRepositoryRef ref) {
  return FirestorePlayerRepository();
}

@riverpod
TeamRepository teamRepository(TeamRepositoryRef ref) {
  return FirestoreTeamRepository(
      playerRepository: ref.read(playerRepositoryProvider));
}

@riverpod
SupporterRepository supporterRepository(SupporterRepositoryRef ref) {
  return FirestoreSupporterRepository();
}

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  return FirestoreUserRepository(
      organizationRepository: ref.read(organizerRepositoryProvider),
      teamRepository: ref.read(teamRepositoryProvider),
      playerRepository: ref.read(playerRepositoryProvider),
      supporterRepository: ref.read(supporterRepositoryProvider));
}

@riverpod
GetUserProfiles getUserProfiles(GetUserProfilesRef ref) {
  return GetUserProfiles(userRepository: ref.read(userRepositoryProvider));
}

@riverpod
String? currentUserId(CurrentUserIdRef ref) {
  return FirebaseAuth.instance.currentUser?.uid;
}
