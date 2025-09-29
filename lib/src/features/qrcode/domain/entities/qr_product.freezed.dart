// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QrProduct {

 String get id; String get category; String get subcategory; String get name; double get price; String? get description; String? get image;
/// Create a copy of QrProduct
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QrProductCopyWith<QrProduct> get copyWith => _$QrProductCopyWithImpl<QrProduct>(this as QrProduct, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QrProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.subcategory, subcategory) || other.subcategory == subcategory)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image));
}


@override
int get hashCode => Object.hash(runtimeType,id,category,subcategory,name,price,description,image);

@override
String toString() {
  return 'QrProduct(id: $id, category: $category, subcategory: $subcategory, name: $name, price: $price, description: $description, image: $image)';
}


}

/// @nodoc
abstract mixin class $QrProductCopyWith<$Res>  {
  factory $QrProductCopyWith(QrProduct value, $Res Function(QrProduct) _then) = _$QrProductCopyWithImpl;
@useResult
$Res call({
 String id, String category, String subcategory, String name, double price, String? description, String? image
});




}
/// @nodoc
class _$QrProductCopyWithImpl<$Res>
    implements $QrProductCopyWith<$Res> {
  _$QrProductCopyWithImpl(this._self, this._then);

  final QrProduct _self;
  final $Res Function(QrProduct) _then;

/// Create a copy of QrProduct
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? category = null,Object? subcategory = null,Object? name = null,Object? price = null,Object? description = freezed,Object? image = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,subcategory: null == subcategory ? _self.subcategory : subcategory // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [QrProduct].
extension QrProductPatterns on QrProduct {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QrProduct value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QrProduct() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QrProduct value)  $default,){
final _that = this;
switch (_that) {
case _QrProduct():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QrProduct value)?  $default,){
final _that = this;
switch (_that) {
case _QrProduct() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String category,  String subcategory,  String name,  double price,  String? description,  String? image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QrProduct() when $default != null:
return $default(_that.id,_that.category,_that.subcategory,_that.name,_that.price,_that.description,_that.image);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String category,  String subcategory,  String name,  double price,  String? description,  String? image)  $default,) {final _that = this;
switch (_that) {
case _QrProduct():
return $default(_that.id,_that.category,_that.subcategory,_that.name,_that.price,_that.description,_that.image);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String category,  String subcategory,  String name,  double price,  String? description,  String? image)?  $default,) {final _that = this;
switch (_that) {
case _QrProduct() when $default != null:
return $default(_that.id,_that.category,_that.subcategory,_that.name,_that.price,_that.description,_that.image);case _:
  return null;

}
}

}

/// @nodoc


class _QrProduct implements QrProduct {
  const _QrProduct({required this.id, required this.category, required this.subcategory, required this.name, required this.price, this.description, this.image});
  

@override final  String id;
@override final  String category;
@override final  String subcategory;
@override final  String name;
@override final  double price;
@override final  String? description;
@override final  String? image;

/// Create a copy of QrProduct
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QrProductCopyWith<_QrProduct> get copyWith => __$QrProductCopyWithImpl<_QrProduct>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QrProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.subcategory, subcategory) || other.subcategory == subcategory)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image));
}


@override
int get hashCode => Object.hash(runtimeType,id,category,subcategory,name,price,description,image);

@override
String toString() {
  return 'QrProduct(id: $id, category: $category, subcategory: $subcategory, name: $name, price: $price, description: $description, image: $image)';
}


}

/// @nodoc
abstract mixin class _$QrProductCopyWith<$Res> implements $QrProductCopyWith<$Res> {
  factory _$QrProductCopyWith(_QrProduct value, $Res Function(_QrProduct) _then) = __$QrProductCopyWithImpl;
@override @useResult
$Res call({
 String id, String category, String subcategory, String name, double price, String? description, String? image
});




}
/// @nodoc
class __$QrProductCopyWithImpl<$Res>
    implements _$QrProductCopyWith<$Res> {
  __$QrProductCopyWithImpl(this._self, this._then);

  final _QrProduct _self;
  final $Res Function(_QrProduct) _then;

/// Create a copy of QrProduct
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? category = null,Object? subcategory = null,Object? name = null,Object? price = null,Object? description = freezed,Object? image = freezed,}) {
  return _then(_QrProduct(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,subcategory: null == subcategory ? _self.subcategory : subcategory // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
