import 'package:uuid/uuid.dart';

class Organizer {
  late String? id = const Uuid().v4();
  final String? name;

  Organizer({
    this.id,
    this.name,
  });
}
