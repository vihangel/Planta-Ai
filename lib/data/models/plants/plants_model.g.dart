// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plants_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlantsModel _$PlantsModelFromJson(Map<String, dynamic> json) {
  return PlantsModel(
    width: json['width'] as int?,
    height: json['height'] as int?,
    url: json['url'] as String?,
    id: json['id'] as int,
    src: json['src'] == null
        ? null
        : SrcModel.fromJson(json['src'] as Map<String, dynamic>),
    alt: json['alt'] as String?,
    photographer: json['photographer'] as String?,
    photographer_url: json['photographer_url'] as String?,
    photographer_id: json['photographer_id'] as int?,
    avg_color: json['avg_color'] as String?,
  )..liked = json['liked'] as bool?;
}

Map<String, dynamic> _$PlantsModelToJson(PlantsModel instance) =>
    <String, dynamic>{
      'photographer': instance.photographer,
      'photographer_url': instance.photographer_url,
      'url': instance.url,
      'photographer_id': instance.photographer_id,
      'avg_color': instance.avg_color,
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'liked': instance.liked,
      'src': instance.src,
      'alt': instance.alt,
    };
