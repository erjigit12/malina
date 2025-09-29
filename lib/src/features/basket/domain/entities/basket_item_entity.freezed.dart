// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basket_item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BasketItemEntity {

 String get id; String get category; String get subcategory; String get name; double get price; int get quantity; String? get description; String? get imagePath; DateTime get createdAt;
/// Create a copy of BasketItemEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BasketItemEntityCopyWith<BasketItemEntity> get copyWith => _$BasketItemEntityCopyWithImpl<BasketItemEntity>(this as BasketItemEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BasketItemEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.subcategory, subcategory) || other.subcategory == subcategory)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.description, description) || other.description == description)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,category,subcategory,name,price,quantity,description,imagePath,createdAt);

@override
String toString() {
  return 'BasketItemEntity(id: $id, category: $category, subcategory: $subcategory, name: $name, price: $price, quantity: $quantity, description: $description, imagePath: $imagePath, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $BasketItemEntityCopyWith<$Res>  {
  factory $BasketItemEntityCopyWith(BasketItemEntity value, $Res Function(BasketItemEntity) _then) = _$BasketItemEntityCopyWithImpl;
@useResult
$Res call({
 String id, String category, String subcategory, String name, double price, int quantity, String? description, String? imagePath, DateTime createdAt
});




}
/// @nodoc
class _$BasketItemEntityCopyWithImpl<$Res>
    implements $BasketItemEntityCopyWith<$Res> {
  _$BasketItemEntityCopyWithImpl(this._self, this._then);

  final BasketItemEntity _self;
  final $Res Function(BasketItemEntity) _then;

/// Create a copy of BasketItemEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? category = null,Object? subcategory = null,Object? name = null,Object? price = null,Object? quantity = null,Object? description = freezed,Object? imagePath = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,subcategory: null == subcategory ? _self.subcategory : subcategory // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [BasketItemEntity].
extension BasketItemEntityPatterns on BasketItemEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BasketItemEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BasketItemEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BasketItemEntity value)  $default,){
final _that = this;
switch (_that) {
case _BasketItemEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BasketItemEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BasketItemEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String category,  String subcategory,  String name,  double price,  int quantity,  String? description,  String? imagePath,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BasketItemEntity() when $default != null:
return $default(_that.id,_that.category,_that.subcategory,_that.name,_that.price,_that.quantity,_that.description,_that.imagePath,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String category,  String subcategory,  String name,  double price,  int quantity,  String? description,  String? imagePath,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _BasketItemEntity():
return $default(_that.id,_that.category,_that.subcategory,_that.name,_that.price,_that.quantity,_that.description,_that.imagePath,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String category,  String subcategory,  String name,  double price,  int quantity,  String? description,  String? imagePath,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _BasketItemEntity() when $default != null:
return $default(_that.id,_that.category,_that.subcategory,_that.name,_that.price,_that.quantity,_that.description,_that.imagePath,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _BasketItemEntity extends BasketItemEntity {
  const _BasketItemEntity({required this.id, required this.category, required this.subcategory, required this.name, required this.price, required this.quantity, this.description, this.imagePath, required this.createdAt}): super._();
  

@override final  String id;
@override final  String category;
@override final  String subcategory;
@override final  String name;
@override final  double price;
@override final  int quantity;
@override final  String? description;
@override final  String? imagePath;
@override final  DateTime createdAt;

/// Create a copy of BasketItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BasketItemEntityCopyWith<_BasketItemEntity> get copyWith => __$BasketItemEntityCopyWithImpl<_BasketItemEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BasketItemEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.subcategory, subcategory) || other.subcategory == subcategory)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.description, description) || other.description == description)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,category,subcategory,name,price,quantity,description,imagePath,createdAt);

@override
String toString() {
  return 'BasketItemEntity(id: $id, category: $category, subcategory: $subcategory, name: $name, price: $price, quantity: $quantity, description: $description, imagePath: $imagePath, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$BasketItemEntityCopyWith<$Res> implements $BasketItemEntityCopyWith<$Res> {
  factory _$BasketItemEntityCopyWith(_BasketItemEntity value, $Res Function(_BasketItemEntity) _then) = __$BasketItemEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String category, String subcategory, String name, double price, int quantity, String? description, String? imagePath, DateTime createdAt
});




}
/// @nodoc
class __$BasketItemEntityCopyWithImpl<$Res>
    implements _$BasketItemEntityCopyWith<$Res> {
  __$BasketItemEntityCopyWithImpl(this._self, this._then);

  final _BasketItemEntity _self;
  final $Res Function(_BasketItemEntity) _then;

/// Create a copy of BasketItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? category = null,Object? subcategory = null,Object? name = null,Object? price = null,Object? quantity = null,Object? description = freezed,Object? imagePath = freezed,Object? createdAt = null,}) {
  return _then(_BasketItemEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,subcategory: null == subcategory ? _self.subcategory : subcategory // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
