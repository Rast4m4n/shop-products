// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../domain/models/user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      fio: json['fio'] as String,
      phoneNumber: json['phoneNumber'] as String,
      address: json['address'] as String,
      flat: json['flat'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'fio': instance.fio,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'flat': instance.flat,
    };
