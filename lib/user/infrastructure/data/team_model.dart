import 'dart:convert';

import 'package:sport_events/user/domain/entity/team.dart';
import 'package:sport_events/user/infrastructure/data/team_name_model.dart';

class TeamModel {
  final String id;
  final TeamNameModel? name;
  final List<String?>? playerIds;

  TeamModel({
    required this.id,
    this.name,
    this.playerIds,
  });

  factory TeamModel.fromJson(Map<String, dynamic> data) {
    final name = data['name'] != null
        ? TeamNameModel.fromJson(data['name'])
        : TeamNameModel();
    return TeamModel(
      id: data['id'],
      name: name,
      playerIds: json.decode(data['playerIds']).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name?.toJson(),
      'playerIds': playerIds,
    };
  }

  Team? toDomain() {
    return Team(
      id: id,
      name: name?.toDomain(),
    );
  }
}
