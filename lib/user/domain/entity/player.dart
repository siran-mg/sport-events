import 'package:sport_events/user/domain/value_object/person_name.dart';
import 'package:uuid/uuid.dart';

class Player {
  late String? id = const Uuid().v4();
  final PersonName? name;

  Player({
    this.id,
    this.name,
  });
}
