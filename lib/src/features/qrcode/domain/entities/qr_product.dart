import 'package:equatable/equatable.dart';

class QrProduct extends Equatable {
  final String id;
  final String category;
  final String subcategory;
  final String name;
  final double price;
  final String? description;
  final String? image;

  const QrProduct({
    required this.id,
    required this.category,
    required this.subcategory,
    required this.name,
    required this.price,
    this.description,
    this.image,
  });

  @override
  List<Object?> get props => [id, category, subcategory, name, price, description, image];
}
