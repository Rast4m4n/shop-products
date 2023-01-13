// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../domain/models/bank_cards_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankCardModel _$BankCardModelFromJson(Map<String, dynamic> json) =>
    BankCardModel(
      numCard: json['numCard'] as String,
      cvv: json['cvv'] as String,
    );

Map<String, dynamic> _$BankCardModelToJson(BankCardModel instance) =>
    <String, dynamic>{
      'numCard': instance.numCard,
      'cvv': instance.cvv,
    };
