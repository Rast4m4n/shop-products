import 'package:json_annotation/json_annotation.dart';

part '../../data/mappers/user_model.g.dart';

@JsonSerializable()
class UserModel {
  UserModel({
    required this.fio,
    required this.address,
    required this.phoneNumber,
    required this.flat,
  });

  final String fio;
  final String address;
  final String phoneNumber;
  final String flat;

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  UserModel copyWith({
    String? fio,
    String? address,
    String? phoneNumber,
    String? flat,
  }) {
    return UserModel(
      fio: fio ?? this.fio,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      flat: flat ?? this.flat,
    );
  }
}
