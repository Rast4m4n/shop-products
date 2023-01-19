import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shop_products/data/repository/goods_repository.dart';
import 'package:shop_products/domain/enums/category_enum.dart';
import 'package:shop_products/domain/models/goods_model.dart';
import 'package:shop_products/ui/navigator/app_navigation.dart';
import 'package:shop_products/ui/theme/app_paddings.dart';
import 'package:shop_products/ui/theme/app_theme.dart';
import 'package:shop_products/ui/utils/app_ui_utils.dart';
import 'package:shop_products/ui/widgets/goodsCard/view/goods_card_factory.dart';
import 'package:shop_products/ui/widgets/page_wrapper.dart';

class MainShopPage extends StatelessWidget {
  const MainShopPage({
    Key? key,
    this.searchFiltred,
    this.category,
  }) : super(key: key);

  final String? searchFiltred;
  final CategoryEnum? category;
  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      appBar: AppBar(
        title: InkWell(
          onTap: () => Navigator.of(context).pushNamed(AppRouteNames.main),
          child: const Text('Магия вкуса'),
        ),
        actions: const [],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const _CatalogOfGoods(),
          _ListOfGoods(
            searchFiltred: searchFiltred,
            category: category,
          ),
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
          _CatalogCardWidget(
            categoryName: "Овощи, зелень",
            onTap: () => Navigator.of(context).pushNamed(
              AppRouteNames.main,
              arguments: CategoryEnum.vegetable,
            ),
          ),
          _CatalogCardWidget(
            categoryName: "Фрукты, ягоды",
            onTap: () => Navigator.of(context).pushNamed(
              AppRouteNames.main,
              arguments: CategoryEnum.fruit,
            ),
          ),
          _CatalogCardWidget(
            categoryName: "Молочные продукты",
            onTap: () => Navigator.of(context).pushNamed(
              AppRouteNames.main,
              arguments: CategoryEnum.milk,
            ),
          ),
          _CatalogCardWidget(
            categoryName: "Яйца",
            onTap: () => Navigator.of(context).pushNamed(
              AppRouteNames.main,
              arguments: CategoryEnum.eggs,
            ),
          ),
          _CatalogCardWidget(
            categoryName: "Вода и напитки",
            onTap: () => Navigator.of(context).pushNamed(
              AppRouteNames.main,
              arguments: CategoryEnum.drinks,
            ),
          ),
          _CatalogCardWidget(
            categoryName: "Снеки",
            onTap: () => Navigator.of(context).pushNamed(
              AppRouteNames.main,
              arguments: CategoryEnum.snack,
            ),
          ),
          _CatalogCardWidget(
            categoryName: "Сладости",
            onTap: () => Navigator.of(context).pushNamed(
              AppRouteNames.main,
              arguments: CategoryEnum.sweets,
            ),
          ),
          _CatalogCardWidget(
            categoryName: "Мясные изделия",
            onTap: () => Navigator.of(context).pushNamed(
              AppRouteNames.main,
              arguments: CategoryEnum.meat,
            ),
          ),
          _CatalogCardWidget(
            categoryName: "Морепродукты",
            onTap: () => Navigator.of(context).pushNamed(
              AppRouteNames.main,
              arguments: CategoryEnum.seafood,
            ),
          ),
          _CatalogCardWidget(
            categoryName: "Чай и кофе",
            onTap: () => Navigator.of(context).pushNamed(
              AppRouteNames.main,
              arguments: CategoryEnum.teaAndCoffee,
            ),
          ),
          _CatalogCardWidget(
            categoryName: "Специи и соусы",
            onTap: () => Navigator.of(context).pushNamed(
              AppRouteNames.main,
              arguments: CategoryEnum.spicesAndSauces,
            ),
          ),
          _CatalogCardWidget(
            categoryName: "Выпечка",
            onTap: () => Navigator.of(context).pushNamed(
              AppRouteNames.main,
              arguments: CategoryEnum.bake,
            ),
          ),
        ],
      ),
    );
  }
}

class _CatalogCardWidget extends StatelessWidget {
  const _CatalogCardWidget({
    Key? key,
    required this.categoryName,
    required this.onTap,
  }) : super(key: key);
  final String categoryName;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      // color: Colors.grey,
      child: InkWell(
        onTap: onTap,
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
    this.searchFiltred,
    this.category,
  }) : super(key: key);
  final String? searchFiltred;
  final CategoryEnum? category;
  @override
  State<_ListOfGoods> createState() => _ListOfGoodsState();
}

class _ListOfGoodsState extends State<_ListOfGoods> {
  @override
  Widget build(BuildContext context) {
    return _ViewWidget(
      goodsRepository: GetIt.I.get<GoodsRepository>(),
      searchFiltred: widget.searchFiltred,
      category: widget.category,
    );
  }
}

class _ViewWidget extends StatelessWidget {
  const _ViewWidget({
    Key? key,
    required this.goodsRepository,
    this.searchFiltred,
    this.category,
  }) : super(key: key);

  final GoodsRepository goodsRepository;
  final String? searchFiltred;
  final CategoryEnum? category;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GoodsModel>>(
      future: goodsRepository.fetchData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var goods = searchFiltred == null
              ? snapshot.data!
              : snapshot.data!
                  .where(
                    (el) => el.nameGoods.toLowerCase().startsWith(
                          searchFiltred!.toLowerCase(),
                        ),
                  )
                  .toList();

          goods = category == null
              ? goods
              : goods
                  .where(
                    (el) =>
                        el.category == CategoryEnumExt.getName(category?.index),
                  )
                  .toList();
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
