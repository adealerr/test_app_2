import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'company_model.freezed.dart';
part 'company_model.g.dart';

@freezed
@HiveType(typeId: 3)
class CompanyModel with _$CompanyModel {
  const factory CompanyModel({
    @HiveField(0)
    required String name,
    @HiveField(1)
    required String catchPhrase,
    @HiveField(2)
    required String bs,
  }) = _CompanyModel;

  factory CompanyModel.fromJson(Map<String, dynamic> json) => _$CompanyModelFromJson(json);
}
