// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_cards_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankCardModel _$BankCardModelFromJson(Map<String, dynamic> json) =>
    BankCardModel(
      numCard: json['numCard'] as int,
      cvv: json['cvv'] as int,
    );

Map<String, dynamic> _$BankCardModelToJson(BankCardModel instance) =>
    <String, dynamic>{
      'numCard': instance.numCard,
      'cvv': instance.cvv,
    };
