import 'package:sport_events/user/domain/entity/supporter.dart';

abstract class SupporterRepository {
  Future<Supporter?> getById(String id);
}
