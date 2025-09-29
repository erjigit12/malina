import 'package:malina/src/features/qrcode/data/datasources/qr_scanner_data_source.dart';
import 'package:malina/src/features/qrcode/domain/entities/qr_product.dart';
import 'package:malina/src/features/qrcode/domain/repositories/qr_scanner_repository.dart';

class QrScannerRepositoryImpl implements QrScannerRepository {
  QrScannerRepositoryImpl(this._dataSource);

  final QrScannerDataSource _dataSource;

  @override
  Future<QrProduct> parseCode(String rawValue) async {
    final model = _dataSource.parse(rawValue);
    return model.toEntity();
  }
}
