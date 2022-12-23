part of '../goods_card_factory.dart';

class _DialogWindow extends StatefulWidget {
  const _DialogWindow({Key? key, required this.model}) : super(key: key);

  final GoodsModel model;

  @override
  State<_DialogWindow> createState() => _DialogWindowState();
}

class _DialogWindowState extends State<_DialogWindow> {
  late final cubit = GoodsModalCubit();
  late final vm =
      GoodsModalViewModel(model: widget.model, context: context, cubit: cubit);
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: ModelProvider(
        model: vm,
        child: const _ViewWidget(),
      ),
    );
  }
}

class _ViewWidget extends StatelessWidget {
  const _ViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.bigP * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: const [
            _ModalGoodsInfoWidget(),
            SizedBox(height: AppPadding.bigP),
            _ModalBottomFooterWidget(),
          ],
        ),
      ),
    );
  }
}

class _ModalGoodsInfoWidget extends StatelessWidget {
  const _ModalGoodsInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = ModelProvider.of<GoodsModalViewModel>(context)!.model.model;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (model.pathImage != null)
          Image(
            image: AssetImage(model.pathImage!),
          )
        else
          const SizedBox(height: 300, width: 300, child: Placeholder()),
        const SizedBox(width: AppPadding.bigP),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.nameGoods,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: AppPadding.bigP),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Text(
                model.compositionOfGoods,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 16,
                    ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class _ModalBottomFooterWidget extends StatelessWidget {
  const _ModalBottomFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = ModelProvider.of<GoodsModalViewModel>(context)!.model;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.paymentGreen),
          ),
          onPressed: viewModel.onDecrementCountPressed,
          child: Text(
            '-',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontFamily: AppFonts.primaryFontRegular,
                  color: Colors.white,
                ),
          ),
        ),
        const SizedBox(width: AppPadding.smallP),
        BlocBuilder<GoodsModalCubit, GoodsModalState>(
          builder: (context, state) {
            return Text(
              state.countGoods.toString(),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontFamily: AppFonts.primaryFontRegular,
                  ),
            );
          },
        ),
        const SizedBox(width: AppPadding.smallP),
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.paymentGreen),
          ),
          onPressed: viewModel.onIncrementCountPressed,
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
            backgroundColor: MaterialStateProperty.all(AppColors.paymentGreen),
          ),
          onPressed: viewModel.onAddToCardPressed,
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
    );
  }
}
