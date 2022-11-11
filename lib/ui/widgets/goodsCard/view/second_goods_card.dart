import 'package:flutter/material.dart';
import 'package:shop_products/domain/models/goods_model.dart';
import 'package:shop_products/ui/theme/app_paddings.dart';
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
        child: Stack(children: [
          Positioned(
            bottom: 90,
            left: 560,
            child: IconButton(
              splashRadius: 1,
              onPressed: () {},
              icon: Icon(
                Icons.clear,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _TitleAndImageGoodsWidget(),
                  SizedBox(width: AppPadding.smallP),
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
          const SizedBox(height: 90, width: 90, child: Placeholder()),
        const SizedBox(width: AppPadding.mediumP),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
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
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
