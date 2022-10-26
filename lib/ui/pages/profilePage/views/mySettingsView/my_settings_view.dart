import 'package:flutter/material.dart';
import 'package:shop_products/ui/theme/app_icons.dart';
import 'package:shop_products/ui/theme/app_paddings.dart';
import 'package:shop_products/ui/widgets/customCheckBox/custom_checkbox.dart';
import 'package:shop_products/ui/widgets/paymentMethodInfo/payment_method_info.dart';
import 'package:shop_products/ui/widgets/userInfoTextField/user_info_text_field.dart';

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
        const UserInfoTextFieldWidget(labelText: 'Имя'),
        const SizedBox(height: AppPadding.mediumP),
        const UserInfoTextFieldWidget(labelText: 'Фамилия'),
        const SizedBox(height: AppPadding.mediumP),
        const UserInfoTextFieldWidget(labelText: 'Дата рождения'),
        const SizedBox(height: AppPadding.mediumP),
        const UserInfoTextFieldWidget(labelText: 'Телефон'),
        const SizedBox(height: AppPadding.mediumP),
        const UserInfoTextFieldWidget(labelText: 'Почта'),
        const SizedBox(height: AppPadding.mediumP),
        const UserInfoTextFieldWidget(labelText: 'Город'),
        const SizedBox(height: AppPadding.mediumP),
        const UserInfoTextFieldWidget(labelText: 'Адрес'),
      ],
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
                  CustomCheckBox(text: 'sms'),
                  CustomCheckBox(text: 'эл.почта'),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(width: AppPadding.bigP * 2),
        const CustomCheckBox(
          text: 'О покупках',
          isBig: true,
        ),
        const SizedBox(width: AppPadding.bigP * 2),
        const CustomCheckBox(
          text: 'Об акциях',
          isBig: true,
        ),
        const SizedBox(width: AppPadding.bigP * 2),
        const CustomCheckBox(
          text: 'Сервисные',
          isBig: true,
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
        const BankTypeTextWidget(
            image: "assets/images/sber.png", numberCard: '7777 7777 7777 7777'),
        const SizedBox(height: AppPadding.bigP),
        const BankTypeTextWidget(
            image: "assets/images/tinkoff.png",
            numberCard: '7777 7777 7777 7777'),
        const SizedBox(height: AppPadding.bigP),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(
                  AppIcons.plus,
                  size: 12,
                ),
                const SizedBox(width: AppPadding.smallP),
                Text(
                  'Добавить способ оплаты',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                ),
              ],
            ),
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
