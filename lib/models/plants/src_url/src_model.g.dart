// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'src_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SrcModel _$SrcModelFromJson(Map<String, dynamic> json) {
  return SrcModel(
    original: json['original'] as String,
    large2x: json['large2x'] as String?,
    large: json['large'] as String?,
    small: json['small'] as String?,
    portrait: json['portrait'] as String?,
    landscape: json['landscape'] as String?,
    tiny: json['tiny'] as String?,
  );
}

Map<String, dynamic> _$SrcModelToJson(SrcModel instance) => <String, dynamic>{
      'original': instance.original,
      'large2x': instance.large2x,
      'large': instance.large,
      'small': instance.small,
      'portrait': instance.portrait,
      'landscape': instance.landscape,
      'tiny': instance.tiny,
    };
