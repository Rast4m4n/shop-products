//Для веб/десктопа
import 'package:flutter/material.dart';
import 'package:shop_products/domain/models/cart_model.dart';
import 'package:shop_products/ui/navigator/app_navigation.dart';
import 'package:shop_products/ui/theme/app_icons.dart';
import 'package:shop_products/ui/theme/app_paddings.dart';
import 'package:shop_products/ui/theme/app_theme.dart';

class PageHeaderWidget extends StatelessWidget {
  const PageHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: AppColors.primaryPurple,
      child: Row(
        children: [
          const SizedBox(width: AppPadding.bigP),
          const _LogotypeShopWidget(),
          const SizedBox(width: AppPadding.bigP),
          const Expanded(flex: 4, child: _SearchField()),
          const SizedBox(width: AppPadding.bigP),
          const AddressWidget(),
          const Spacer(),
          Stack(
            children: [
              _IconTextButtonWidget(
                textButton: "Корзина",
                iconButton: AppIcons.basket,
                callBack: () =>
                    Navigator.of(context).pushNamed(AppRouteNames.shopingCart),
              ),
              Positioned(
                top: 35,
                left: 35,
                child: CartModel.cartGoods.isEmpty
                    ? const SizedBox()
                    : Text(
                        "${CartModel.cartGoods.length}",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.secondaryYellow,
                            ),
                      ),
              ),
            ],
          ),
          const SizedBox(width: AppPadding.bigP),
          _IconTextButtonWidget(
            textButton: "Отложенные",
            iconButton: AppIcons.bookmarkOff,
            callBack: () =>
                Navigator.of(context).pushNamed(AppRouteNames.favoriteGoods),
          ),
          const SizedBox(width: AppPadding.bigP),
          _IconTextButtonWidget(
            textButton: "Профиль",
            iconButton: AppIcons.profile,
            callBack: () => Navigator.of(context).pushNamed(AppRouteNames.auth),
          ),
          const SizedBox(width: AppPadding.bigP * 2),
        ],
      ),
    );
  }
}

class AddressWidget extends StatelessWidget {
  const AddressWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Санкт-Петербург',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white,
                fontSize: 14,
              ),
        ),
        Text(
          'ул. Адмирала Ноунейма, 13',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white,
              ),
        ),
      ],
    );
  }
}

class _LogotypeShopWidget extends StatelessWidget {
  const _LogotypeShopWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: InkWell(
        onTap: () => Navigator.of(context)
            .pushNamedAndRemoveUntil(AppRouteNames.main, (route) => false),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.only(right: AppPadding.bigP * 2.5),
              child: Icon(
                AppIcons.logo,
                size: 64,
                color: AppColors.secondaryYellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchField extends StatefulWidget {
  const _SearchField({Key? key}) : super(key: key);

  @override
  State<_SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<_SearchField> {
  final _searchController = TextEditingController();

  void searchGoods() {
    var text = _searchController.text;
    Navigator.of(context).pushNamed(AppRouteNames.main, arguments: text);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      onSubmitted: (value) => searchGoods(),
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.4),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(203, 221, 231, 255),
        isCollapsed: true,
        contentPadding: const EdgeInsets.all(14),
        prefixIcon: const Icon(AppIcons.search, size: 18, color: Colors.black),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        hintText: "Поиск",
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: const Color.fromARGB(169, 0, 0, 0),
              fontFamily: AppFonts.primaryFontBold,
            ),
      ),
    );
  }
}

class _IconTextButtonWidget extends StatelessWidget {
  const _IconTextButtonWidget({
    Key? key,
    required this.textButton,
    required this.iconButton,
    required this.callBack,
  }) : super(key: key);
  final VoidCallback callBack;
  final String textButton;
  final IconData iconButton;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: callBack,
      style: Theme.of(context).textButtonTheme.style,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.bigP),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(iconButton, color: AppColors.secondaryYellow),
            const SizedBox(width: AppPadding.smallP),
            Text(
              textButton,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
