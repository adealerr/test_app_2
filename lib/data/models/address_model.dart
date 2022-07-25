import 'package:eclipse_test/data/models/geo_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
@HiveType(typeId: 1)
class AddressModel with _$AddressModel {
  const AddressModel._();
  const factory AddressModel({
    @HiveField(0)
    required String street,
    @HiveField(1)
    required String suite,
    @HiveField(2)
    required String city,
    @HiveField(3)
    required String zipcode,
    @HiveField(4)
    required GeoModel geo,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) => _$AddressModelFromJson(json);

// bool get hasEmoji => emoji != null;
}
