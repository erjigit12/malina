import 'package:malina/src/features/qrcode/data/models/qr_product_model.dart';

abstract class QrScannerDataSource {
  QrProductModel parse(String rawValue);
}

class QrScannerDataSourceImpl implements QrScannerDataSource {
  @override
  QrProductModel parse(String rawValue) {
    try {
      return QrProductModel.fromJson(rawValue);
    } catch (_) {
      throw const FormatException('QR код не распознан');
    }
  }
}
