import 'package:uuid/uuid.dart';

class Organizer {
  final String id = const Uuid().v4();
  final String? name;

  Organizer({
    this.name,
  });
}
