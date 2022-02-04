import 'package:json_annotation/json_annotation.dart';
import 'package:planta_ai/models/plants/plants_model.dart';
import 'package:planta_ai/models/plants/src_url/src_model.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String name;
  final String? photoURL;

  UserModel({
    required this.name,
    this.photoURL,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
