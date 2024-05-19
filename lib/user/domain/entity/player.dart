import 'package:sport_events/user/domain/value_object/person_name.dart';

class Player {
  final String id;
  final PersonName? name;

  Player({
    required this.id,
    this.name,
  });
}
