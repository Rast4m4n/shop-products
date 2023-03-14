class GoodsModel {
  GoodsModel({
    required this.id,
    required this.nameGoods,
    required this.compositionOfGoods,
    required this.pathImage,
    required this.weightGoods,
    required this.priceGoods,
    required this.favoriteGoods,
    required this.category,
  });
  final int id;
  final String nameGoods;
  final String compositionOfGoods;
  final String? pathImage;
  final String weightGoods;
  final int priceGoods;
  final bool favoriteGoods;
  final String category;

  factory GoodsModel.fromJson(Map<String, dynamic> json) => GoodsModel(
        id: json["id"],
        nameGoods: json["nameGoods"],
        compositionOfGoods: json["compositionOfGoods"],
        pathImage: json["pathImage"],
        weightGoods: json["weightGoods"],
        priceGoods: json["priceGoods"],
        favoriteGoods: json["favoriteGoods"],
        category: json["categoryName"],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "id": id,
        "nameGoods": nameGoods,
        "compositionOfGoods": compositionOfGoods,
        "pathImage": pathImage,
        "weightGoods": weightGoods,
        "priceGoods": priceGoods,
        "favoriteGoods": favoriteGoods,
        "categoryName": category,
      };

  GoodsModel copyWith({
    int? id,
    String? nameGoods,
    String? compositionOfGoods,
    String? pathImage,
    String? weightGoods,
    int? priceGoods,
    bool? favoriteGoods,
    String? category,
  }) {
    return GoodsModel(
      id: id ?? this.id,
      nameGoods: nameGoods ?? this.nameGoods,
      compositionOfGoods: compositionOfGoods ?? this.compositionOfGoods,
      pathImage: pathImage ?? this.pathImage,
      weightGoods: weightGoods ?? this.weightGoods,
      priceGoods: priceGoods ?? this.priceGoods,
      favoriteGoods: favoriteGoods ?? this.favoriteGoods,
      category: category ?? this.category,
    );
  }

  @override
  String toString() {
    return '$nameGoods $id $compositionOfGoods $pathImage $weightGoods $priceGoods $favoriteGoods $category';
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
        other.priceGoods == priceGoods &&
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
        priceGoods.hashCode ^
        favoriteGoods.hashCode ^
        category.hashCode;
  }
}
