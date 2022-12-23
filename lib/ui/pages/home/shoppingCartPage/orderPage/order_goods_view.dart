import 'package:flutter/material.dart';
import 'package:shop_products/ui/theme/app_paddings.dart';
import 'package:shop_products/ui/widgets/page_wrapper.dart';

class OrderingGoodsView extends StatelessWidget {
  const OrderingGoodsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.bigP),
        child: Column(
          children: const [],
        ),
      ),
    );
  }
}

class _ColumnOrdering extends StatelessWidget {
  const _ColumnOrdering({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Оформление',
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(height: AppPadding.mediumP),
      ],
    );
  }
}
