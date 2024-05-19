import 'package:sport_events/user/domain/value_object/person_name.dart';

class PersonNameModel {
  final String? givenName;
  final String? familyName;

  PersonNameModel({this.givenName, this.familyName});

  static PersonNameModel fromJson(Map<String, dynamic> json) {
    return PersonNameModel(
      givenName: json['givenName'],
      familyName: json['familyName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'givenName': givenName,
      'familyName': familyName,
    };
  }

  PersonName toDomain() {
    return PersonName(
      givenName: givenName,
      familyName: familyName,
    );
  }
}
