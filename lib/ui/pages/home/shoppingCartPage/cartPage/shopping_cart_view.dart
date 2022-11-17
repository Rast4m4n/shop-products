import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shop_products/data/json.dart';
import 'package:shop_products/data/repository/goods_repository.dart';
import 'package:shop_products/domain/models/goods_model.dart';
import 'package:shop_products/ui/pages/home/shoppingCartPage/cartPage/shopping_cart_view_model.dart';
import 'package:shop_products/ui/theme/app_paddings.dart';
import 'package:shop_products/ui/theme/app_theme.dart';
import 'package:shop_products/ui/widgets/bonusCard/bonus_card.dart';
import 'package:shop_products/ui/widgets/goodsCard/view/second_goods_card.dart';
import 'package:shop_products/ui/widgets/goodsCard/viewModel/goods_view_model.dart';
import 'package:shop_products/ui/widgets/page_wrapper.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  final _viewModel = ShopingCartViewModel();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _viewModel.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      body: Json.cartGoods.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(AppPadding.bigP),
              child: ShopingCartProvider(
                model: _viewModel,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    _CartOfGoods(),
                    _ColumnToOrder(),
                  ],
                ),
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Корзина пуста',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontFamily: AppFonts.primaryFontRegular,
                      ),
                ),
                Text(
                  'Чтобы это исправить, загляните на каталог товаров и закажите что желаете',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontFamily: AppFonts.primaryFontMedium,
                      ),
                ),
                const SizedBox(height: AppPadding.mediumP),
                ElevatedButton(
                  style: Theme.of(context).textButtonTheme.style?.copyWith(
                        backgroundColor:
                            MaterialStateProperty.resolveWith((states) => AppColors.primaryPurple),
                      ),
                  onPressed: () => ShopingCartViewModel.enterToMainShop(context),
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.bigP * 1.5),
                    child: Text(
                      "На главную страницу",
                      style:
                          Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class _CartOfGoods extends StatelessWidget {
  const _CartOfGoods({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Корзина товаров',
            style: Theme.of(context).textTheme.headline4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Товаров в корзине ${ShopingCartProvider.read(context)!.model!.amountOfGoods}',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),
              ),
              TextButton(
                style: Theme.of(context).textButtonTheme.style?.copyWith(
                      foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.black),
                    ),
                onPressed: () {
                  ShopingCartProvider.watch(context)!.model!.clearAllGoods();
                },
                child: const Text("Очистить корзину"),
              ),
            ],
          ),
          const SizedBox(height: AppPadding.smallP),
          const _AllGoodsInCart(),
        ],
      ),
    );
  }
}

class _AllGoodsInCart extends StatefulWidget {
  const _AllGoodsInCart({Key? key}) : super(key: key);

  @override
  State<_AllGoodsInCart> createState() => _AllGoodsInCartState();
}

class _AllGoodsInCartState extends State<_AllGoodsInCart> {
  final _viewModel = GoodsViewModel(goodsRepository: GetIt.I.get<GoodsRepository>());

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _viewModel.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GoodsInheritViewModel(
      model: _viewModel,
      child: const _ViewWidget(),
    );
  }
}

class _ViewWidget extends StatelessWidget {
  const _ViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GoodsInheritViewModel.watch(context);
    final toDisplayGoods = <GoodsModel>[];
    for (final goods in Json.cartGoods) {
      if (toDisplayGoods.any((element) => element.id == goods.id)) {
        final index = toDisplayGoods.indexWhere((element) => element.id == goods.id);
        toDisplayGoods[index] =
            toDisplayGoods[index].copyWith(numberOfGoods: toDisplayGoods[index].numberOfGoods + 1);
        continue;
      }
      toDisplayGoods.add(goods.copyWith(numberOfGoods: 1));
    }
    toDisplayGoods.sort((e, b) => e.id.compareTo(b.id));
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return SecondGoodsCardWidget(
            goods: toDisplayGoods[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: AppPadding.mediumP);
        },
        itemCount: toDisplayGoods.length);
  }
}

class _ColumnToOrder extends StatelessWidget {
  const _ColumnToOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: SizedBox(
        width: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            BonusCardWidget(),
            SizedBox(height: AppPadding.smallP),
            _PriceOfGoods(),
            SizedBox(height: AppPadding.smallP),
            _ToOrderButton(),
          ],
        ),
      ),
    );
  }
}

class _PriceOfGoods extends StatelessWidget {
  const _PriceOfGoods({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            offset: const Offset(0.4, 0.4),
            color: Colors.black.withOpacity(0.3),
          ),
        ],
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.smallP),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Сумма товаров',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),
                ),
                Text(
                  '${ShopingCartProvider.read(context)!.model?.summOfAllGoods()} ₽',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Скидка по карте',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),
                ),
                Text(
                  '${ShopingCartProvider.read(context)!.model!.discountFromCard} ₽',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Доставка',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),
                ),
                Text(
                  '${ShopingCartProvider.read(context)!.model!.deliveryPrice} ₽',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Итоговая сумма',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontFamily: AppFonts.primaryFontRegular,
                      ),
                ),
                Text(
                  '${ShopingCartProvider.read(context)!.model!.totalPrice} ₽',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontFamily: AppFonts.primaryFontRegular,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ToOrderButton extends StatelessWidget {
  const _ToOrderButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: Theme.of(context).textButtonTheme.style?.copyWith(
            backgroundColor: MaterialStateProperty.resolveWith((states) => AppColors.primaryPurple),
            foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.white),
            textStyle: MaterialStateProperty.resolveWith((states) => const TextStyle(fontSize: 18)),
          ),
      onPressed: () => ShopingCartViewModel.enterToOrderGoods(context),
      child: const Padding(
        padding: EdgeInsets.all(AppPadding.bigP),
        child: Text("Перейти к оформлению"),
      ),
    );
  }
}
