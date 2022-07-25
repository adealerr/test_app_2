import 'package:eclipse_test/data/models/album_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'album_wrapper_model.freezed.dart';
part 'album_wrapper_model.g.dart';

@freezed
@HiveType(typeId: 8)
class AlbumWrapperModel with _$AlbumWrapperModel {
  const factory AlbumWrapperModel({
    @HiveField(0)
    required int userId,
    @HiveField(1)
    required List<AlbumModel> albums,
  }) = _AlbumWrapperModel;

  factory AlbumWrapperModel.fromJson(Map<String, dynamic> json) => _$AlbumWrapperModelFromJson(json);
}
