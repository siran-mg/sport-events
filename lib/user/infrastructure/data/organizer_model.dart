import 'package:sport_events/user/domain/entity/organizer.dart';

class OrganizerModel {
  final String id;
  final String name;

  OrganizerModel({
    required this.id,
    required this.name,
  });

  factory OrganizerModel.fromJson(Map<String, dynamic> json) {
    return OrganizerModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  Organizer? toDomain() {
    return Organizer(
      id: id,
      name: name,
    );
  }
}
