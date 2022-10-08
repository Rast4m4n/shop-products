class BankCardModel {
  BankCardModel({
    required this.numCard,
    required this.expirationDate,
    required this.cvv,
  });
  final int numCard;
  final int expirationDate; // дата по истечению срока работы карточки
  final int cvv;
}
