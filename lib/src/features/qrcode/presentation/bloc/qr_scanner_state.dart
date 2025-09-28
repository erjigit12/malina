part of 'qr_scanner_bloc.dart';

enum QrScannerStatus { scanning, success, failure }

class QrScannerState extends Equatable {
  final QrScannerStatus status;
  final QrProduct? product;
  final String? message;

  const QrScannerState({
    this.status = QrScannerStatus.scanning,
    this.product,
    this.message,
  });

  QrScannerState copyWith({
    QrScannerStatus? status,
    QrProduct? product,
    String? message,
  }) {
    return QrScannerState(
      status: status ?? this.status,
      product: product,
      message: message,
    );
  }

  @override
  List<Object?> get props => [status, product, message];
}
