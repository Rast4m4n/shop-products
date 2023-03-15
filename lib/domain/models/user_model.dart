import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  UserModel({
    required this.phoneNumber,
    required this.fio,
    required this.street,
    required this.mail,
    required this.entrance,
    required this.floor,
    required this.flat,
  });

  final String phoneNumber;
  final String? fio;
  final String? street;
  final String? mail;
  final String? entrance;
  final String? floor;
  final String? flat;

  factory UserModel.fromJson(Map<String, dynamic> data) =>
      _$UserModelFromJson(data);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    String? phoneNumber,
    String? fio,
    String? street,
    String? mail,
    String? entrance,
    String? floor,
    String? flat,
  }) {
    return UserModel(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      fio: fio ?? this.fio,
      street: street ?? this.street,
      mail: mail ?? this.mail,
      entrance: entrance ?? this.entrance,
      floor: floor ?? this.floor,
      flat: flat ?? this.flat,
    );
  }
}
