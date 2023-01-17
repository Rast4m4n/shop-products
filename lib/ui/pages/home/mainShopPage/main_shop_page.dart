import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shop_products/data/repository/goods_repository.dart';
import 'package:shop_products/domain/models/goods_model.dart';
import 'package:shop_products/ui/navigator/app_navigation.dart';
import 'package:shop_products/ui/theme/app_paddings.dart';
import 'package:shop_products/ui/theme/app_theme.dart';
import 'package:shop_products/ui/utils/app_ui_utils.dart';
import 'package:shop_products/ui/widgets/goodsCard/view/goods_card_factory.dart';
import 'package:shop_products/ui/widgets/page_wrapper.dart';

class MainShopPage extends StatelessWidget {
  const MainShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      appBar: AppBar(
        title: InkWell(
          onTap: () => Navigator.of(context).pushNamed(AppRouteNames.home),
          child: const Text('Магия вкуса'),
        ),
        actions: const [],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          _CatalogOfGoods(),
          _ListOfGoods(),
        ],
      ),
    );
  }
}

class _CatalogOfGoods extends StatelessWidget {
  const _CatalogOfGoods({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppPadding.mediumP + 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  color: Colors.black.withOpacity(0.1),
                ),
                BoxShadow(
                  blurRadius: 2,
                  color: Colors.black.withOpacity(0.1),
                ),
                BoxShadow(
                  blurRadius: 2,
                  color: Colors.black.withOpacity(0.1),
                ),
                BoxShadow(
                  blurRadius: 2,
                  color: Colors.black.withOpacity(0.1),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.mediumP,
                vertical: AppPadding.mediumP,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Каталог',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppColors.primaryPurple,
                          fontFamily: AppFonts.primaryFontRegular,
                        ),
                  ),
                  const _ListCatalog(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ListCatalog extends StatelessWidget {
  const _ListCatalog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: AppUiUtils.buildSeparated(
        [
          const _CatalogCardWidget(categoryName: "Овощи, зелень"),
          const _CatalogCardWidget(categoryName: "Фрукты, ягоды"),
          const _CatalogCardWidget(categoryName: "Молочные продукты"),
          const _CatalogCardWidget(categoryName: "Яйца"),
          const _CatalogCardWidget(categoryName: "Вода и напитки"),
          const _CatalogCardWidget(categoryName: "Снеки"),
          const _CatalogCardWidget(categoryName: "Фрукты и ягоды"),
          const _CatalogCardWidget(categoryName: "Сладости"),
          const _CatalogCardWidget(categoryName: "Мясные изделия"),
          const _CatalogCardWidget(categoryName: "Морепродукты"),
          const _CatalogCardWidget(categoryName: "Чай и кофе"),
          const _CatalogCardWidget(categoryName: "Специи и соусы"),
          const _CatalogCardWidget(categoryName: "Выпечка"),
        ],
      ),
    );
  }
}

class _CatalogCardWidget extends StatelessWidget {
  const _CatalogCardWidget({Key? key, required this.categoryName})
      : super(key: key);
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Material(
      // color: Colors.grey,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.bigP),
          child: Row(
            children: [
              const SizedBox(height: 40, width: 40, child: Placeholder()),
              const SizedBox(width: AppPadding.smallP),
              Text(
                categoryName,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 16,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ListOfGoods extends StatefulWidget {
  const _ListOfGoods({
    Key? key,
  }) : super(key: key);

  @override
  State<_ListOfGoods> createState() => _ListOfGoodsState();
}

class _ListOfGoodsState extends State<_ListOfGoods> {
  @override
  Widget build(BuildContext context) {
    return _ViewWidget(goodsRepository: GetIt.I.get<GoodsRepository>());
  }
}

class _ViewWidget extends StatelessWidget {
  const _ViewWidget({
    Key? key,
    required this.goodsRepository,
  }) : super(key: key);

  final GoodsRepository goodsRepository;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GoodsModel>>(
      future: goodsRepository.fetchData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final goods = snapshot.data!;
          return ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: GridView.builder(
              padding: const EdgeInsets.all(AppPadding.bigP),
              shrinkWrap: true,
              itemCount: goods.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: AppPadding.bigP,
                mainAxisSpacing: AppPadding.bigP,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                return GoodsCardFactory.catalog(goods: goods[index]);
              },
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
