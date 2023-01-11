import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  UserModel({
    required this.fio,
    required this.phoneNumber,
    required this.address,
    required this.flat,
  });

  final String fio;
  final String phoneNumber;
  final String address;
  final String flat;

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
