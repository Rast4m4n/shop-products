enum CategoryEnum {
  vegetable(0),
  fruit(1),
  milk(2),
  eggs(3),
  drinks(4),
  snack(5),
  sweets(6),
  meat(7),
  seafood(8),
  teaAndCoffee(9),
  spicesAndSauces(10),
  bake(11);

  final int value;
  const CategoryEnum(this.value);
}

extension CategoryEnumExt on CategoryEnum {
  static String getName(int id) {
    if (id == CategoryEnum.vegetable.index) {
      return "Овощи";
    } else if (id == CategoryEnum.fruit.index) {
      return "Фрукты";
    } else if (id == CategoryEnum.milk.index) {
      return "Молочные продукты";
    } else if (id == CategoryEnum.eggs.index) {
      return "Яйца";
    } else if (id == CategoryEnum.drinks.index) {
      return "Напитки";
    } else if (id == CategoryEnum.snack.index) {
      return "Снеки";
    } else if (id == CategoryEnum.sweets.index) {
      return "Сладости";
    } else if (id == CategoryEnum.meat.index) {
      return "Мясо";
    } else if (id == CategoryEnum.seafood.index) {
      return "Морепродукты";
    } else if (id == CategoryEnum.teaAndCoffee.index) {
      return "Чай и кофе";
    } else if (id == CategoryEnum.spicesAndSauces.index) {
      return "Специи и соусу";
    } else if (id == CategoryEnum.bake.index) {
      return "Выпечка";
    } else {
      return "Овощи";
    }
  }
}
