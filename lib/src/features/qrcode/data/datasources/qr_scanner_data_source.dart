import 'package:malina/src/features/qrcode/data/models/qr_product_model.dart';

abstract class QrScannerDataSource {
  QrProductModel parse(String rawValue);
}

class QrScannerDataSourceImpl implements QrScannerDataSource {
  @override
  QrProductModel parse(String rawValue) {
    try {
      final sanitized = rawValue.trim();
      if (sanitized.isEmpty) throw FormatException(_errorMessage(rawValue));

      if (_looksLikeJson(sanitized)) {
        final model = QrProductModel.fromRawJson(sanitized);
        final mappedCategory = _mapCategory(model.category);
        if (mappedCategory == null) {
          throw FormatException(_errorMessage(rawValue));
        }
        return model.copyWith(category: mappedCategory);
      }

      return QrProductModel.fromMap(_parsePlainText(sanitized));
    } catch (_) {
      throw FormatException(_errorMessage(rawValue));
    }
  }

  Map<String, dynamic> _parsePlainText(String value) {
    final lines =
        value
            .split(RegExp(r"\r?\n"))
            .where((line) => line.trim().isNotEmpty)
            .toList();
    if (lines.isEmpty) throw FormatException('');

    final parts = lines.first.split('/').map((p) => p.trim()).toList();
    if (parts.length < 4) throw FormatException('');

    final mappedCategory = _mapCategory(parts[0]);
    if (mappedCategory == null) throw FormatException('');

    final description = lines.length > 1 ? lines.sublist(1).join(' ').trim() : null;

    final price = double.tryParse(parts[3].replaceAll(',', '.'));
    if (price == null) throw FormatException('');

    return {
      'id': parts.length > 4 ? parts[4] : parts[0],
      'category': mappedCategory,
      'subcategory': parts[1],
      'name': parts[2],
      'price': price,
      'description': description,
    };
  }

  bool _looksLikeJson(String value) {
    return value.startsWith('{') && value.endsWith('}');
  }

  String? _mapCategory(String rawCategory) {
    final normalized = rawCategory.trim().toLowerCase();
    if (normalized.startsWith('food')) {
      return 'Еда';
    }
    if (normalized.startsWith('beauty')) {
      return 'Бьюти';
    }
    return null;
  }

  String _errorMessage(String rawValue) => 'Некорректный формат QR: $rawValue';
}
