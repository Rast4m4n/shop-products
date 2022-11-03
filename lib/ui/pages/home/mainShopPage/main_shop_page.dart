import 'package:flutter/material.dart';
import 'package:shop_products/data/repository/goods_repository.dart';
import 'package:shop_products/data/repository/shared_pref_repository.dart';
import 'package:shop_products/domain/models/goods_model.dart';
import 'package:shop_products/ui/pages/home/mainShopPage/viewModel/main_shop_view_model.dart';
import 'package:shop_products/ui/theme/app_paddings.dart';
import 'package:shop_products/ui/theme/app_theme.dart';
import 'package:shop_products/ui/widgets/goodsCard/view/goods_card.dart';
import 'package:shop_products/ui/widgets/goodsCard/viewModel/goods_view_model.dart';

class MainShopPage extends StatelessWidget {
  const MainShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        _CatalogOfGoods(),
        // Spacer(flex: 2),
        _ListOfGoods(),
        // Spacer(flex: 2),
      ],
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
                  _ListCatalog(),
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
  _ListCatalog({Key? key}) : super(key: key);
  final _viewModel = MainShopViewModel();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: _viewModel.separatedCategoryGoods(
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
    return InkWell(
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
  final goodsRepository = GoodsRepository(MockApi());
  final _viewModel = CardGoodsViewModel();

  @override
  Widget build(BuildContext context) {
    return CardGoodsInheritViewModel(
      model: _viewModel,
      child: _ViewWidget(goodsRepository: goodsRepository),
    );
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
    CardGoodsInheritViewModel.watch(context);
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
                return GoodsCardWidget(goods: goods[index]);
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
