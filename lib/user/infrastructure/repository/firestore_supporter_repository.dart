import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sport_events/core/firestore/collections.dart';
import 'package:sport_events/user/domain/entity/supporter.dart';
import 'package:sport_events/user/domain/repository/supporter_repository.dart';
import 'package:sport_events/user/infrastructure/data/supporter_model.dart';

class FirestoreSupporterRepository extends SupporterRepository {
  final _collectionReference = FirebaseFirestore.instance
      .collection(FirestoreCollection.supporters.name)
      .withConverter<SupporterModel>(
        fromFirestore: (snapshot, _) =>
            SupporterModel.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson(),
      );

  @override
  Future<Supporter?> getById(String id) {
    return _collectionReference
        .where("id", isEqualTo: id)
        .get()
        .then((value) => value.docs.firstOrNull?.data().toDomain());
  }
}
