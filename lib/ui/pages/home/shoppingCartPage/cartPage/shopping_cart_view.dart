import 'package:flutter/material.dart';
import 'package:shop_products/data/json.dart';
import 'package:shop_products/ui/pages/home/shoppingCartPage/cartPage/shopping_cart_view_model.dart';
import 'package:shop_products/ui/theme/app_paddings.dart';
import 'package:shop_products/ui/theme/app_theme.dart';
import 'package:shop_products/ui/widgets/bonusCard/bonus_card.dart';
import 'package:shop_products/ui/widgets/goodsCard/view/goods_card_factory.dart';
import 'package:shop_products/ui/widgets/page_wrapper.dart';

class ShoppingCartPage extends StatelessWidget {
  ShoppingCartPage({Key? key}) : super(key: key);
  final _viewModel = ShopingCartViewModel();

  @override
  Widget build(BuildContext context) {
    return ShopingCartProvider(
      model: _viewModel,
      child: PageWrapper(
        body: Json.cartGoods.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(AppPadding.bigP),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    _CartOfGoods(),
                    _ColumnToOrder(),
                  ],
                ),
              )
            : SizedBox(
                height: 600,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Корзина пуста',
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                fontFamily: AppFonts.primaryFontRegular,
                              ),
                    ),
                    Text(
                      'Чтобы добавить товар в корзину, загляните на каталог товаров и закажите что желаете',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontFamily: AppFonts.primaryFontMedium,
                              ),
                    ),
                    const SizedBox(height: AppPadding.mediumP),
                    ElevatedButton(
                      style: Theme.of(context).textButtonTheme.style?.copyWith(
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => AppColors.primaryPurple),
                          ),
                      onPressed: () =>
                          ShopingCartViewModel.enterToMainShop(context),
                      child: Padding(
                        padding: const EdgeInsets.all(AppPadding.bigP * 1.5),
                        child: Text(
                          "На главную страницу",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class _CartOfGoods extends StatelessWidget {
  const _CartOfGoods({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final viewModel = ShopingCartProvider.watch(context)!.model!;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600, minHeight: 600),
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
                'Товаров в корзине ${viewModel.amountOfGoodsFunc()}',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 14),
              ),
              TextButton(
                style: Theme.of(context).textButtonTheme.style?.copyWith(
                      foregroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.black),
                    ),
                onPressed: viewModel.clearAllGoods,
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

class _AllGoodsInCart extends StatelessWidget {
  const _AllGoodsInCart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final viewModel = ShopingCartProvider.watch(context)!.model!;

    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return GoodsCardFactory.cart(
            countOfGoods: viewModel.listOfGoods.entries.toList()[index].value,
            goods: viewModel.listOfGoods.entries.toList()[index].key,
            updateCart: viewModel.updateCart,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: AppPadding.mediumP);
        },
        itemCount: viewModel.listOfGoods.length);
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
    final viewModel = ShopingCartProvider.watch(context)!.model!;
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
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 16),
                ),
                Text(
                  '${viewModel.summOfAllGoods()} ₽',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 16),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Скидка по карте',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 16),
                ),
                Text(
                  '${viewModel.discountCard} ₽',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 16),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Доставка',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 16),
                ),
                Text(
                  '${viewModel.deliveryPrice} ₽',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 16),
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
                  '${viewModel.totalPriceFunc()} ₽',
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
            backgroundColor: MaterialStateProperty.resolveWith(
                (states) => AppColors.primaryPurple),
            foregroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.white),
            textStyle: MaterialStateProperty.resolveWith(
                (states) => const TextStyle(fontSize: 18)),
          ),
      onPressed: () => ShopingCartViewModel.enterToOrderGoods(context),
      child: const Padding(
        padding: EdgeInsets.all(AppPadding.bigP),
        child: Text("Перейти к оформлению"),
      ),
    );
  }
}
