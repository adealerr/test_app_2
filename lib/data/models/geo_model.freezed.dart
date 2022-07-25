// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'geo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GeoModel _$GeoModelFromJson(Map<String, dynamic> json) {
  return _GeoModel.fromJson(json);
}

/// @nodoc
mixin _$GeoModel {
  @HiveField(0)
  String get lat => throw _privateConstructorUsedError;
  @HiveField(1)
  String get lng => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeoModelCopyWith<GeoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoModelCopyWith<$Res> {
  factory $GeoModelCopyWith(GeoModel value, $Res Function(GeoModel) then) =
      _$GeoModelCopyWithImpl<$Res>;
  $Res call({@HiveField(0) String lat, @HiveField(1) String lng});
}

/// @nodoc
class _$GeoModelCopyWithImpl<$Res> implements $GeoModelCopyWith<$Res> {
  _$GeoModelCopyWithImpl(this._value, this._then);

  final GeoModel _value;
  // ignore: unused_field
  final $Res Function(GeoModel) _then;

  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_value.copyWith(
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_GeoModelCopyWith<$Res> implements $GeoModelCopyWith<$Res> {
  factory _$$_GeoModelCopyWith(
          _$_GeoModel value, $Res Function(_$_GeoModel) then) =
      __$$_GeoModelCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) String lat, @HiveField(1) String lng});
}

/// @nodoc
class __$$_GeoModelCopyWithImpl<$Res> extends _$GeoModelCopyWithImpl<$Res>
    implements _$$_GeoModelCopyWith<$Res> {
  __$$_GeoModelCopyWithImpl(
      _$_GeoModel _value, $Res Function(_$_GeoModel) _then)
      : super(_value, (v) => _then(v as _$_GeoModel));

  @override
  _$_GeoModel get _value => super._value as _$_GeoModel;

  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_$_GeoModel(
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GeoModel implements _GeoModel {
  const _$_GeoModel(
      {@HiveField(0) required this.lat, @HiveField(1) required this.lng});

  factory _$_GeoModel.fromJson(Map<String, dynamic> json) =>
      _$$_GeoModelFromJson(json);

  @override
  @HiveField(0)
  final String lat;
  @override
  @HiveField(1)
  final String lng;

  @override
  String toString() {
    return 'GeoModel(lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GeoModel &&
            const DeepCollectionEquality().equals(other.lat, lat) &&
            const DeepCollectionEquality().equals(other.lng, lng));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(lat),
      const DeepCollectionEquality().hash(lng));

  @JsonKey(ignore: true)
  @override
  _$$_GeoModelCopyWith<_$_GeoModel> get copyWith =>
      __$$_GeoModelCopyWithImpl<_$_GeoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeoModelToJson(
      this,
    );
  }
}

abstract class _GeoModel implements GeoModel {
  const factory _GeoModel(
      {@HiveField(0) required final String lat,
      @HiveField(1) required final String lng}) = _$_GeoModel;

  factory _GeoModel.fromJson(Map<String, dynamic> json) = _$_GeoModel.fromJson;

  @override
  @HiveField(0)
  String get lat;
  @override
  @HiveField(1)
  String get lng;
  @override
  @JsonKey(ignore: true)
  _$$_GeoModelCopyWith<_$_GeoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
