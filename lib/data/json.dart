import 'package:shop_products/domain/models/goods_model.dart';

abstract class Json {
  static List<Map<String, dynamic>> goods = [
    {
      "id": 0,
      "nameGoods": "Филе грудки цыплёнка Петеленка",
      "compositionOfGoods": "соства",
      "pathImage": null,
      "weightGoods": "1000 г",
      "ratingGoods": 4.5,
      "priceGoods": 290,
      "numberOfGoods": 1,
      "favoriteGoods": false
    },
    {
      "id": 1,
      "nameGoods": "Чипсы Lay`s сметана и зелень",
      "compositionOfGoods": "соства",
      "pathImage": null,
      "weightGoods": "225 г",
      "ratingGoods": 4.7,
      "priceGoods": 160,
      "numberOfGoods": 1,
      "favoriteGoods": false
    },
    {
      "id": 2,
      "nameGoods": "Бананы фасованые",
      "compositionOfGoods": "соства",
      "pathImage": null,
      "weightGoods": "1500 г",
      "ratingGoods": 4.0,
      "priceGoods": 65,
      "numberOfGoods": 1,
      "favoriteGoods": false
    },
    {
      "id": 3,
      "nameGoods": "Яблоки красные",
      "compositionOfGoods": "соства",
      "pathImage": null,
      "weightGoods": "500 г",
      "ratingGoods": 4.4,
      "priceGoods": 55,
      "numberOfGoods": 1,
      "favoriteGoods": false
    },
    {
      "id": 4,
      "nameGoods": "Батон Коломенское нарезной",
      "compositionOfGoods": "соства",
      "pathImage": null,
      "weightGoods": "400 г",
      "ratingGoods": 4.8,
      "priceGoods": 50,
      "numberOfGoods": 1,
      "favoriteGoods": false
    },
    {
      "id": 5,
      "nameGoods": "Яйца куриные Окское столовое С1 10шт.",
      "compositionOfGoods": "соства",
      "pathImage": null,
      "weightGoods": "930 г",
      "ratingGoods": 4.7,
      "priceGoods": 85,
      "numberOfGoods": 1,
      "favoriteGoods": false
    },
    {
      "id": 6,
      "nameGoods": "Молоко Простоквашино отборное пастеризованное 3.4-4.5",
      "compositionOfGoods": "соства",
      "pathImage": null,
      "weightGoods": "70 г",
      "ratingGoods": 4.5,
      "priceGoods": 30,
      "numberOfGoods": 1,
      "favoriteGoods": false
    }
  ];

  static List<GoodsModel> cartGoods = [];
}
