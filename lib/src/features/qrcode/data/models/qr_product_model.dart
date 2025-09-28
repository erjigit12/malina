import 'dart:convert';

import 'package:malina/src/features/qrcode/domain/entities/qr_product.dart';

class QrProductModel extends QrProduct {
  const QrProductModel({
    required super.id,
    required super.category,
    required super.subcategory,
    required super.name,
    required super.price,
    super.description,
    super.image,
  });

  factory QrProductModel.fromMap(Map<String, dynamic> map) {
    return QrProductModel(
      id: map['id'] as String? ?? '',
      category: map['category'] as String? ?? '',
      subcategory: map['subcategory'] as String? ?? '',
      name: map['name'] as String? ?? '',
      price: (map['price'] as num?)?.toDouble() ?? 0,
      description: map['description'] as String?,
      image: map['image'] as String?,
    );
  }

  factory QrProductModel.fromJson(String source) {
    final decoded = jsonDecode(source);
    if (decoded is Map<String, dynamic>) {
      return QrProductModel.fromMap(decoded);
    }
    throw const FormatException('Некорректный формат QR кода');
  }
}
