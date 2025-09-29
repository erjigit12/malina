import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_product.freezed.dart';

@freezed
abstract class QrProduct with _$QrProduct {
  const factory QrProduct({
    required String id,
    required String category,
    required String subcategory,
    required String name,
    required double price,
    String? description,
    String? image,
  }) = _QrProduct;
}
