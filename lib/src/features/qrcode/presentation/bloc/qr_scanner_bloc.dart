import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:malina/src/features/qrcode/domain/entities/qr_product.dart';
import 'package:malina/src/features/qrcode/domain/usecases/parse_qr_code.dart';

part 'qr_scanner_event.dart';
part 'qr_scanner_state.dart';

class QrScannerBloc extends Bloc<QrScannerEvent, QrScannerState> {
  QrScannerBloc({required ParseQrCode parseQrCode})
      : _parseQrCode = parseQrCode,
        super(const QrScannerState()) {
    on<QrScannerStarted>((event, emit) {
      emit(const QrScannerState());
    });

    on<QrScannerCodeDetected>((event, emit) async {
      try {
        final product = await _parseQrCode(event.rawValue);
        emit(QrScannerState(status: QrScannerStatus.success, product: product));
      } on FormatException {
        emit(QrScannerState(status: QrScannerStatus.failure, message: 'Некорректный QR: ${event.rawValue}'));
      } catch (_) {
        emit(const QrScannerState(status: QrScannerStatus.failure, message: 'Не удалось распознать QR-код'));
      }
    });

    on<QrScannerReset>((event, emit) {
      emit(const QrScannerState());
    });
  }

  final ParseQrCode _parseQrCode;
}
