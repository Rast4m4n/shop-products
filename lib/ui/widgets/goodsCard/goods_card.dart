import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shop_products/domain/models/goods_model.dart';
import 'package:shop_products/ui/theme/app_icons.dart';
import 'package:shop_products/ui/theme/app_paddings.dart';
import 'package:shop_products/ui/theme/app_theme.dart';
import 'package:shop_products/ui/widgets/goodsCard/inheritedModel/card_inherited.dart';
import 'package:shop_products/ui/widgets/goodsCard/viewModel/card_goods_view_model.dart';

class GoodsCardWidget extends StatefulWidget {
  const GoodsCardWidget({Key? key, required this.goods}) : super(key: key);
  final GoodsModel goods;

  @override
  State<GoodsCardWidget> createState() => _GoodsCardWidgetState();
}

class _GoodsCardWidgetState extends State<GoodsCardWidget> {
  final _viewGoods = _ViewGoods();
  @override
  Widget build(BuildContext context) {
    return CardInherited(
      model: widget.goods,
      child: InkWell(
        onTap: () => _viewGoods.dialogBuilder(context, widget.goods),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Colors.black.withOpacity(0.1),
              ),
              BoxShadow(
                blurRadius: 4,
                color: Colors.black.withOpacity(0.1),
              ),
              BoxShadow(
                blurRadius: 4,
                color: Colors.black.withOpacity(0.1),
              ),
              BoxShadow(
                blurRadius: 4,
                color: Colors.black.withOpacity(0.1),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.mediumP,
              // vertical: AppPadding.mediumP,
            ),
            child: Column(
              children: const [
                SizedBox(height: AppPadding.mediumP),
                _HeaderOfGoodWidget(),
                _InfoGoodsWidget(),
                Spacer(flex: 2),
                _FooterInfoWidget(),
                Spacer(),
                // SizedBox(height: AppPadding.mediumP),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderOfGoodWidget extends StatelessWidget {
  const _HeaderOfGoodWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(AppIcons.starWithFill, color: AppColors.secondaryYellow),
            const SizedBox(width: AppPadding.smallP),
            Text(
              "${CardInherited.of(context)?.model?.ratingGoods}",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 16,
                  ),
            ),
          ],
        ),
        InkWell(
          onTap: () {},
          child: const Icon(
            AppIcons.bookmarkOff,
            color: AppColors.primaryPurple,
          ),
        ),
      ],
    );
  }
}

class _InfoGoodsWidget extends StatelessWidget {
  const _InfoGoodsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: AppPadding.mediumP),
        if (CardInherited.of(context)!.model?.pathImage != null)
          Image(
            image: AssetImage(CardInherited.of(context)!.model!.pathImage!),
          )
        else
          const SizedBox(height: 160, width: 120, child: Placeholder()),
        const SizedBox(height: AppPadding.mediumP),
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                CardInherited.of(context)!.model!.nameGoods,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      // fontFamily: AppFonts.primaryFontRegular,
                      fontSize: 18,
                    ),
                maxLines: 2,
                overflow: TextOverflow.clip,
              ),
              const SizedBox(height: AppPadding.smallP),
              Text(
                CardInherited.of(context)!.model!.weightGoods,
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

class _FooterInfoWidget extends StatelessWidget {
  const _FooterInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${CardInherited.of(context)!.model!.priceGoods} ₽",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                // fontFamily: AppFonts.primaryFontRegular,
                fontSize: 16,
              ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: 100,
            decoration: BoxDecoration(
              color: AppColors.paymentGreen,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'В корзину',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _ViewGoods {
  int counter = 0;
  Future<void> dialogBuilder(
    BuildContext context,
    GoodsModel model,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 800, maxHeight: 400),
            child: Row(
              children: [
                if (CardInherited.of(context)?.model?.pathImage != null)
                  Image(
                    image: AssetImage(model.pathImage!),
                  )
                else
                  const SizedBox(height: 300, width: 300, child: Placeholder()),
                const SizedBox(width: AppPadding.bigP),
                Padding(
                  padding: const EdgeInsets.only(top: AppPadding.bigP * 3 - 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.nameGoods,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: AppPadding.bigP),
                      CardInherited.of(context)?.model?.descriptionGoods != null
                          ? Text(
                              model.descriptionGoods,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: 16,
                                  ),
                            )
                          : ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 500),
                              child: Text(
                                "Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 16,
                                    ),
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.paymentGreen),
                ),
                onPressed: () {},
                child: Text(
                  '-',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontFamily: AppFonts.primaryFontRegular,
                        color: Colors.white,
                      ),
                )),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontFamily: AppFonts.primaryFontRegular,
                    // color: Colors.black,
                  ),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColors.paymentGreen),
              ),
              onPressed: () {},
              child: Text(
                '+',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontFamily: AppFonts.primaryFontRegular,
                      color: Colors.white,
                    ),
              ),
            ),
            const SizedBox(width: AppPadding.bigP),
            TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColors.paymentGreen),
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Добавить в корзину',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontFamily: AppFonts.primaryFontRegular,
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ],
          actionsPadding: const EdgeInsets.all(AppPadding.bigP),
        );
      },
    );
  }
}
// 