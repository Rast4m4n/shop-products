part of 'goods_card_factory.dart';

/// карточка товара для корзины
class GoodsCardForCart extends StatefulWidget {
  const GoodsCardForCart(
      {Key? key, required this.goods, required this.countOfGoods})
      : super(key: key);

  final GoodsModel goods;
  final int countOfGoods;
  @override
  State<GoodsCardForCart> createState() => _GoodsCardForCartState();
}

class _GoodsCardForCartState extends State<GoodsCardForCart> {
  late final _viewModel = _GoodsCardViewModel(
      initialCountOfGoods: widget.countOfGoods,
      goods: widget.goods,
      goodsRepository: GetIt.I.get<GoodsRepository>());

  @override
  Widget build(BuildContext context) {
    return GoodsInheritViewModel(
      model: _viewModel,
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
          const _DeleteGoodsButton(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _TitleOfGoods(),
                  _CountOfGoods(),
                  _PriceGoods(),
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

class _DeleteGoodsButton extends StatelessWidget {
  const _DeleteGoodsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = GoodsInheritViewModel.watch(context)!.model!;
    return Positioned(
      bottom: 90,
      left: 560,
      child: Material(
        child: IconButton(
          tooltip: "Удалить товар из корзины",
          splashRadius: 16,
          onPressed: viewModel.onDeleteGoodsFromCart,
          icon: Icon(
            Icons.clear,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}

class _TitleOfGoods extends StatelessWidget {
  const _TitleOfGoods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final goods = GoodsInheritViewModel.read(context)!.model!.goods;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: AppPadding.mediumP),
        if (goods.pathImage != null)
          Image(
            image: AssetImage(goods.pathImage!),
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
                goods.nameGoods,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      // fontFamily: AppFonts.primaryFontRegular,
                      fontSize: 18,
                    ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: AppPadding.smallP),
              Text(
                goods.weightGoods,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.black.withOpacity(0.7),
                    ),
              ),
              const SizedBox(height: AppPadding.smallP),
              const _ToFavoriteButton(),
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
    final viewModel = GoodsInheritViewModel.watch(context)!.model!;
    return Row(
      children: [
        IconButton(
            onPressed: viewModel.onDecrementButtonPressed,
            icon: const Icon(Icons.remove)),
        Text(viewModel.countOfGoods.toString(),
            style: Theme.of(context).textTheme.bodyLarge),
        IconButton(
            onPressed: viewModel.onIncrementButtonPressed,
            icon: const Icon(Icons.add)),
      ],
    );
  }
}

class _PriceGoods extends StatelessWidget {
  const _PriceGoods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = GoodsInheritViewModel.watch(context)!.model!;
    return Column(
      children: [
        Text(
          "${model.goods.priceGoods * model.countOfGoods} ₽",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 20,
              ),
        ),
      ],
    );
  }
}
