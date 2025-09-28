part of 'qr_scanner_bloc.dart';

abstract class QrScannerEvent extends Equatable {
  const QrScannerEvent();

  @override
  List<Object?> get props => [];
}

class QrScannerStarted extends QrScannerEvent {}

class QrScannerCodeDetected extends QrScannerEvent {
  final String rawValue;

  const QrScannerCodeDetected(this.rawValue);

  @override
  List<Object?> get props => [rawValue];
}

class QrScannerReset extends QrScannerEvent {}
