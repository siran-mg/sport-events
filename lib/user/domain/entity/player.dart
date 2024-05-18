import 'package:sport_events/user/domain/value_object/person_name.dart';
import 'package:uuid/uuid.dart';

class Player {
  final String id = const Uuid().v4();
  final PersonName? name;

  Player({
    this.name,
  });
}
