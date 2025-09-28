import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:malina/src/core/core.dart';
import 'package:malina/src/features/features.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

enum QrScannerOrigin { addItem, home }

class QrScannerArgs {
  final QrScannerOrigin origin;

  const QrScannerArgs({required this.origin});
}

class QrScannerPage extends StatefulWidget {
  const QrScannerPage({super.key, required this.args});

  final QrScannerArgs args;

  @override
  State<QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  late final MobileScannerController _controller;
  bool _isHandling = false;

  @override
  void initState() {
    super.initState();
    _controller = MobileScannerController(
      formats: const [BarcodeFormat.qrCode],
      facing: CameraFacing.back,
    );
    _controller.start();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleDetection(BarcodeCapture capture, BuildContext context) {
    if (_isHandling) return;
    if (capture.barcodes.isEmpty) return;
    final barcode = capture.barcodes.first;
    final rawValue = barcode.rawValue;
    if (rawValue == null) return;

    _isHandling = true;
    _controller.stop();
    HapticFeedback.selectionClick();
    context.read<QrScannerBloc>().add(QrScannerCodeDetected(rawValue));
  }

  void _resetScanner(BuildContext context) {
    _isHandling = false;
    context.read<QrScannerBloc>().add(QrScannerReset());
    _controller.start();
  }

  Future<void> _onProductConfirmed(BuildContext context, QrProduct product) async {
    switch (widget.args.origin) {
      case QrScannerOrigin.addItem:
        Navigator.of(context).pop(product);
        break;
      case QrScannerOrigin.home:
        context.read<BasketBloc>().add(BasketItemAdded(_mapToBasketItem(product)));
        context.read<BasketBloc>().add(BasketCategorySelected(product.category));
        final router = GoRouter.of(context);
        Navigator.of(context).pop(product);
        router.push(AppRoutes.basket, extra: _categoryIndex(product.category));
        break;
    }
  }

  BasketItemEntity _mapToBasketItem(QrProduct product) {
    return BasketItemEntity(
      id: '',
      category: product.category,
      subcategory: product.subcategory,
      name: product.name,
      price: product.price,
      quantity: 1,
      description: product.description,
      imagePath: product.image,
      createdAt: DateTime.now(),
    );
  }

  int _categoryIndex(String category) {
    final normalized = category.toLowerCase();
    if (normalized == 'бьюти') return 1;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: BlocConsumer<QrScannerBloc, QrScannerState>(
          listenWhen: (prev, curr) => prev.status != curr.status,
          listener: (context, state) {
            if (state.status == QrScannerStatus.scanning) {
              _controller.start();
              _isHandling = false;
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                MobileScanner(
                  controller: _controller,
                  onDetect: (capture) => _handleDetection(capture, context),
                ),
                const QrScannerOverlay(),
                Positioned(
                  top: 16,
                  right: 16,
                  child: IconButton(
                    icon: Icon(Icons.close, color: AppColors.lightGrey),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Text(
                      'Поместите QR-код в рамку',
                      style: AppTextStyles.f18w400.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _buildBottomSection(context, state),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildBottomSection(BuildContext context, QrScannerState state) {
    switch (state.status) {
      case QrScannerStatus.scanning:
        return Padding(
          padding: const EdgeInsets.only(bottom: 48),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 220),
              Text(
                'Держите код неподвижно, сканирование произойдёт автоматически',
                style: AppTextStyles.f12w400.copyWith(color: Colors.white70),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      case QrScannerStatus.failure:
        return _ScannerMessage(
          message: state.message ?? 'QR-код не распознан',
          actionLabel: 'Попробовать снова',
          onAction: () => _resetScanner(context),
        );
      case QrScannerStatus.success:
        final product = state.product!;
        return QrProductPreview(
          product: product,
          onAdd: () => _onProductConfirmed(context, product),
        );
    }
  }
}

class _ScannerMessage extends StatelessWidget {
  const _ScannerMessage({
    required this.message,
    required this.onAction,
    required this.actionLabel,
  });

  final String message;
  final String actionLabel;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            style: AppTextStyles.f16w400.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ConfirmButton(title: actionLabel, onPressed: onAction),
        ],
      ),
    );
  }
}
