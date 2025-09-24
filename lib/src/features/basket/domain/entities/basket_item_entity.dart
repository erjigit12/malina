import 'package:equatable/equatable.dart';

class BasketItemEntity extends Equatable {
  final String id;
  final String category;
  final String subcategory;
  final String name;
  final double price;
  final int quantity;
  final String? description;
  final String? imagePath;
  final DateTime createdAt;

  const BasketItemEntity({
    required this.id,
    required this.category,
    required this.subcategory,
    required this.name,
    required this.price,
    required this.quantity,
    this.description,
    this.imagePath,
    required this.createdAt,
  });

  BasketItemEntity copyWith({
    String? id,
    String? category,
    String? subcategory,
    String? name,
    double? price,
    int? quantity,
    String? description,
    String? imagePath,
    DateTime? createdAt,
  }) {
    return BasketItemEntity(
      id: id ?? this.id,
      category: category ?? this.category,
      subcategory: subcategory ?? this.subcategory,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  double get totalPrice => price * quantity;

  @override
  List<Object?> get props => [
        id,
        category,
        subcategory,
        name,
        price,
        quantity,
        description,
        imagePath,
        createdAt,
      ];
}
