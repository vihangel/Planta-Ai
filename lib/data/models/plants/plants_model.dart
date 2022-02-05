import 'package:json_annotation/json_annotation.dart';
import 'package:planta_ai/data/models/plants/src_url/src_model.dart';

part 'plants_model.g.dart';

@JsonSerializable()
class PlantsModel {
  String? photographer;
  String? photographer_url;
  String? url;
  int? photographer_id;
  String? avg_color;
  int id;
  int? width;
  int? height;
  bool? liked;

  SrcModel? src;

  String? alt;
  PlantsModel({
    this.width,
    this.height,
    this.url,
    required this.id,
    this.src,
    this.alt,
    this.photographer,
    this.photographer_url,
    this.photographer_id,
    this.avg_color,
  });

  factory PlantsModel.fromJson(Map<String, dynamic> json) =>
      _$PlantsModelFromJson(json);
  Map<String, dynamic> toJson() => _$PlantsModelToJson(this);
}
