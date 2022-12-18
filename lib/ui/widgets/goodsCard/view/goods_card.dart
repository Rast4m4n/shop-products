part of 'goods_card_factory.dart';

class GoodsCardWidget extends StatefulWidget {
  const GoodsCardWidget({
    Key? key,
    required this.goods,
  }) : super(key: key);
  final GoodsModel goods;

  @override
  State<GoodsCardWidget> createState() => _GoodsCardWidgetState();
}

class _GoodsCardWidgetState extends State<GoodsCardWidget> {
  late final _viewModel = _GoodsCardViewModel(
    goods: widget.goods,
    goodsRepository: GetIt.I.get<GoodsRepository>(),
    updateCart: () {},
  );

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
    return GoodsInheritViewModel(
      model: _viewModel,
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

class _HeaderOfGoodWidget extends StatelessWidget {
  const _HeaderOfGoodWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final goods = GoodsInheritViewModel.read(context)!.model!.goods;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(AppIcons.starWithFill, color: AppColors.secondaryYellow),
            const SizedBox(width: AppPadding.smallP),
            Text(
              "${goods.ratingGoods}",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 16,
                  ),
            ),
          ],
        ),
        const _ToFavoriteButton(),
      ],
    );
  }
}

class _InfoGoodsWidget extends StatelessWidget {
  const _InfoGoodsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final goods = GoodsInheritViewModel.read(context)!.model!.goods;
    return Column(
      children: [
        const SizedBox(height: AppPadding.mediumP),
        if (goods.pathImage != null)
          Image(
            image: AssetImage(goods.pathImage!),
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
                goods.nameGoods,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 18,
                    ),
                maxLines: 2,
                overflow: TextOverflow.clip,
              ),
              const SizedBox(height: AppPadding.smallP),
              Text(
                goods.weightGoods,
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
    final viewModel = GoodsInheritViewModel.watch(context)!.model!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${viewModel.goods.priceGoods} ₽",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                // fontFamily: AppFonts.primaryFontRegular,
                fontSize: 16,
              ),
        ),

        // Кнопка добавление товара в корзину
        viewModel.isAddedToCart
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
                      onPressed: viewModel.onDecrementButtonPressed,
                      child: Text(
                        '-',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                    Text(
                      viewModel.countOfGoods.toString(),
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
                      onPressed: viewModel.onIncrementButtonPressed,
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
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => AppColors.paymentGreen),
                ),
                onPressed: viewModel.onAddToCartButtonPressed,
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
