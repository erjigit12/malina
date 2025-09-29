// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basket_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BasketItemModel {

 String get id; String get category; String get subcategory; String get name; double get price; int get quantity; String? get description; String? get imagePath; DateTime get createdAt;
/// Create a copy of BasketItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BasketItemModelCopyWith<BasketItemModel> get copyWith => _$BasketItemModelCopyWithImpl<BasketItemModel>(this as BasketItemModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BasketItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.subcategory, subcategory) || other.subcategory == subcategory)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.description, description) || other.description == description)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,category,subcategory,name,price,quantity,description,imagePath,createdAt);

@override
String toString() {
  return 'BasketItemModel(id: $id, category: $category, subcategory: $subcategory, name: $name, price: $price, quantity: $quantity, description: $description, imagePath: $imagePath, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $BasketItemModelCopyWith<$Res>  {
  factory $BasketItemModelCopyWith(BasketItemModel value, $Res Function(BasketItemModel) _then) = _$BasketItemModelCopyWithImpl;
@useResult
$Res call({
 String id, String category, String subcategory, String name, double price, int quantity, String? description, String? imagePath, DateTime createdAt
});




}
/// @nodoc
class _$BasketItemModelCopyWithImpl<$Res>
    implements $BasketItemModelCopyWith<$Res> {
  _$BasketItemModelCopyWithImpl(this._self, this._then);

  final BasketItemModel _self;
  final $Res Function(BasketItemModel) _then;

/// Create a copy of BasketItemModel
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


/// Adds pattern-matching-related methods to [BasketItemModel].
extension BasketItemModelPatterns on BasketItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BasketItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BasketItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BasketItemModel value)  $default,){
final _that = this;
switch (_that) {
case _BasketItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BasketItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _BasketItemModel() when $default != null:
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
case _BasketItemModel() when $default != null:
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
case _BasketItemModel():
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
case _BasketItemModel() when $default != null:
return $default(_that.id,_that.category,_that.subcategory,_that.name,_that.price,_that.quantity,_that.description,_that.imagePath,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _BasketItemModel extends BasketItemModel {
  const _BasketItemModel({required this.id, required this.category, required this.subcategory, required this.name, required this.price, required this.quantity, this.description, this.imagePath, required this.createdAt}): super._();
  

@override final  String id;
@override final  String category;
@override final  String subcategory;
@override final  String name;
@override final  double price;
@override final  int quantity;
@override final  String? description;
@override final  String? imagePath;
@override final  DateTime createdAt;

/// Create a copy of BasketItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BasketItemModelCopyWith<_BasketItemModel> get copyWith => __$BasketItemModelCopyWithImpl<_BasketItemModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BasketItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.subcategory, subcategory) || other.subcategory == subcategory)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.description, description) || other.description == description)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,category,subcategory,name,price,quantity,description,imagePath,createdAt);

@override
String toString() {
  return 'BasketItemModel(id: $id, category: $category, subcategory: $subcategory, name: $name, price: $price, quantity: $quantity, description: $description, imagePath: $imagePath, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$BasketItemModelCopyWith<$Res> implements $BasketItemModelCopyWith<$Res> {
  factory _$BasketItemModelCopyWith(_BasketItemModel value, $Res Function(_BasketItemModel) _then) = __$BasketItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String category, String subcategory, String name, double price, int quantity, String? description, String? imagePath, DateTime createdAt
});




}
/// @nodoc
class __$BasketItemModelCopyWithImpl<$Res>
    implements _$BasketItemModelCopyWith<$Res> {
  __$BasketItemModelCopyWithImpl(this._self, this._then);

  final _BasketItemModel _self;
  final $Res Function(_BasketItemModel) _then;

/// Create a copy of BasketItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? category = null,Object? subcategory = null,Object? name = null,Object? price = null,Object? quantity = null,Object? description = freezed,Object? imagePath = freezed,Object? createdAt = null,}) {
  return _then(_BasketItemModel(
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
