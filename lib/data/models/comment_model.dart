import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

@freezed
@HiveType(typeId: 6)
class CommentModel with _$CommentModel {
  const factory CommentModel({
    @HiveField(0)
    required int postId,
    @HiveField(1)
    int? id,
    @HiveField(2)
    required String name,
    @HiveField(3)
    required String email,
    @HiveField(4)
    required String body,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) => _$CommentModelFromJson(json);
}
