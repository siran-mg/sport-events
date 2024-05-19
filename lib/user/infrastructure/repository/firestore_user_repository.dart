import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sport_events/core/firestore/collections.dart';
import 'package:sport_events/user/domain/entity/player.dart';
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

  final _userCollection = FirebaseFirestore.instance
      .collection(FirestoreCollection.users.name)
      .withConverter(
        fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson(),
      );

  @override
  Future<User?> getUserByAuthId(String authId) async {
    final userQuerySnapshot =
        await _userCollection.where("authId", isEqualTo: authId).get();

    final userModel = userQuerySnapshot.docs.firstOrNull?.data();
    if (userModel == null) {
      return null;
    }
    final organizerFuture = userModel.isOrganizer()
        ? organizationRepository.getById(userModel.organizerId!)
        : Future.value();
    final teamsFuture = userModel.hasTeam()
        ? teamRepository.getTeams(userModel.teamIds.map((e) => e!).toList())
        : Future.value(<Team>[]);
    final playersFuture = userModel.hasPlayerProfile()
        ? playerRepository
            .getPlayers(userModel.playerIds.map((e) => e!).toList())
        : Future.value(<Player>[]);
    final supporterFuture = userModel.isSupporter()
        ? supporterRepository.getById(userModel.supporterId!)
        : Future.value();

    final [organizer, teams, players, supporter] = await Future.wait([
      organizerFuture,
      teamsFuture,
      playersFuture,
      supporterFuture,
    ]);
    return User(
      id: userModel.id,
      authId: authId,
      teams: teams as List<Team>,
      players: players as List<Player>,
      supporter: supporter,
      organizer: organizer,
    );
  }

  @override
  Future<void> createUser(User user) {
    return _userCollection.add(UserModel.fromDomain(user));
  }

  @override
  Future<bool> isUserExist(String authId) {
    return _userCollection
        .where("authId", isEqualTo: authId)
        .limit(1)
        .get()
        .then((value) => value.docs.isNotEmpty);
  }
}
