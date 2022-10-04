//Для веб/десктопа
import 'package:flutter/material.dart';
import 'package:shop_products/ui/pages/home/viewModel/view_model_home_page.dart';
import 'package:shop_products/ui/theme/app_paddings.dart';
import 'package:shop_products/ui/theme/app_theme.dart';

class PageHeaderWidget extends StatelessWidget {
  PageHeaderWidget({Key? key}) : super(key: key);

  final model = ViewModelHomePage();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: AppColors.primaryColor,
      child: Row(
        children: [
          const SizedBox(width: AppPadding.bigP),
          _LogotypeShopWidget(model: model),
          const SizedBox(width: AppPadding.bigP),
          const _DropDownListWidget(),
          const SizedBox(width: AppPadding.bigP),
          const Expanded(
            flex: 4,
            child: _SearchField(),
          ),
          const SizedBox(width: AppPadding.bigP),
          const AddressWidget(),
          const Spacer(),
          _IconTextButtonWidget(
            textButton: "корзина",
            iconButton: Icons.shopping_bag,
            callBack: () {},
          ),
          const SizedBox(width: AppPadding.bigP),
          _IconTextButtonWidget(
            textButton: "избранные",
            iconButton: Icons.favorite_outline,
            callBack: () {},
          ),
          const SizedBox(width: AppPadding.bigP),
          _IconTextButtonWidget(
            textButton: "профиль",
            iconButton: Icons.person_outline,
            callBack: () => model.enterProfilePage(context),
          ),
          const SizedBox(width: AppPadding.bigP),
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
    required this.model,
  }) : super(key: key);

  final ViewModelHomePage model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: InkWell(
        onTap: () => model.returnTomainPage(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Expanded(
              child: Text(
                'магия',
                style: TextStyle(
                  color: AppColors.appBarTitle,
                  fontFamily: 'DaysOne',
                  fontSize: 32,
                  height: 1.6,
                ),
              ),
            ),
            Expanded(
              child: Text(
                'вкуса',
                style: TextStyle(
                  color: AppColors.appBarTitle,
                  fontFamily: 'DaysOne',
                  fontSize: 32,
                  height: 0.8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DropDownListWidget extends StatelessWidget {
  const _DropDownListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      tooltip: '',
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.appBarTitle,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
          child: Text(
            'каталог',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontFamily: AppFonts.primaryFontBold,
                  color: Colors.black,
                ),
          ),
        ),
      ),
      itemBuilder: (BuildContext context) {
        return const [
          PopupMenuItem(child: Text('Молочные изделия')),
          PopupMenuItem(child: Text('Овощи и фрукты')),
          PopupMenuItem(child: Text('Мясо и рыба')),
          PopupMenuItem(child: Text('Чай и кофе')),
          PopupMenuItem(child: Text('Напитки')),
          PopupMenuItem(child: Text('Орехи и снеки')),
        ];
      },
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(203, 221, 231, 255),
        isCollapsed: true,
        contentPadding: const EdgeInsets.all(14),
        prefixIcon: const Icon(Icons.search, size: 18, color: Colors.black),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconButton, color: AppColors.appBarTitle),
          const SizedBox(width: AppPadding.smallP),
          Text(
            textButton,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
