// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'album_wrapper_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AlbumWrapperModel _$AlbumWrapperModelFromJson(Map<String, dynamic> json) {
  return _AlbumWrapperModel.fromJson(json);
}

/// @nodoc
mixin _$AlbumWrapperModel {
  @HiveField(0)
  int get userId => throw _privateConstructorUsedError;
  @HiveField(1)
  List<AlbumModel> get albums => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumWrapperModelCopyWith<AlbumWrapperModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumWrapperModelCopyWith<$Res> {
  factory $AlbumWrapperModelCopyWith(
          AlbumWrapperModel value, $Res Function(AlbumWrapperModel) then) =
      _$AlbumWrapperModelCopyWithImpl<$Res>;
  $Res call({@HiveField(0) int userId, @HiveField(1) List<AlbumModel> albums});
}

/// @nodoc
class _$AlbumWrapperModelCopyWithImpl<$Res>
    implements $AlbumWrapperModelCopyWith<$Res> {
  _$AlbumWrapperModelCopyWithImpl(this._value, this._then);

  final AlbumWrapperModel _value;
  // ignore: unused_field
  final $Res Function(AlbumWrapperModel) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? albums = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      albums: albums == freezed
          ? _value.albums
          : albums // ignore: cast_nullable_to_non_nullable
              as List<AlbumModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_AlbumWrapperModelCopyWith<$Res>
    implements $AlbumWrapperModelCopyWith<$Res> {
  factory _$$_AlbumWrapperModelCopyWith(_$_AlbumWrapperModel value,
          $Res Function(_$_AlbumWrapperModel) then) =
      __$$_AlbumWrapperModelCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) int userId, @HiveField(1) List<AlbumModel> albums});
}

/// @nodoc
class __$$_AlbumWrapperModelCopyWithImpl<$Res>
    extends _$AlbumWrapperModelCopyWithImpl<$Res>
    implements _$$_AlbumWrapperModelCopyWith<$Res> {
  __$$_AlbumWrapperModelCopyWithImpl(
      _$_AlbumWrapperModel _value, $Res Function(_$_AlbumWrapperModel) _then)
      : super(_value, (v) => _then(v as _$_AlbumWrapperModel));

  @override
  _$_AlbumWrapperModel get _value => super._value as _$_AlbumWrapperModel;

  @override
  $Res call({
    Object? userId = freezed,
    Object? albums = freezed,
  }) {
    return _then(_$_AlbumWrapperModel(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      albums: albums == freezed
          ? _value._albums
          : albums // ignore: cast_nullable_to_non_nullable
              as List<AlbumModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AlbumWrapperModel implements _AlbumWrapperModel {
  const _$_AlbumWrapperModel(
      {@HiveField(0) required this.userId,
      @HiveField(1) required final List<AlbumModel> albums})
      : _albums = albums;

  factory _$_AlbumWrapperModel.fromJson(Map<String, dynamic> json) =>
      _$$_AlbumWrapperModelFromJson(json);

  @override
  @HiveField(0)
  final int userId;
  final List<AlbumModel> _albums;
  @override
  @HiveField(1)
  List<AlbumModel> get albums {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_albums);
  }

  @override
  String toString() {
    return 'AlbumWrapperModel(userId: $userId, albums: $albums)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AlbumWrapperModel &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other._albums, _albums));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(_albums));

  @JsonKey(ignore: true)
  @override
  _$$_AlbumWrapperModelCopyWith<_$_AlbumWrapperModel> get copyWith =>
      __$$_AlbumWrapperModelCopyWithImpl<_$_AlbumWrapperModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AlbumWrapperModelToJson(
      this,
    );
  }
}

abstract class _AlbumWrapperModel implements AlbumWrapperModel {
  const factory _AlbumWrapperModel(
          {@HiveField(0) required final int userId,
          @HiveField(1) required final List<AlbumModel> albums}) =
      _$_AlbumWrapperModel;

  factory _AlbumWrapperModel.fromJson(Map<String, dynamic> json) =
      _$_AlbumWrapperModel.fromJson;

  @override
  @HiveField(0)
  int get userId;
  @override
  @HiveField(1)
  List<AlbumModel> get albums;
  @override
  @JsonKey(ignore: true)
  _$$_AlbumWrapperModelCopyWith<_$_AlbumWrapperModel> get copyWith =>
      throw _privateConstructorUsedError;
}
