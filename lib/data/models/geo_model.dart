import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'geo_model.freezed.dart';
part 'geo_model.g.dart';

@freezed
@HiveType(typeId: 2)
class GeoModel with _$GeoModel {
  const factory GeoModel({
    @HiveField(0)
    required String lat,
    @HiveField(1)
    required String lng,
  }) = _GeoModel;

  factory GeoModel.fromJson(Map<String, dynamic> json) => _$GeoModelFromJson(json);
}
