import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:shop_products/data/repository/goods_repository.dart';
import 'package:shop_products/domain/models/goods_model.dart';
import 'package:shop_products/ui/theme/app_icons.dart';
import 'package:shop_products/ui/theme/app_paddings.dart';
import 'package:shop_products/ui/theme/app_theme.dart';
import 'package:shop_products/ui/widgets/base/model_provider.dart';
import 'package:shop_products/ui/widgets/goodsCard/view/modal/cubit/goods_modal_cubit.dart';
import 'package:shop_products/ui/widgets/goodsCard/view/modal/view_model/goods_modal_view_model.dart';
import 'package:shop_products/ui/widgets/goodsCard/viewModel/goods_view_model.dart';

part 'modal/goods_modal_widget.dart';

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
    return ModelProvider<GoodsModel>(
      model: widget.goods,
      child: Material(
        child: InkWell(
          onTap: () => dialogBuilder(context),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(4, 4),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.mediumP,
              ),
              child: Column(
                children: const [
                  SizedBox(height: AppPadding.mediumP),
                  _HeaderOfGoodWidget(),
                  _InfoGoodsWidget(),
                  Spacer(flex: 2),
                  _FooterInfoWidget(),
                  Spacer(),
                ],
              ),
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
  @override
  Widget build(BuildContext context) {
    final model = ModelProvider.of<GoodsModel>(context)!.model;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(AppIcons.starWithFill, color: AppColors.secondaryYellow),
            const SizedBox(width: AppPadding.smallP),
            Text(
              "${model.ratingGoods}",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 16,
                  ),
            ),
          ],
        ),
        InkWell(
          onTap: () {
            GoodsInheritViewModel.read(context)
                ?.model
                ?.toFavoriteGoods(ModelProvider.of<GoodsModel>(context)!.model);
          },
          child: Icon(
            model.favoriteGoods ? AppIcons.bookmark : AppIcons.bookmarkOff,
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
    final model = ModelProvider.of<GoodsModel>(context)!.model;
    return Column(
      children: [
        const SizedBox(height: AppPadding.mediumP),
        if (model.pathImage != null)
          Image(
            image: AssetImage(model.pathImage!),
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
                model.nameGoods,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      // fontFamily: AppFonts.primaryFontRegular,
                      fontSize: 18,
                    ),
                maxLines: 2,
                overflow: TextOverflow.clip,
              ),
              const SizedBox(height: AppPadding.smallP),
              Text(
                model.weightGoods,
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
  final _viewModel = GoodsViewModel(
    goodsRepository: GetIt.I.get<GoodsRepository>(),
  );

  @override
  Widget build(BuildContext context) {
    final model = ModelProvider.of<GoodsModel>(context)!.model;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${model.priceGoods} ₽",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                // fontFamily: AppFonts.primaryFontRegular,
                fontSize: 16,
              ),
        ),

        // Кнопка добавление товара в корзину
        _viewModel.isAddedToCart
            ? Container(
                width: 92,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.paymentGreen,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.resolveWith(
                          (states) => const Size(40, 20),
                        ),
                      ),
                      onPressed: () {
                        _viewModel.decrementGoods(model);
                        setState(() {});
                      },
                      child: Text(
                        '-',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                    Text(
                      'мда', // Сделай норм, что это ??? -> '${_viewModel.counter}',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.resolveWith(
                          (states) => const Size(40, 20),
                        ),
                      ),
                      onPressed: () {
                        _viewModel.incrementGoods(model);
                        setState(() {});
                      },
                      child: Text(
                        '+',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ],
                ),
              )
            // До нажатия
            : TextButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.resolveWith(
                    (states) => const Size(100, 40),
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith((states) => AppColors.paymentGreen),
                ),
                onPressed: () {
                  _viewModel.addToCart(model);
                  setState(() {});
                },
                child: Text(
                  'В корзину',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                      ),
                ),
              )
      ],
    );
  }
}
