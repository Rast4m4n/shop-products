import 'package:flutter/material.dart';
import 'package:shop_products/ui/theme/app_icons.dart';
import 'package:shop_products/ui/theme/app_paddings.dart';
import 'package:shop_products/ui/theme/app_theme.dart';

class HistoryBuyView extends StatelessWidget {
  const HistoryBuyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '07.10.2022',
          style:
              Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 24),
        ),
        const SizedBox(height: AppPadding.mediumP),
        const _GoodsCardWidget(),
      ],
    );
  }
}

class _GoodsCardWidget extends StatelessWidget {
  const _GoodsCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black.withOpacity(0.1),
          ),
          BoxShadow(
            blurRadius: 8,
            color: Colors.black.withOpacity(0.1),
          ),
          BoxShadow(
            blurRadius: 8,
            color: Colors.black.withOpacity(0.1),
          ),
          BoxShadow(
            blurRadius: 8,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.only(top: AppPadding.mediumP * 2),
            child: _TitleAndImageGoodsWidget(),
          ),
          SizedBox(height: AppPadding.smallP),
          _FooterInfodWidget(),
        ],
      ),
    );
  }
}

class _TitleAndImageGoodsWidget extends StatelessWidget {
  const _TitleAndImageGoodsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Image(
          image: AssetImage("assets/images/products/laysCheese.png"),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Чипсы «Lay's» Сыр",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontFamily: AppFonts.primaryFontRegular,
                    fontSize: 18,
                  ),
            ),
            const SizedBox(height: AppPadding.smallP),
            Text(
              '81 г',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ],
    );
  }
}

class _FooterInfodWidget extends StatelessWidget {
  const _FooterInfodWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const _RatingOfGoodsWidget(),
        const Spacer(),
        InkWell(
          onTap: () {},
          child: const Icon(AppIcons.bookmark, color: AppColors.primaryColor),
        ),
        const SizedBox(width: AppPadding.smallP),
        const _ToCartButtonWidget(),
        const SizedBox(width: AppPadding.bigP),
        Text('198 р', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(width: AppPadding.bigP),
      ],
    );
  }
}

class _ToCartButtonWidget extends StatelessWidget {
  const _ToCartButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 78,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {},
              child: Text(
                'В корзину',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RatingOfGoodsWidget extends StatelessWidget {
  const _RatingOfGoodsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const SizedBox(width: AppPadding.smallP),
      const Icon(
        AppIcons.starWithFill,
        color: AppColors.appBarTitle,
        size: 12,
      ),
      const SizedBox(width: AppPadding.smallP),
      Text(
        '4,8',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    ]);
  }
}
