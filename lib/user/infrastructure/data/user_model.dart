import 'dart:convert';

class UserModel {
  final String authId;
  final String? organizerId;
  final List<String?> teamIds;
  final List<String?> playerIds;
  final String? supporterId;

  UserModel({
    required this.authId,
    this.organizerId,
    this.teamIds = const [],
    this.playerIds = const [],
    this.supporterId,
  });

  static UserModel fromJson(Map<String, dynamic> data) {
    return UserModel(
      authId: data['authId'],
      organizerId: data['organizerId'],
      teamIds: json.decode(data['teamIds']).toList(),
      playerIds: json.decode(data['playerIds']).toList(),
      supporterId: data['supporterId'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['authId'] = authId;
    map['organizerId'] = organizerId;
    map['teamIds'] = teamIds;
    map['playerIds'] = playerIds;
    map['supporterId'] = supporterId;
    return map;
  }

  bool isOrganizer() => organizerId != null;

  bool hasTeam() => teamIds.isNotEmpty;

  bool hasPlayerProfile() => playerIds.isNotEmpty;

  bool isSupporter() => supporterId != null;
}
