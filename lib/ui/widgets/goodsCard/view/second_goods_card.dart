import 'package:flutter/material.dart';
import 'package:shop_products/domain/models/goods_model.dart';
import 'package:shop_products/ui/theme/app_icons.dart';
import 'package:shop_products/ui/theme/app_paddings.dart';
import 'package:shop_products/ui/theme/app_theme.dart';
import 'package:shop_products/ui/widgets/base/model_provider.dart';

class SecondGoodsCardWidget extends StatelessWidget {
  const SecondGoodsCardWidget({Key? key, required this.goods})
      : super(key: key);

  final GoodsModel goods;

  @override
  Widget build(BuildContext context) {
    return ModelProvider<GoodsModel>(
      model: goods,
      child: Container(
        width: 400,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              offset: const Offset(0.4, 0.4),
              color: Colors.black.withOpacity(0.1),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: AppPadding.mediumP * 2),
                  child: _TitleAndImageGoodsWidget(),
                ),
                const Spacer(),
                // Кнопка удаления товара из избранного или истории покупок
                IconButton(
                  splashRadius: 1,
                  onPressed: () {},
                  icon: Icon(
                    Icons.clear,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                const SizedBox(width: AppPadding.smallP),
              ],
            ),
            const Spacer(),
            const _FooterInfoWidget(),
            const SizedBox(height: AppPadding.mediumP),
          ],
        ),
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
        const SizedBox(width: AppPadding.mediumP),
        if (ModelProvider.of<GoodsModel>(context)?.model.pathImage != null)
          Image(
            image: AssetImage(
                ModelProvider.of<GoodsModel>(context)!.model.pathImage!),
          )
        else
          const SizedBox(height: 60, width: 60, child: Placeholder()),
        const SizedBox(width: AppPadding.mediumP),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 270),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ModelProvider.of<GoodsModel>(context)!.model.nameGoods,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      // fontFamily: AppFonts.primaryFontRegular,
                      fontSize: 18,
                    ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: AppPadding.smallP),
              Text(
                ModelProvider.of<GoodsModel>(context)!.model.weightGoods,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.black.withOpacity(0.7),
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FooterInfoWidget extends StatefulWidget {
  const _FooterInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<_FooterInfoWidget> createState() => _FooterInfoWidgetState();
}

class _FooterInfoWidgetState extends State<_FooterInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.mediumP),
      child: Row(
        children: [
          const _RatingOfGoodsWidget(),
          const Spacer(),
          InkWell(
            onTap: () {
              // GoodsInheritViewModel.read(context)
              //     ?.model
              //     ?.toFavoriteGoods(GoodsInherited.of(context)!.model!);
            },
            child: Icon(
                ModelProvider.of<GoodsModel>(context)!.model.favoriteGoods
                    ? AppIcons.bookmark
                    : AppIcons.bookmarkOff,
                color: AppColors.primaryPurple),
          ),
          const SizedBox(width: AppPadding.smallP),
          const _ToCartButtonWidget(),
          const SizedBox(width: AppPadding.bigP),
          Text(
            "${ModelProvider.of<GoodsModel>(context)!.model.priceGoods} ₽",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  // fontFamily: AppFonts.primaryFontRegular,
                  fontSize: 16,
                ),
          ),
        ],
      ),
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
        color: AppColors.paymentGreen,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                // _viewModel.addToCart(GoodsInherited.of(context)!.model!);
              },
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
      const Icon(
        AppIcons.starWithFill,
        color: AppColors.secondaryYellow,
        size: 12,
      ),
      const SizedBox(width: AppPadding.smallP),
      Text(
        '${ModelProvider.of<GoodsModel>(context)!.model.ratingGoods}',
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 16,
            ),
      ),
    ]);
  }
}
