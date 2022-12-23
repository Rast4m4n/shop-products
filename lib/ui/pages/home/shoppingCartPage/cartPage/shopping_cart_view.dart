import 'package:flutter/material.dart';
import 'package:shop_products/domain/models/cart_model.dart';
import 'package:shop_products/ui/pages/home/shoppingCartPage/cartPage/shopping_cart_view_model.dart';
import 'package:shop_products/ui/theme/app_paddings.dart';
import 'package:shop_products/ui/theme/app_theme.dart';
import 'package:shop_products/ui/widgets/bonusCard/bonus_card.dart';
import 'package:shop_products/ui/widgets/goodsCard/view/goods_card_factory.dart';
import 'package:shop_products/ui/widgets/page_wrapper.dart';

class ShoppingCartPage extends StatelessWidget {
  ShoppingCartPage({Key? key}) : super(key: key);
  final _viewModel = ShopingCartViewModel(
    cartGoods: const CartModel(),
  );

  @override
  Widget build(BuildContext context) {
    return ShopingCartProvider(
      model: _viewModel,
      child: PageWrapper(
        body: CartModel.cartGoods.isNotEmpty
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
    // viewModel.countOfGoodsFunc();
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
                'Товаров в корзине ${viewModel.cartGoods.amountOfGoodsString}',
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
    final listGoods = viewModel.cartGoods.countOfGoods();
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return GoodsCardFactory.cart(
          countOfGoods: listGoods.values.toList()[index],
          goods: listGoods.keys.toList()[index],
          updateCart: viewModel.updateCart,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: AppPadding.mediumP);
      },
      itemCount: listGoods.length,
    );
  }
}

class _ColumnToOrder extends StatelessWidget {
  const _ColumnToOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = ShopingCartProvider.watch(context)!.model!;
    return IntrinsicWidth(
      child: SizedBox(
        width: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const BonusCardWidget(),
            const SizedBox(height: AppPadding.smallP),
            Row(
              children: [
                _ButtonWriteOffPoints(
                  viewModel: viewModel,
                  text: 'Не списывать баллы',
                  color: viewModel.isWriteOff
                      ? Colors.grey
                      : AppColors.primaryPurple,
                  onPressed: viewModel.accumulatePoints,
                ),
                const SizedBox(width: AppPadding.smallP),
                _ButtonWriteOffPoints(
                  viewModel: viewModel,
                  text: 'Списать баллы',
                  color: viewModel.isWriteOff
                      ? AppColors.primaryPurple
                      : Colors.grey,
                  onPressed: viewModel.writeOffPoint,
                ),
              ],
            ),
            const SizedBox(height: AppPadding.smallP),
            const _PriceOfGoods(),
            const SizedBox(height: AppPadding.smallP),
            const _ToOrderButton(),
          ],
        ),
      ),
    );
  }
}

class _ButtonWriteOffPoints extends StatelessWidget {
  const _ButtonWriteOffPoints({
    Key? key,
    required this.viewModel,
    required this.text,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  final ShopingCartViewModel viewModel;
  final String text;
  final Color color;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.resolveWith(
            (states) =>
                const EdgeInsets.symmetric(vertical: AppPadding.mediumP * 2),
          ),
          side: MaterialStateProperty.all(
            BorderSide(
              color: color,
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
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
                  // '123 ₽',
                  '${viewModel.cartGoods.summOfGoodsString} ₽',
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
                  '${viewModel.cartGoods.discontString} ₽',
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
                  '${viewModel.cartGoods.deliveryString} ₽',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 16),
                )
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
                  '${viewModel.cartGoods.totalSummString} ₽',
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
