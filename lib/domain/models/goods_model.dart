class GoodsModel {
  GoodsModel({
    required this.id,
    required this.nameGoods,
    required this.compositionOfGoods,
    required this.pathImage,
    required this.weightGoods,
    required this.ratingGoods,
    required this.priceGoods,
    required this.numberOfGoods,
    required this.favoriteGoods,
    required this.category,
  });
  final int id;
  final String nameGoods;
  final String compositionOfGoods;
  final String? pathImage;
  final String weightGoods;
  final double ratingGoods;
  final int priceGoods;
  final int numberOfGoods;
  final bool favoriteGoods;
  final String category;

  factory GoodsModel.fromJson(Map<String, dynamic> json) => GoodsModel(
        id: json["id"],
        nameGoods: json["nameGoods"],
        compositionOfGoods: json["compositionOfGoods"],
        pathImage: json["pathImage"],
        weightGoods: json["weightGoods"],
        ratingGoods: json["ratingGoods"],
        priceGoods: json["priceGoods"],
        numberOfGoods: json["numberOfGoods"],
        favoriteGoods: json["favoriteGoods"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "id": id,
        "nameGoods": nameGoods,
        "compositionOfGoods": compositionOfGoods,
        "pathImage": pathImage,
        "weightGoods": weightGoods,
        "ratingGoods": ratingGoods,
        "priceGoods": priceGoods,
        "numberOfGoods": numberOfGoods,
        "favoriteGoods": favoriteGoods,
        "category": category,
      };

  GoodsModel copyWith({
    int? id,
    String? nameGoods,
    String? compositionOfGoods,
    String? pathImage,
    String? weightGoods,
    double? ratingGoods,
    int? priceGoods,
    int? numberOfGoods,
    bool? favoriteGoods,
    String? category,
  }) {
    return GoodsModel(
      id: id ?? this.id,
      nameGoods: nameGoods ?? this.nameGoods,
      compositionOfGoods: compositionOfGoods ?? this.compositionOfGoods,
      pathImage: pathImage ?? this.pathImage,
      weightGoods: weightGoods ?? this.weightGoods,
      ratingGoods: ratingGoods ?? this.ratingGoods,
      priceGoods: priceGoods ?? this.priceGoods,
      numberOfGoods: numberOfGoods ?? this.numberOfGoods,
      favoriteGoods: favoriteGoods ?? this.favoriteGoods,
      category: category ?? this.category,
    );
  }

  @override
  String toString() {
    return '$nameGoods $id $compositionOfGoods $pathImage $weightGoods $ratingGoods $priceGoods $numberOfGoods $favoriteGoods $category';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GoodsModel &&
        other.id == id &&
        other.nameGoods == nameGoods &&
        other.compositionOfGoods == compositionOfGoods &&
        other.pathImage == pathImage &&
        other.weightGoods == weightGoods &&
        other.ratingGoods == ratingGoods &&
        other.priceGoods == priceGoods &&
        other.numberOfGoods == numberOfGoods &&
        other.favoriteGoods == favoriteGoods &&
        other.category == category;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nameGoods.hashCode ^
        compositionOfGoods.hashCode ^
        pathImage.hashCode ^
        weightGoods.hashCode ^
        ratingGoods.hashCode ^
        priceGoods.hashCode ^
        numberOfGoods.hashCode ^
        favoriteGoods.hashCode ^
        category.hashCode;
  }
}
