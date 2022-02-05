import 'package:json_annotation/json_annotation.dart';
import 'package:plantaai/data/models/plants/plants_model.dart';

part 'page_plants_model.g.dart';

@JsonSerializable()
class PagesPlantsModel {
  int page;
  int per_page;
  List<PlantsModel>? photos;
  String? next_page;

  PagesPlantsModel({
    this.photos,
    this.next_page,
    required this.page,
    required this.per_page,
  });

  factory PagesPlantsModel.fromJson(Map<String, dynamic> json) =>
      _$PagesPlantsModelFromJson(json);
  Map<String, dynamic> toJson() => _$PagesPlantsModelToJson(this);
}
