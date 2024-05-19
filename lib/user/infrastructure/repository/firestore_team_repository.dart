import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sport_events/core/firestore/collections.dart';
import 'package:sport_events/user/domain/entity/team.dart';
import 'package:sport_events/user/domain/repository/player_repository.dart';
import 'package:sport_events/user/domain/repository/team_repository.dart';
import 'package:sport_events/user/infrastructure/data/team_model.dart';

class FirestoreTeamRepository extends TeamRepository {
  final PlayerRepository playerRepository;
  final _collectionReference = FirebaseFirestore.instance
      .collection(FirestoreCollection.teams.name)
      .withConverter(
        fromFirestore: (snapshot, _) => TeamModel.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson(),
      );

  FirestoreTeamRepository({
    required this.playerRepository,
  });

  @override
  Future<List<Team?>> getTeams(List<String> id) async {
    return await _collectionReference
        .where("id", whereIn: id)
        .get()
        .then((value) => value.docs.map((e) => e.data().toDomain()).toList());
  }
}
