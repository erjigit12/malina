// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QrProductModel _$QrProductModelFromJson(Map<String, dynamic> json) =>
    _QrProductModel(
      id: json['id'] as String? ?? '',
      category: json['category'] as String? ?? '',
      subcategory: json['subcategory'] as String? ?? '',
      name: json['name'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      description: json['description'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$QrProductModelToJson(_QrProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'subcategory': instance.subcategory,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'image': instance.image,
    };
