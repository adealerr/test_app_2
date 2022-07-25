// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_wrapper_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlbumWrapperModelAdapter extends TypeAdapter<AlbumWrapperModel> {
  @override
  final int typeId = 8;

  @override
  AlbumWrapperModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AlbumWrapperModel(
      userId: fields[0] as int,
      albums: (fields[1] as List).cast<AlbumModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, AlbumWrapperModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.albums);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlbumWrapperModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AlbumWrapperModel _$$_AlbumWrapperModelFromJson(Map<String, dynamic> json) =>
    _$_AlbumWrapperModel(
      userId: json['userId'] as int,
      albums: (json['albums'] as List<dynamic>)
          .map((e) => AlbumModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AlbumWrapperModelToJson(
        _$_AlbumWrapperModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'albums': instance.albums,
    };
