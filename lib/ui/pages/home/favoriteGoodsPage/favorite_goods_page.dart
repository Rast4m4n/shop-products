import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shop_products/data/repository/goods_repository.dart';
import 'package:shop_products/domain/models/goods_model.dart';
import 'package:shop_products/ui/theme/app_paddings.dart';
import 'package:shop_products/ui/widgets/goodsCard/view/goods_card_factory.dart';
import 'package:shop_products/ui/widgets/page_wrapper.dart';

class FavoriteGoodsPage extends StatelessWidget {
  const FavoriteGoodsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      body: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 600),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.mediumP),
          child: Column(
            children: [
              Text("Избранные товары",
                  style: Theme.of(context).textTheme.headlineMedium),
              _AllFavoriteGoods(
                goodsRepository: GetIt.I.get<GoodsRepository>(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AllFavoriteGoods extends StatelessWidget {
  const _AllFavoriteGoods({Key? key, required this.goodsRepository})
      : super(key: key);

  final GoodsRepository goodsRepository;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GoodsModel>>(
      future: goodsRepository.fetchData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final goods = snapshot.data!
              .where((element) => element.favoriteGoods == true)
              .toList();
          return ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: GridView.builder(
              padding: const EdgeInsets.all(AppPadding.bigP),
              shrinkWrap: true,
              itemCount: goods.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: AppPadding.bigP,
                mainAxisSpacing: AppPadding.bigP,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                return GoodsCardFactory.catalog(goods: goods[index]);
              },
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
