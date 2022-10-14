import 'package:flutter/material.dart';
import 'package:shop_products/data/repository/goods_repository.dart';
import 'package:shop_products/domain/models/goods_model.dart';
import 'package:shop_products/ui/theme/app_paddings.dart';
import 'package:shop_products/ui/widgets/goods_card.dart';

class MainShopPage extends StatefulWidget {
  const MainShopPage({Key? key}) : super(key: key);

  @override
  State<MainShopPage> createState() => _MainShopPageState();
}

class _MainShopPageState extends State<MainShopPage> {
  final repo = GoodsRepository(MockApiRepository());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GoodsModel>>(
      future: repo.fetchData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final goods = snapshot.data!;
          return GridView.builder(
            padding: const EdgeInsets.all(AppPadding.bigP),
            shrinkWrap: true,
            itemCount: goods.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 2.5,
            ),
            itemBuilder: (context, index) {
              return GoodsCardWidget(goods: goods[index]);
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
