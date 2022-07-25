import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'album_model.freezed.dart';
part 'album_model.g.dart';

@freezed
@HiveType(typeId: 5)
class AlbumModel with _$AlbumModel {
  const factory AlbumModel({
    @HiveField(0)
    required int userId,
    @HiveField(1)
    required int id,
    @HiveField(2)
    required String title,
  }) = _AlbumModel;

  factory AlbumModel.fromJson(Map<String, dynamic> json) => _$AlbumModelFromJson(json);
}
