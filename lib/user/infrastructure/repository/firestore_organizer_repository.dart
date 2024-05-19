import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sport_events/core/firestore/collections.dart';
import 'package:sport_events/user/domain/entity/organizer.dart';
import 'package:sport_events/user/domain/repository/organizer_repository.dart';
import 'package:sport_events/user/infrastructure/data/organizer_model.dart';

class FirestoreOrganizerRepository extends OrganizerRepository {
  final _collectionReference = FirebaseFirestore.instance
      .collection(FirestoreCollection.organizers.name)
      .withConverter(
          fromFirestore: (snapshot, _) =>
              OrganizerModel.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson());

  @override
  Future<Organizer?> getById(String id) {
    return _collectionReference
        .where("id", isEqualTo: id)
        .get()
        .then((value) => value.docs.firstOrNull?.data().toDomain());
  }
}
