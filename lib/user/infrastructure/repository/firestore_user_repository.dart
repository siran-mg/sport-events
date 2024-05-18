import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sport_events/core/firestore/collections.dart';
import 'package:sport_events/user/domain/entity/player.dart';
import 'package:sport_events/user/domain/entity/supporter.dart';
import 'package:sport_events/user/domain/entity/team.dart';
import 'package:sport_events/user/domain/entity/user.dart';
import 'package:sport_events/user/domain/repository/organizer_repository.dart';
import 'package:sport_events/user/domain/repository/player_repository.dart';
import 'package:sport_events/user/domain/repository/supporter_repository.dart';
import 'package:sport_events/user/domain/repository/team_repository.dart';
import 'package:sport_events/user/domain/repository/user_repository.dart';
import 'package:sport_events/user/infrastructure/data/user_model.dart';

class FirestoreUserRepository extends UserRepository {
  FirestoreUserRepository({
    required this.organizationRepository,
    required this.teamRepository,
    required this.playerRepository,
    required this.supporterRepository,
  });

  final OrganizerRepository organizationRepository;
  final TeamRepository teamRepository;
  final PlayerRepository playerRepository;
  final SupporterRepository supporterRepository;

  @override
  Future<User?> getUserByAuthId(String authId) async {
    final userQuerySnapshot = await FirebaseFirestore.instance
        .collection(FirestoreCollection.user.value)
        .where("authId", isEqualTo: authId)
        .withConverter(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        )
        .get();
    final userModel = userQuerySnapshot.docs.firstOrNull?.data();
    if (userModel == null) {
      return null;
    }
    final organizerFuture = userModel.isOrganizer()
        ? Future.value()
        : organizationRepository.getById(userModel.organizerId!);
    final teamsFuture = userModel.hasTeam()
        ? Future.value(<Team>[])
        : teamRepository.getTeams(userModel.teamIds.map((e) => e!).toList());
    final playersFuture = userModel.hasPlayerProfile()
        ? Future.value(<Player>[])
        : playerRepository
            .getPlayers(userModel.playerIds.map((e) => e!).toList());
    final supporterFuture = userModel.isSupporter()
        ? Future.value(<Supporter>[])
        : supporterRepository.getById(userModel.supporterId!);

    final [organizer, teams, players, supporter] = await Future.wait([
      organizerFuture,
      teamsFuture,
      playersFuture,
      supporterFuture,
    ]);
    return User(
      authId: authId,
      teams: teams,
      players: players,
      supporter: supporter,
      organizer: organizer,
    );
  }
}
