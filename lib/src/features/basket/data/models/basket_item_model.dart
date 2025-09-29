import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:malina/src/features/basket/domain/entities/basket_item_entity.dart';

part 'basket_item_model.freezed.dart';

@freezed
abstract class BasketItemModel with _$BasketItemModel {
  const BasketItemModel._();

  const factory BasketItemModel({
    required String id,
    required String category,
    required String subcategory,
    required String name,
    required double price,
    required int quantity,
    String? description,
    String? imagePath,
    required DateTime createdAt,
  }) = _BasketItemModel;

  factory BasketItemModel.fromEntity(BasketItemEntity entity) {
    return BasketItemModel(
      id: entity.id,
      category: entity.category,
      subcategory: entity.subcategory,
      name: entity.name,
      price: entity.price,
      quantity: entity.quantity,
      description: entity.description,
      imagePath: entity.imagePath,
      createdAt: entity.createdAt,
    );
  }

  BasketItemEntity toEntity() {
    return BasketItemEntity(
      id: id,
      category: category,
      subcategory: subcategory,
      name: name,
      price: price,
      quantity: quantity,
      description: description,
      imagePath: imagePath,
      createdAt: createdAt,
    );
  }
}

class BasketItemAdapter extends TypeAdapter<BasketItemModel> {
  @override
  final int typeId = 1;

  @override
  BasketItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return BasketItemModel(
      id: fields[0] as String,
      category: fields[1] as String,
      subcategory: fields[2] as String,
      name: fields[3] as String,
      price: (fields[4] as num).toDouble(),
      quantity: fields[5] as int,
      description: fields[6] as String?,
      imagePath: fields[7] as String?,
      createdAt: DateTime.fromMillisecondsSinceEpoch(fields[8] as int),
    );
  }

  @override
  void write(BinaryWriter writer, BasketItemModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.subcategory)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.quantity)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.imagePath)
      ..writeByte(8)
      ..write(obj.createdAt.millisecondsSinceEpoch);
  }
}
