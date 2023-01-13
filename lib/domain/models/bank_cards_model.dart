import 'package:json_annotation/json_annotation.dart';

part '../../data/mappers/bank_cards_model.g.dart';

@JsonSerializable()
class BankCardModel {
  BankCardModel({
    required this.numCard,
    required this.cvv,
  });
  final String numCard;
  final String cvv;

  Map<String, dynamic> toJson() => _$BankCardModelToJson(this);

  factory BankCardModel.fromJson(Map<String, dynamic> json) =>
      _$BankCardModelFromJson(json);
}
