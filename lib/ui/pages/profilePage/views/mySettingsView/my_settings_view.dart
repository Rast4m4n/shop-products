import 'package:flutter/material.dart';
import 'package:shop_products/ui/theme/app_icons.dart';
import 'package:shop_products/ui/theme/app_paddings.dart';
import 'package:shop_products/ui/theme/app_theme.dart';

class MySettingsView extends StatelessWidget {
  const MySettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _MainUserInfo(),
            Spacer(),
            _PaymentMethodInfo(),
            Spacer(flex: 4),
            InfoColumn(),
            Spacer(flex: 1),
          ],
        ),
        const SizedBox(height: AppPadding.bigP),
        const _PushNotifier(),
      ],
    );
  }
}

class _MainUserInfo extends StatelessWidget {
  const _MainUserInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Основные', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: AppPadding.smallP),
        const _UserInfoTextFieldWidget(labelText: 'Имя'),
        const SizedBox(height: AppPadding.mediumP),
        const _UserInfoTextFieldWidget(labelText: 'Фамилия'),
        const SizedBox(height: AppPadding.mediumP),
        const _UserInfoTextFieldWidget(labelText: 'Дата рождения'),
        const SizedBox(height: AppPadding.mediumP),
        const _UserInfoTextFieldWidget(labelText: 'Телефон'),
        const SizedBox(height: AppPadding.mediumP),
        const _UserInfoTextFieldWidget(labelText: 'Почта'),
        const SizedBox(height: AppPadding.mediumP),
        const _UserInfoTextFieldWidget(labelText: 'Город'),
        const SizedBox(height: AppPadding.mediumP),
        const _UserInfoTextFieldWidget(labelText: 'Адрес'),
      ],
    );
  }
}

class _UserInfoTextFieldWidget extends StatelessWidget {
  const _UserInfoTextFieldWidget({Key? key, required this.labelText})
      : super(key: key);
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300),
      child: TextField(
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontFamily: AppFonts.primaryFontRegular,
            ),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.subStrate,
          isCollapsed: true,
          label: Text(
            labelText,
            style: const TextStyle(fontFamily: AppFonts.primaryFontRegular),
          ),
          floatingLabelStyle: TextStyle(
            color: Colors.black.withOpacity(0.5),
            height: 2,
            fontSize: 16,
          ),
          contentPadding: const EdgeInsets.only(
            top: AppPadding.bigP,
            bottom: AppPadding.mediumP,
            left: AppPadding.smallP,
            right: AppPadding.mediumP,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

class _PushNotifier extends StatelessWidget {
  const _PushNotifier({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Text(
              'Уведомление ',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: AppPadding.smallP),
            Padding(
              padding: const EdgeInsets.only(right: AppPadding.mediumP * 2),
              child: Row(
                children: const [
                  _CustomCheckBox(text: 'sms'),
                  _CustomCheckBox(text: 'эл.почта'),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(width: AppPadding.bigP * 3),
        const _CustomCheckBox(
          text: 'О покупках',
          isBig: true,
        ),
        const SizedBox(width: AppPadding.bigP * 2),
        const _CustomCheckBox(
          text: 'Об акциях',
          isBig: true,
        ),
        const SizedBox(width: AppPadding.bigP * 2),
        const _CustomCheckBox(
          text: 'Сервисные',
          isBig: true,
        ),
      ],
    );
  }
}

class _CustomCheckBox extends StatelessWidget {
  const _CustomCheckBox({
    Key? key,
    required this.text,
    this.isBig = false,
  }) : super(key: key);
  final String text;
  final bool isBig;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Checkbox(value: false, onChanged: null),
        Text(
          text,
          style: isBig
              ? Theme.of(context).textTheme.headline6?.copyWith(
                    fontFamily: AppFonts.primaryFontMedium,
                    fontWeight: FontWeight.w900,
                    color: Colors.black.withOpacity(0.7),
                  )
              : Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontFamily: AppFonts.primaryFontMedium,
                    fontWeight: FontWeight.w900,
                    color: Colors.black.withOpacity(0.7),
                  ),
        ),
      ],
    );
  }
}

class _PaymentMethodInfo extends StatelessWidget {
  const _PaymentMethodInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Способы оплаты',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: AppPadding.bigP),
        Text(
          'Банковские карты',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
        ),
        const SizedBox(height: AppPadding.mediumP - 2),
        const _BankTypeTextWidget(
            icon: AppIcons.sber, numberCard: '7777 7777 7777 7777'),
        const SizedBox(height: AppPadding.bigP),
        const _BankTypeTextWidget(
            icon: AppIcons.tinkoff, numberCard: '7777 7777 7777 7777'),
        const SizedBox(height: AppPadding.bigP),
        InkWell(
          onTap: () {},
          child: Row(
            children: [
              const Icon(
                Icons.add,
                color: Colors.black,
                shadows: [
                  Shadow(color: Colors.black, blurRadius: 0.5),
                  Shadow(color: Colors.black, blurRadius: 0.5),
                  Shadow(color: Colors.black, blurRadius: 0.5),
                  Shadow(color: Colors.black, blurRadius: 0.5),
                ],
              ),
              Text(
                'Добавить способ оплаты',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BankTypeTextWidget extends StatelessWidget {
  const _BankTypeTextWidget({
    Key? key,
    required this.numberCard,
    required this.icon,
  }) : super(key: key);

  final String numberCard;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: Colors.green,
        ),
        const SizedBox(width: AppPadding.smallP - 4),
        Text(
          'Карта $numberCard',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
        ),
      ],
    );
  }
}

class InfoColumn extends StatelessWidget {
  const InfoColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: AppPadding.bigP * 2),
        _InfoCardWidget(
          title: 'любимая категория',
          description:
              'получай дополнительную скидку на любимые товары и продукты',
          image: 'assets/images/cardMySettingsOne.png',
        ),
        SizedBox(height: AppPadding.bigP),
        _InfoCardWidget(
          title: 'забота о природе',
          description:
              'откажитесь от чеков и целлофановых пакетов, сохраняйте природу',
          image: 'assets/images/cardMySettingsTwo.png',
        ),
      ],
    );
  }
}

class _InfoCardWidget extends StatelessWidget {
  const _InfoCardWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.image})
      : super(key: key);
  final String title;
  final String description;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
          colorFilter: const ColorFilter.mode(
            Colors.black45,
            BlendMode.colorBurn,
          ),
        ),
        borderRadius: BorderRadius.circular(18),
        // color: AppColors.appBarTitle,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.bigP, vertical: AppPadding.bigP),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: AppPadding.smallP),
            Text(description, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
