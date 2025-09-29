import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:malina/src/features/qrcode/domain/entities/qr_product.dart';

part 'qr_product_model.freezed.dart';
part 'qr_product_model.g.dart';

@freezed
abstract class QrProductModel with _$QrProductModel {
  const QrProductModel._();

  const factory QrProductModel({
    @Default('') String id,
    @Default('') String category,
    @Default('') String subcategory,
    @Default('') String name,
    @Default(0.0) double price,
    String? description,
    String? image,
  }) = _QrProductModel;

  factory QrProductModel.fromJson(Map<String, dynamic> json) => _$QrProductModelFromJson(json);

  factory QrProductModel.fromMap(Map<String, dynamic> map) => QrProductModel.fromJson(map);

  factory QrProductModel.fromRawJson(String source) {
    final decoded = jsonDecode(source);
    if (decoded is Map<String, dynamic>) {
      return QrProductModel.fromJson(decoded);
    }
    throw const FormatException('Некорректный формат QR кода');
  }

  factory QrProductModel.fromEntity(QrProduct entity) {
    return QrProductModel(
      id: entity.id,
      category: entity.category,
      subcategory: entity.subcategory,
      name: entity.name,
      price: entity.price,
      description: entity.description,
      image: entity.image,
    );
  }

  QrProduct toEntity() {
    return QrProduct(
      id: id,
      category: category,
      subcategory: subcategory,
      name: name,
      price: price,
      description: description,
      image: image,
    );
  }
}
