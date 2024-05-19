import 'package:sport_events/user/domain/value_object/team_name.dart';

class TeamNameModel {
  final String? shortName;
  final String? fullName;
  final String? abbreviation;

  TeamNameModel({
    this.shortName,
    this.fullName,
    this.abbreviation,
  });

  factory TeamNameModel.fromJson(Map<String, dynamic> json) => TeamNameModel(
        shortName: json['shortName'],
        fullName: json['fullName'],
        abbreviation: json['abbreviation'],
      );

  Map<String, dynamic> toJson() => {
        'shortName': shortName,
        'fullName': fullName,
        'abbreviation': abbreviation,
      };

  TeamName toDomain() {
    return TeamName(
      shortName: shortName,
      fullName: fullName,
      abbreviation: abbreviation,
    );
  }
}
