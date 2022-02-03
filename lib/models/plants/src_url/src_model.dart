import 'package:json_annotation/json_annotation.dart';
part 'src_model.g.dart';

@JsonSerializable()
class SrcModel {
  String original;
  String? large2x;
  String? large;
  String? small;
  String? portrait;
  String? landscape;
  String? tiny;

  SrcModel({
    required this.original,
    this.large2x,
    this.large,
    this.small,
    this.portrait,
    this.landscape,
    this.tiny,
  });

  factory SrcModel.fromJson(Map<String, dynamic> json) =>
      _$SrcModelFromJson(json);
  Map<String, dynamic> toJson() => _$SrcModelToJson(this);
}
