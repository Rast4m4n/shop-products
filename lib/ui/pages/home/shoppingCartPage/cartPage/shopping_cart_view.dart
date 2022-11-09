import 'package:flutter/material.dart';
import 'package:shop_products/data/json.dart';
import 'package:shop_products/ui/pages/home/shoppingCartPage/cartPage/shopping_cart_view_model.dart';
import 'package:shop_products/ui/theme/app_paddings.dart';
import 'package:shop_products/ui/theme/app_theme.dart';
import 'package:shop_products/ui/widgets/goodsCard/view/mini_goods_card.dart';
import 'package:shop_products/ui/widgets/page_wrapper.dart';

class ShoppingCartPage extends StatelessWidget {
  ShoppingCartPage({Key? key}) : super(key: key);
  final _viewModel = ShopingCartViewModel();
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
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => AppColors.primaryPurple),
                        ),
                    onPressed: () => _viewModel.enterToMainShop(context),
                    child: Padding(
                      padding: const EdgeInsets.all(AppPadding.bigP * 1.5),
                      child: Text(
                        "На главную страницу",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontSize: 20, color: Colors.white),
                      ),
                    )),
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
                'В корзине ${ShopingCartProvider.read(context)!.model!.amountOfGoods} товаров',
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

class _AllGoodsInCart extends StatelessWidget {
  const _AllGoodsInCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return MiniGoodsCardWidget(
            goods: Json.cartGoods[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: AppPadding.mediumP);
        },
        itemCount: Json.cartGoods.length);
  }
}

class _ColumnToOrder extends StatelessWidget {
  const _ColumnToOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _PriceOfGoods(),
          const SizedBox(height: AppPadding.smallP),
          _ToOrderButton(),
        ],
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
    return Container(
      constraints: const BoxConstraints(minWidth: 600),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.subStrate,
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
                  '${ShopingCartProvider.read(context)!.model?.summOfAllGoods()} ₽',
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
                  '${ShopingCartProvider.read(context)!.model!.discountFromCard} ₽',
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
                  '${ShopingCartProvider.read(context)!.model!.deliveryPrice} ₽',
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
  _ToOrderButton({Key? key}) : super(key: key);

  final _viewModel = ShopingCartViewModel();

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
      onPressed: () => _viewModel.enterToOrderGoods(context),
      child: const Padding(
        padding: EdgeInsets.all(AppPadding.bigP),
        child: Text("Перейти к оформлению"),
      ),
    );
  }
}

// class _CartForGoods extends StatelessWidget {
//   const _CartForGoods({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Корзина',
//           style: Theme.of(context).textTheme.headline4,
//         ),
//         const _GoodsInfoColumn(),
//       ],
//     );
//   }
// }

// class _GoodsInfoColumn extends StatefulWidget {
//   const _GoodsInfoColumn({Key? key}) : super(key: key);

//   @override
//   State<_GoodsInfoColumn> createState() => _GoodsInfoColumnState();
// }

// class _GoodsInfoColumnState extends State<_GoodsInfoColumn> {
//   @override
//   Widget build(BuildContext context) {
//     return ConstrainedBox(
//       constraints: const BoxConstraints(maxWidth: 400),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 '3 товара (324 г.)',
//                 style: Theme.of(context).textTheme.bodyLarge,
//               ),
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   TextButton(
//                     onPressed: () {},
//                     child: Row(
//                       children: [
//                         Text('Очистить',
//                             style:
//                                 Theme.of(context).textTheme.bodyLarge?.copyWith(
//                                       color: Colors.black.withOpacity(0.7),
//                                     )),
//                         Icon(
//                           AppIcons.trash,
//                           color: Colors.black.withOpacity(0.7),
//                           size: 18,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           ConstrainedBox(
//             constraints: const BoxConstraints(maxWidth: 400),
//             child: ListView.separated(
//               shrinkWrap: true,
//               itemCount: Json.cartGoods.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return MiniGoodsCardWidget(goods: Json.cartGoods[index]);
//               },
//               separatorBuilder: (BuildContext context, int index) {
//                 return const SizedBox(height: AppPadding.smallP);
//               },
//               // children: const [

//               // ],
//             ),
//           ),
//           const SizedBox(height: AppPadding.mediumP),
//           const _InfoForPayment(),
//         ],
//       ),
//     );
//   }
// }

// class _InfoForPayment extends StatelessWidget {
//   const _InfoForPayment({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('У вас в корзине товаров на сумму 396 ₽',
//             style: Theme.of(context).textTheme.bodyLarge),
//         const SizedBox(height: AppPadding.smallP),
//         const Divider(height: 1, color: Colors.black),
//         const SizedBox(height: AppPadding.smallP),
//         Row(
//           children: [
//             ConstrainedBox(
//               constraints: const BoxConstraints(maxWidth: 300),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: const [
//                       Text('Скидки по карте'),
//                       Text('-78 ₽'),
//                     ],
//                   ),
//                   Divider(height: 1, color: Colors.black.withOpacity(0.5)),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: const [
//                       Text('Доставка'),
//                       Text('199 ₽'),
//                     ],
//                   ),
//                   Divider(height: 1, color: Colors.black.withOpacity(0.5)),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: const [
//                       Text('Итого по цене'),
//                       Text('517 ₽'),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(width: AppPadding.mediumP),
//             Column(
//               children: [
//                 TextButton(
//                   style: OutlinedButton.styleFrom(
//                     backgroundColor: AppColors.paymentGreen,
//                   ),
//                   onPressed: () {},
//                   child: Text(
//                     'Оформить заказ',
//                     style: Theme.of(context)
//                         .textTheme
//                         .bodyLarge
//                         ?.copyWith(color: Colors.white),
//                   ),
//                 ),
//                 // Text(
//                 //   'вы не выбрали способ оплаты :(',
//                 //   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                 //         color: const Color(0xff890519),
//                 //       ),
//                 // )
//               ],
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
