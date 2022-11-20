part of '../goods_card_factory.dart';

class _ToFavoriteButton extends StatelessWidget {
  const _ToFavoriteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = GoodsInheritViewModel.watch(context)!.model!;
    return InkWell(
      onTap: viewModel.onFavoriteButtonPressed,
      child: Icon(
        viewModel.isFavorite ? AppIcons.bookmark : AppIcons.bookmarkOff,
        color: AppColors.primaryPurple,
      ),
    );
  }
}
