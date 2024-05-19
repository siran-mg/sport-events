import 'package:sport_events/user/domain/entity/player.dart';
import 'package:sport_events/user/infrastructure/data/person_name_model.dart';

class PlayerModel {
  final String id;
  final PersonNameModel? name;

  PlayerModel({
    required this.id,
    this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name?.toJson(),
    };
  }

  static PlayerModel fromJson(Map<String, dynamic> json) {
    final name = json['name'] != null
        ? PersonNameModel.fromJson(json['name'])
        : PersonNameModel();
    return PlayerModel(
      id: json['id'],
      name: name,
    );
  }

  Player? toDomain() {
    return Player(
      id: id,
      name: name?.toDomain(),
    );
  }
}
