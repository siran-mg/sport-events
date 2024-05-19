import 'package:sport_events/user/domain/entity/user.dart';

class UserModel {
  final String authId;
  late String id;
  final String? organizerId;
  final List<String?> teamIds;
  final List<String?> playerIds;
  final String? supporterId;

  UserModel({
    required this.authId,
    required this.id,
    this.organizerId,
    this.teamIds = const [],
    this.playerIds = const [],
    this.supporterId,
  });

  static UserModel fromJson(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'],
      authId: data['authId'],
      organizerId: data['organizerId'],
      teamIds: List<String>.from(data['teamIds']),
      playerIds: List<String>.from(data['playerIds']),
      supporterId: data['supporterId'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
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

  static UserModel fromDomain(User user) {
    return UserModel(
      id: user.id,
      authId: user.authId,
      organizerId: user.organizer?.id,
      teamIds: user.teams.map((e) => e?.id).toList(),
      playerIds: user.players.map((e) => e?.id).toList(),
      supporterId: user.supporter?.id,
    );
  }
}
