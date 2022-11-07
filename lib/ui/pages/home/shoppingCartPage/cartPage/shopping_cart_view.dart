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
        child: Column(
          children: const [
            _CartForGoods(),
          ],
        ),
      ),
    );
  }
}

class _CartForGoods extends StatelessWidget {
  const _CartForGoods({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Корзина ',
          style: Theme.of(context).textTheme.headline4,
        ),
        const _GoodsInfoColumn(),
      ],
    );
  }
}

class _GoodsInfoColumn extends StatefulWidget {
  const _GoodsInfoColumn({Key? key}) : super(key: key);

  @override
  State<_GoodsInfoColumn> createState() => _GoodsInfoColumnState();
}

class _GoodsInfoColumnState extends State<_GoodsInfoColumn> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '3 товара (324 г.)',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text('Очистить',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: Colors.black.withOpacity(0.7),
                                    )),
                        Icon(
                          AppIcons.trash,
                          color: Colors.black.withOpacity(0.7),
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400, maxHeight: 400),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: Json.cartGoods.length,
              itemBuilder: (BuildContext context, int index) {
                return MiniGoodsCardWidget(goods: Json.cartGoods[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: AppPadding.smallP);
              },
              // children: const [

              // ],
            ),
          ),
          const SizedBox(height: AppPadding.mediumP),
          const _InfoForPayment(),
        ],
      ),
    );
  }
}

class _InfoForPayment extends StatelessWidget {
  const _InfoForPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('У вас в корзине товаров на сумму 396 ₽',
            style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: AppPadding.smallP),
        const Divider(height: 1, color: Colors.black),
        const SizedBox(height: AppPadding.smallP),
        Row(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Скидки по карте'),
                      Text('-78 ₽'),
                    ],
                  ),
                  Divider(height: 1, color: Colors.black.withOpacity(0.5)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Доставка'),
                      Text('199 ₽'),
                    ],
                  ),
                  Divider(height: 1, color: Colors.black.withOpacity(0.5)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Итого по цене'),
                      Text('517 ₽'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppPadding.mediumP),
            Column(
              children: [
                TextButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.paymentGreen,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Заказать',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.white),
                  ),
                ),
                // Text(
                //   'вы не выбрали способ оплаты :(',
                //   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                //         color: const Color(0xff890519),
                //       ),
                // )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
