import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String? name;

  @HiveField(1)
  final String? email;

  @HiveField(2)
  final String? photoURL;

  @HiveField(3)
  final String? id;

  UserModel({
    this.name,
    this.id,
    required this.email,
    this.photoURL,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
