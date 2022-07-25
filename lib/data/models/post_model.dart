import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
@HiveType(typeId: 4)
class PostModel with _$PostModel {
  const factory PostModel({
    @HiveField(0)
    required int userId,
    @HiveField(1)
    required String title,
    @HiveField(2)
    required String body,
    @HiveField(3)
    int? id,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
}
