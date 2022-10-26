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
  Future<void> dialogBuilder(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return _DialogWindow(model: widget.goods);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CardInherited(
      model: widget.goods,
      child: InkWell(
        onTap: () => dialogBuilder(context),
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

class _HeaderOfGoodWidget extends StatefulWidget {
  const _HeaderOfGoodWidget({Key? key}) : super(key: key);

  @override
  State<_HeaderOfGoodWidget> createState() => _HeaderOfGoodWidgetState();
}

class _HeaderOfGoodWidgetState extends State<_HeaderOfGoodWidget> {
  final _viewModel = CardGoodsViewModel();
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
              "${CardInherited.of(context)!.model!.ratingGoods}",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 16,
                  ),
            ),
          ],
        ),
        InkWell(
          onTap: () {
            _viewModel.toFavoriteGoods(CardInherited.of(context)!.model!);
            print(CardInherited.of(context)!.model!);
            setState(() {});
            print(CardInherited.of(context)!.model!.favoriteGoods);
          },
          child: Icon(
            CardInherited.of(context)!.model!.favoriteGoods
                ? AppIcons.bookmark
                : AppIcons.bookmarkOff,
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

class _FooterInfoWidget extends StatefulWidget {
  const _FooterInfoWidget({Key? key}) : super(key: key);

  @override
  State<_FooterInfoWidget> createState() => _FooterInfoWidgetState();
}

class _FooterInfoWidgetState extends State<_FooterInfoWidget> {
  final _viewModel = CardGoodsViewModel();

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
          onTap: () {
            _viewModel.addToCart();
            setState(() {});
          },
          child: Container(
            width: 100,
            decoration: BoxDecoration(
              color: AppColors.paymentGreen,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: _viewModel.isAddedToCart
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            _viewModel.amountGoods(false);
                            setState(() {});
                          },
                          child: Text(
                            '-',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            '${_viewModel.counter}',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _viewModel.amountGoods(true);
                            setState(() {});
                          },
                          child: Text(
                            '+',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'В корзину',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
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

class _DialogWindow extends StatefulWidget {
  const _DialogWindow({Key? key, required this.model}) : super(key: key);
  final GoodsModel model;

  @override
  State<_DialogWindow> createState() => _DialogWindowState();
}

class _DialogWindowState extends State<_DialogWindow> {
  final _viewModel = CardGoodsViewModel();
  @override
  Widget build(BuildContext context) {
    return CardInherited(
      model: widget.model,
      child: Dialog(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.bigP * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.model.pathImage != null)
                    Image(
                      image: AssetImage(widget.model.pathImage!),
                    )
                  else
                    const SizedBox(
                        height: 300, width: 300, child: Placeholder()),
                  const SizedBox(width: AppPadding.bigP),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.model.nameGoods,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: AppPadding.bigP),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 500),
                        child: Text(
                          widget.model.compositionOfGoods,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: 16,
                                  ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: AppPadding.bigP),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.paymentGreen),
                    ),
                    onPressed: () {
                      _viewModel.amountGoods(false);
                      setState(() {});
                    },
                    child: Text(
                      '-',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontFamily: AppFonts.primaryFontRegular,
                                color: Colors.white,
                              ),
                    ),
                  ),
                  const SizedBox(width: AppPadding.smallP),
                  Text(
                    '${_viewModel.counter}',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontFamily: AppFonts.primaryFontRegular,
                          // color: Colors.black,
                        ),
                  ),
                  const SizedBox(width: AppPadding.smallP),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.paymentGreen),
                    ),
                    onPressed: () {
                      _viewModel.amountGoods(true);
                      setState(() {});
                    },
                    child: Text(
                      '+',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
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
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontFamily: AppFonts.primaryFontRegular,
                                  color: Colors.white,
                                ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
