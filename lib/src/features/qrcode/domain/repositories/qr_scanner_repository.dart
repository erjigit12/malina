import 'package:malina/src/features/qrcode/domain/entities/qr_product.dart';

abstract class QrScannerRepository {
  Future<QrProduct> parseCode(String rawValue);
}
