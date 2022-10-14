class GoodsModel {
  GoodsModel({
    required this.nameGoods,
    required this.descriptionGoods,
    required this.compositionOfGoods,
    required this.pathImage,
    required this.weightGoods,
    required this.ratingGoods,
    required this.priceGoods,
    required this.numberOfGoods,
    required this.favoriteGoods,
  });
  final String nameGoods;
  final String descriptionGoods;
  final String compositionOfGoods; //состав продукта
  final String? pathImage;
  final String weightGoods;
  final double ratingGoods;
  final int priceGoods;
  final int numberOfGoods;
  final bool favoriteGoods;

  factory GoodsModel.fromJson(Map<String, dynamic> json) => GoodsModel(
        nameGoods: json["nameGoods"],
        descriptionGoods: json["descriptionGoods"],
        compositionOfGoods: json["compositionOfGoods"],
        pathImage: json["pathImage"],
        weightGoods: json["weightGoods"],
        ratingGoods: json["ratingGoods"],
        priceGoods: json["priceGoods"],
        numberOfGoods: json["numberOfGoods"],
        favoriteGoods: json["favoriteGoods"],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "nameGoods": nameGoods,
        "descriptionGoods": descriptionGoods,
        "compositionOfGoods": compositionOfGoods,
        "pathImage": pathImage,
        "weightGoods": weightGoods,
        "ratingGoods": ratingGoods,
        "priceGoods": priceGoods,
        "numberOfGoods": numberOfGoods,
        "favoriteGoods": favoriteGoods,
      };

  GoodsModel copyWith(
    String? nameGoods,
    String? descriptionGoods,
    String? compositionOfGoods,
    String? pathImage,
    String? weightGoods,
    double? ratingGoods,
    int? priceGoods,
    int? numberOfGoods,
    bool? favoriteGoods,
  ) {
    return GoodsModel(
      nameGoods: nameGoods ?? this.nameGoods,
      descriptionGoods: descriptionGoods ?? this.descriptionGoods,
      compositionOfGoods: compositionOfGoods ?? this.compositionOfGoods,
      pathImage: pathImage ?? this.pathImage,
      weightGoods: weightGoods ?? this.weightGoods,
      ratingGoods: ratingGoods ?? this.ratingGoods,
      priceGoods: priceGoods ?? this.priceGoods,
      numberOfGoods: numberOfGoods ?? this.numberOfGoods,
      favoriteGoods: favoriteGoods ?? this.favoriteGoods,
    );
  }
}
