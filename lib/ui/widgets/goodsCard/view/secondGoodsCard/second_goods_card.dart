import 'package:flutter/material.dart';
import 'package:shop_products/domain/models/goods_model.dart';
import 'package:shop_products/ui/theme/app_icons.dart';
import 'package:shop_products/ui/theme/app_paddings.dart';
import 'package:shop_products/ui/theme/app_theme.dart';
import 'package:shop_products/ui/widgets/base/model_provider.dart';
import 'package:shop_products/ui/widgets/goodsCard/viewModel/goods_view_model.dart';

/// карточка товара для корзины
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
        child: Stack(children: [
          Positioned(
            bottom: 90,
            left: 560,
            child: Material(
              child: IconButton(
                tooltip: "Удалить товар из корзины",
                splashRadius: 16,
                onPressed: () {
                  GoodsInheritViewModel.read(context)!
                      .model
                      ?.deleteGoodsFromCart(goods);
                },
                icon: Icon(
                  Icons.clear,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _TitleOfGoods(),
                  _CountOfGoods(),
                  _PriceAndCountGoods(),
                  SizedBox(width: AppPadding.smallP),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class _TitleOfGoods extends StatefulWidget {
  const _TitleOfGoods({Key? key}) : super(key: key);

  @override
  State<_TitleOfGoods> createState() => _TitleOfGoodsState();
}

class _TitleOfGoodsState extends State<_TitleOfGoods> {
  @override
  Widget build(BuildContext context) {
    final model = ModelProvider.of<GoodsModel>(context)!.model;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: AppPadding.mediumP),
        if (model.pathImage != null)
          Image(
            image: AssetImage(model.pathImage!),
          )
        else
          const SizedBox(height: 90, width: 90, child: Placeholder()),
        const SizedBox(width: AppPadding.mediumP),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 300,
            minWidth: 300,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.nameGoods,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      // fontFamily: AppFonts.primaryFontRegular,
                      fontSize: 18,
                    ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: AppPadding.smallP),
              Text(
                model.weightGoods,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.black.withOpacity(0.7),
                    ),
              ),
              const SizedBox(height: AppPadding.smallP),
              InkWell(
                onTap: () {
                  GoodsInheritViewModel.read(context)
                      ?.model
                      ?.toFavoriteGoods(model);
                  setState(() {});
                },
                child: Icon(
                  model.favoriteGoods
                      ? AppIcons.bookmark
                      : AppIcons.bookmarkOff,
                  color: AppColors.primaryPurple,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CountOfGoods extends StatelessWidget {
  const _CountOfGoods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = ModelProvider.of<GoodsModel>(context)!.model;
    final viewModel = GoodsInheritViewModel.read(context)!.model;
    return Row(
      children: [
        IconButton(
            onPressed: () => viewModel!.decrementGoods(),
            icon: const Icon(Icons.remove)),
        Text('${viewModel!.counter}',
            style: Theme.of(context).textTheme.bodyLarge),
        IconButton(
            onPressed: () => viewModel.incrementGoods(model),
            icon: const Icon(Icons.add)),
      ],
    );
  }
}

class _PriceAndCountGoods extends StatelessWidget {
  const _PriceAndCountGoods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = ModelProvider.of<GoodsModel>(context)!.model;
    return Column(
      children: [
        Text(
          "${model.priceGoods} ₽",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 20,
              ),
        ),
      ],
    );
  }
}
