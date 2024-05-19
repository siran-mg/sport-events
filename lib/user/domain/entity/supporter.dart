import 'package:sport_events/user/domain/value_object/person_name.dart';

class Supporter {
  final String id;
  final PersonName? name;

  Supporter({
    required this.id,
    this.name,
  });
}
