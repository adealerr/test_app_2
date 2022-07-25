import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'photo_model.freezed.dart';
part 'photo_model.g.dart';

@freezed
@HiveType(typeId: 7)
class PhotoModel with _$PhotoModel {
  const factory PhotoModel({
    @HiveField(0)
    required int albumId,
    @HiveField(1)
    required int id,
    @HiveField(2)
    required String title,
    @HiveField(3)
    required String url,
    @HiveField(4)
    required String thumbnailUrl,
  }) = _PhotoModel;

  factory PhotoModel.fromJson(Map<String, dynamic> json) => _$PhotoModelFromJson(json);
}
