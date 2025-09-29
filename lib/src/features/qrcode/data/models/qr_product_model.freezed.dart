// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QrProductModel {

 String get id; String get category; String get subcategory; String get name; double get price; String? get description; String? get image;
/// Create a copy of QrProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QrProductModelCopyWith<QrProductModel> get copyWith => _$QrProductModelCopyWithImpl<QrProductModel>(this as QrProductModel, _$identity);

  /// Serializes this QrProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QrProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.subcategory, subcategory) || other.subcategory == subcategory)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,category,subcategory,name,price,description,image);

@override
String toString() {
  return 'QrProductModel(id: $id, category: $category, subcategory: $subcategory, name: $name, price: $price, description: $description, image: $image)';
}


}

/// @nodoc
abstract mixin class $QrProductModelCopyWith<$Res>  {
  factory $QrProductModelCopyWith(QrProductModel value, $Res Function(QrProductModel) _then) = _$QrProductModelCopyWithImpl;
@useResult
$Res call({
 String id, String category, String subcategory, String name, double price, String? description, String? image
});




}
/// @nodoc
class _$QrProductModelCopyWithImpl<$Res>
    implements $QrProductModelCopyWith<$Res> {
  _$QrProductModelCopyWithImpl(this._self, this._then);

  final QrProductModel _self;
  final $Res Function(QrProductModel) _then;

/// Create a copy of QrProductModel
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


/// Adds pattern-matching-related methods to [QrProductModel].
extension QrProductModelPatterns on QrProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QrProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QrProductModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QrProductModel value)  $default,){
final _that = this;
switch (_that) {
case _QrProductModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QrProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _QrProductModel() when $default != null:
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
case _QrProductModel() when $default != null:
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
case _QrProductModel():
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
case _QrProductModel() when $default != null:
return $default(_that.id,_that.category,_that.subcategory,_that.name,_that.price,_that.description,_that.image);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QrProductModel extends QrProductModel {
  const _QrProductModel({this.id = '', this.category = '', this.subcategory = '', this.name = '', this.price = 0.0, this.description, this.image}): super._();
  factory _QrProductModel.fromJson(Map<String, dynamic> json) => _$QrProductModelFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String category;
@override@JsonKey() final  String subcategory;
@override@JsonKey() final  String name;
@override@JsonKey() final  double price;
@override final  String? description;
@override final  String? image;

/// Create a copy of QrProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QrProductModelCopyWith<_QrProductModel> get copyWith => __$QrProductModelCopyWithImpl<_QrProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QrProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QrProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.subcategory, subcategory) || other.subcategory == subcategory)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,category,subcategory,name,price,description,image);

@override
String toString() {
  return 'QrProductModel(id: $id, category: $category, subcategory: $subcategory, name: $name, price: $price, description: $description, image: $image)';
}


}

/// @nodoc
abstract mixin class _$QrProductModelCopyWith<$Res> implements $QrProductModelCopyWith<$Res> {
  factory _$QrProductModelCopyWith(_QrProductModel value, $Res Function(_QrProductModel) _then) = __$QrProductModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String category, String subcategory, String name, double price, String? description, String? image
});




}
/// @nodoc
class __$QrProductModelCopyWithImpl<$Res>
    implements _$QrProductModelCopyWith<$Res> {
  __$QrProductModelCopyWithImpl(this._self, this._then);

  final _QrProductModel _self;
  final $Res Function(_QrProductModel) _then;

/// Create a copy of QrProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? category = null,Object? subcategory = null,Object? name = null,Object? price = null,Object? description = freezed,Object? image = freezed,}) {
  return _then(_QrProductModel(
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
