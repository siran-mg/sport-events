import 'package:sport_events/user/domain/entity/supporter.dart';
import 'package:sport_events/user/infrastructure/data/person_name_model.dart';

class SupporterModel {
  final String? id;
  final PersonNameModel? name;

  SupporterModel({
    this.id,
    this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name?.toJson(),
    };
  }

  static SupporterModel fromJson(Map<String, dynamic> json) {
    final name = json['name'] != null
        ? PersonNameModel.fromJson(json['name'])
        : PersonNameModel();
    return SupporterModel(
      id: json['id'],
      name: name,
    );
  }

  Supporter? toDomain() {
    return Supporter(
      id: id,
      name: name?.toDomain(),
    );
  }
}
