import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sport_events/core/firestore/collections.dart';
import 'package:sport_events/user/domain/entity/player.dart';
import 'package:sport_events/user/domain/repository/player_repository.dart';
import 'package:sport_events/user/infrastructure/data/player_model.dart';

class FirestorePlayerRepository extends PlayerRepository {
  final _collectionReference = FirebaseFirestore.instance
      .collection(FirestoreCollection.players.name)
      .withConverter(
        fromFirestore: (snapshot, _) => PlayerModel.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson(),
      );

  @override
  Future<List<Player?>> getPlayers(List<String> ids) async {
    return await _collectionReference
        .where("id", whereIn: ids)
        .get()
        .then((value) => value.docs.map((e) => e.data().toDomain()).toList());
  }
}
