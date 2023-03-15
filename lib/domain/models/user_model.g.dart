// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      phoneNumber: json['phoneNumber'] as String,
      fio: json['fio'] as String?,
      street: json['street'] as String?,
      mail: json['mail'] as String?,
      entrance: json['entrance'] as String?,
      floor: json['floor'] as String?,
      flat: json['flat'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'fio': instance.fio,
      'street': instance.street,
      'mail': instance.mail,
      'entrance': instance.entrance,
      'floor': instance.floor,
      'flat': instance.flat,
    };
