import 'package:malina/src/features/qrcode/domain/entities/qr_product.dart';
import 'package:malina/src/features/qrcode/domain/repositories/qr_scanner_repository.dart';

class ParseQrCode {
  final QrScannerRepository repository;

  const ParseQrCode(this.repository);

  Future<QrProduct> call(String rawValue) {
    return repository.parseCode(rawValue);
  }
}
