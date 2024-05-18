class User {
  final String authId;
  final String? organizerId;
  final String? teamId;
  final String? playerId;
  final String? supporterId;

  User({
    required this.authId,
    this.organizerId,
    this.teamId,
    this.playerId,
    this.supporterId,
  });
}
