import 'package:eclipse_test/data/models/address_model.dart';
import 'package:eclipse_test/data/models/company_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
@HiveType(typeId: 0)
class UserModel with _$UserModel {
  const UserModel._();
  const factory UserModel({
    @HiveField(0)
    required int id,
    @HiveField(1)
    required String name,
    @HiveField(2)
    required String username,
    @HiveField(3)
    required String email,
    @HiveField(4)
    required AddressModel address,
    @HiveField(5)
    required String phone,
    @HiveField(6)
    required String website,
    @HiveField(7)
    required CompanyModel company,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  // bool get hasEmoji => emoji != null;
}
