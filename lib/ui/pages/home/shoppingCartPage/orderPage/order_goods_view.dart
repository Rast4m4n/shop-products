import 'package:flutter/material.dart';
import 'package:shop_products/ui/theme/app_icons.dart';
import 'package:shop_products/ui/theme/app_paddings.dart';
import 'package:shop_products/ui/theme/app_theme.dart';
import 'package:shop_products/ui/widgets/bonusCard/bonus_card.dart';
import 'package:shop_products/ui/widgets/customCheckBox/custom_checkbox.dart';
import 'package:shop_products/ui/widgets/page_wrapper.dart';
import 'package:shop_products/ui/widgets/paymentMethodInfo/payment_method_info.dart';
import 'package:shop_products/ui/widgets/userInfoTextField/user_info_text_field.dart';

class OrderGoodsView extends StatelessWidget {
  const OrderGoodsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.bigP),
        child: Column(
          children: [
            _DataForDelivery(),
          ],
        ),
      ),
    );
  }
}

class _DataForDelivery extends StatelessWidget {
  const _DataForDelivery({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Данные для доставки',
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(height: AppPadding.mediumP),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: const [
                _UserInfoColumn(),
              ],
            ),
            const SizedBox(
              width: AppPadding.bigP * 2,
            ),
            const _BonusColumn(),
          ],
        ),
      ],
    );
  }
}

// Вся информация необходимая для заказа
class _UserInfoColumn extends StatelessWidget {
  const _UserInfoColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        UserInfoTextFieldWidget(labelText: "Имя"),
        SizedBox(height: AppPadding.bigP),
        UserInfoTextFieldWidget(labelText: "Телефон"),
        SizedBox(height: AppPadding.bigP),
        UserInfoTextFieldWidget(labelText: "Адрес"),
        SizedBox(height: AppPadding.smallP),
        CustomCheckBox(text: 'Частный дом'),
        SizedBox(height: AppPadding.smallP),
        _CommentsInfoTextField(),
        SizedBox(height: AppPadding.smallP),
        CustomCheckBox(text: 'Заказ другому человеку'),
        SizedBox(height: AppPadding.smallP),
        _TimeOfDelivery(),
        SizedBox(height: AppPadding.bigP),
        _PaymentMethodInfo(),
      ],
    );
  }
}

class _CommentsInfoTextField extends StatelessWidget {
  const _CommentsInfoTextField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300),
      child: TextField(
        maxLines: 4,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontFamily: AppFonts.primaryFontRegular,
            ),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.subStrate,
          hintText: 'Комментарий для курьера',
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

class _TimeOfDelivery extends StatelessWidget {
  const _TimeOfDelivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Желаемое время доставки',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontFamily: AppFonts.primaryFontRegular,
              ),
        ),
        const SizedBox(width: AppPadding.mediumP),
        InkWell(
          onTap: () {},
          child: Container(
            width: 80,
            height: 30,
            decoration: BoxDecoration(
              color: AppColors.subStrate,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '14:00',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontFamily: AppFonts.primaryFontRegular,
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
        const SizedBox(height: AppPadding.smallP),
        Row(
          children: [
            Text(
              'Оплата при получении',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontFamily: AppFonts.primaryFontRegular,
                  ),
            ),
            const Radio(
                value: 'value', groupValue: 'groupValue', onChanged: null),
          ],
        ),
        const SizedBox(height: AppPadding.mediumP - 2),
        const BankTypeTextWidget(
            image: "assets/images/sber.png", numberCard: '7777 7777 7777 7777'),
        const SizedBox(height: AppPadding.bigP),
        const BankTypeTextWidget(
          image: "assets/images/tinkoff.png",
          numberCard: '7777 7777 7777 7777',
        ),
        const SizedBox(height: AppPadding.smallP),
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

// Колонка с бонусной карточкой
class _BonusColumn extends StatelessWidget {
  const _BonusColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Спишем или накопим',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.primaryPurple,
              ),
        ),
        const SizedBox(height: AppPadding.smallP),
        const BonusCardWidget(),
        const SizedBox(height: AppPadding.smallP),
        Row(
          children: [
            const _PromoCodeTextField(),
            const SizedBox(width: AppPadding.mediumP),
            TextButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.primaryPurple,
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppPadding.smallP + 2,
                  horizontal: AppPadding.mediumP,
                ),
                child: Text(
                  'Применить',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _PromoCodeTextField extends StatelessWidget {
  const _PromoCodeTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 270),
      child: TextField(
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontFamily: AppFonts.primaryFontRegular,
            ),
        decoration: InputDecoration(
          filled: true,
          isCollapsed: true,
          fillColor: AppColors.subStrate,
          hintText: 'У вас есть промокод?',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(6),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(6),
          ),
          contentPadding: const EdgeInsets.only(
            top: AppPadding.bigP,
            bottom: AppPadding.mediumP,
            left: AppPadding.smallP,
            right: AppPadding.mediumP,
          ),
        ),
      ),
    );
  }
}
