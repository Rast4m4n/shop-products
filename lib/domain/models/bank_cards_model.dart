class BankCardModel {
  BankCardModel({
    required this.numCard,
    required this.expirationDate,
    required this.cvv,
  });
  final int numCard;
  final int expirationDate; // дата по истечению срока работы карточки
  final int cvv;

  factory BankCardModel.fromJson(Map<String, dynamic> json) => BankCardModel(
        numCard: json["numCard"],
        expirationDate: json["expirationDate"],
        cvv: json["cvv"],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "numCard": numCard,
        "expirationDate": expirationDate,
        "cvv": cvv,
      };
}
