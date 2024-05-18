import 'package:sport_events/user/domain/entity/organizer.dart';

abstract class OrganizerRepository {
  Future<Organizer?> getById(String id);
}
