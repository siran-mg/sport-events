import 'package:sport_events/user/domain/value_object/person_name.dart';
import 'package:uuid/uuid.dart';

class Supporter {
  late String? id = const Uuid().v4();
  final PersonName? name;

  Supporter({
    this.id,
    this.name,
  });
}
