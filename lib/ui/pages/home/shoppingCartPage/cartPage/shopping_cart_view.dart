import 'package:flutter/material.dart';
import 'package:shop_products/data/json.dart';
import 'package:shop_products/ui/theme/app_icons.dart';
import 'package:shop_products/ui/theme/app_paddings.dart';
import 'package:shop_products/ui/theme/app_theme.dart';
import 'package:shop_products/ui/widgets/goodsCard/view/mini_goods_card.dart';
import 'package:shop_products/ui/widgets/page_wrapper.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.bigP),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _CartOfGoods(),
            _ColumnToOrder(),
          ],
        ),
      ),
    );
  }
}

class _CartOfGoods extends StatelessWidget {
  const _CartOfGoods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Корзина товаров',
          style: Theme.of(context).textTheme.headline4,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return MiniGoodsCardWidget(
                  goods: Json.cartGoods[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: AppPadding.mediumP);
              },
              itemCount: Json.cartGoods.length),
        ),
      ],
    );
  }
}

class _ColumnToOrder extends StatelessWidget {
  const _ColumnToOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          _PriceOfGoods(),
          SizedBox(height: AppPadding.smallP),
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
      constraints: const BoxConstraints(minWidth: 400),
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
                  '396 ₽',
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
                  '-78 ₽',
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
                  '199₽',
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
                  '517₽',
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
  const _ToOrderButton({
    Key? key,
  }) : super(key: key);

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
      onPressed: () {},
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
