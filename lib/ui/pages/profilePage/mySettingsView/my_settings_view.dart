import 'package:flutter/material.dart';
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(
                  'Уведомление ',
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: AppPadding.smallP),
                Row(
                  children: const [
                    _CustomCheckBox(text: 'sms'),
                    _CustomCheckBox(text: 'эл.почта'),
                  ],
                ),
              ],
            ),
            const SizedBox(width: AppPadding.bigP * 3),
            _CustomCheckBox(
              text: 'О покупках',
              textStyle: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontFamily: AppFonts.primaryFont),
            ),
            const SizedBox(width: AppPadding.bigP * 2),
            _CustomCheckBox(
              text: 'Об акциях',
              textStyle: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontFamily: AppFonts.primaryFont),
            ),
            const SizedBox(width: AppPadding.bigP * 2),
            _CustomCheckBox(
              text: 'Сервисные',
              textStyle: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontFamily: AppFonts.primaryFont),
            ),
          ],
        ),
      ],
    );
  }
}

class _CustomCheckBox extends StatelessWidget {
  const _CustomCheckBox({
    Key? key,
    required this.text,
    this.textStyle = const TextStyle(),
  }) : super(key: key);
  final String text;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Checkbox(value: false, onChanged: null),
        Text(text, style: textStyle),
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
        Text(
          'Основные',
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(fontWeight: FontWeight.w900),
        ),
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
            height: 3,
          ),
          contentPadding: const EdgeInsets.all(AppPadding.mediumP),
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

class _PaymentMethodInfo extends StatelessWidget {
  const _PaymentMethodInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Способы оплаты',
          style: Theme.of(context).textTheme.headline5?.copyWith(
                fontWeight: FontWeight.w900,
              ),
        ),
        const SizedBox(height: AppPadding.bigP),
        Text(
          'Банковские карты',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
        ),
        const SizedBox(height: AppPadding.mediumP - 2),
        const _BankTypeTextWidget(numberCard: '7777 7777 7777 7777'),
        const SizedBox(height: AppPadding.bigP),
        const _BankTypeTextWidget(numberCard: '7777 7777 7777 7777'),
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
  const _BankTypeTextWidget({Key? key, required this.numberCard})
      : super(key: key);

  final String numberCard;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.card_giftcard),
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
        _InfoCardWidget(
          title: 'Любимая категория',
          description:
              'Получай дополнительную скидку на любимые товары и продукты',
          image: 'assets/images/cardMySettingsOne.png',
        ),
        SizedBox(height: AppPadding.bigP),
        _InfoCardWidget(
          title: 'Забота о природе',
          description:
              'Откажитесь от чеков и целлофановых пакетов, сохраняйте природу',
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
        borderRadius: BorderRadius.circular(25),
        // color: AppColors.appBarTitle,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.bigP, vertical: AppPadding.bigP * 2),
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
