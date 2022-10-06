import 'package:flutter/material.dart';
import 'package:shop_products/ui/pages/profilePage/mySettingsView/my_settings_view.dart';
import 'package:shop_products/ui/theme/app_paddings.dart';
import 'package:shop_products/ui/theme/app_theme.dart';
import 'package:shop_products/ui/widgets/page_wrapper.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      appBar: AppBar(title: const Text('Профиль')),
      body: Column(
        children: [
          Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  _HeaderProfile(),
                  SizedBox(height: AppPadding.bigP),
                  _BodyInfoSelectionBar(),
                ],
              ),
              const Positioned(
                right: AppPadding.mediumP * 3,
                bottom: AppPadding.mediumP,
                child: _BonusCardWidget(),
              ),
            ],
          ),
          const SizedBox(height: AppPadding.mediumP * 2),
          const _BodyInfoSection(),
        ],
      ),
    );
  }
}

class _HeaderProfile extends StatelessWidget {
  const _HeaderProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: AppColors.subStrate,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.bigP * 2),
        child: Row(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 100, maxWidth: 100),
              child: const Placeholder(),
            ),
            const SizedBox(width: AppPadding.bigP),
            Text(
              "Иван Петров",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 40,
                    fontFamily: AppFonts.primaryFontRegular,
                    color: Colors.black,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BonusCardWidget extends StatelessWidget {
  const _BonusCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.bigP * 2, bottom: AppPadding.mediumP),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Бонусная карта',
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    Text(
                      '№22814881337',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: AppPadding.mediumP, bottom: AppPadding.mediumP),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '25678',
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: AppColors.appBarTitle,
                          ),
                    ),
                    Text(
                      'баллов',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 30,
            left: 10,
            child: Text(
              '10%',
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: Colors.white.withOpacity(0.25),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BodyInfoSelectionBar extends StatelessWidget {
  const _BodyInfoSelectionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.mediumP * 2),
      child: Row(
        children: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Мои настрйоки",
                style: Theme.of(context).textTheme.headline5,
              )),
          const SizedBox(width: AppPadding.bigP),
          TextButton(
              onPressed: () {},
              child: Text(
                "Список покупок",
                style: Theme.of(context).textTheme.headline5,
              )),
          const SizedBox(width: AppPadding.bigP),
          TextButton(
              onPressed: () {},
              child: Text(
                "История покупок",
                style: Theme.of(context).textTheme.headline5,
              )),
          const SizedBox(width: AppPadding.bigP),
          TextButton(
              onPressed: () {},
              child: Text(
                "Мои отзывы",
                style: Theme.of(context).textTheme.headline5,
              )),
        ],
      ),
    );
  }
}

class _BodyInfoSection extends StatelessWidget {
  const _BodyInfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.bigP * 2),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 450),
        child: IndexedStack(
          index: 0,
          children: const [
            MySettingsView(),
          ],
        ),
      ),
    );
  }
}

class _FooterInfo extends StatelessWidget {
  const _FooterInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [],
    );
  }
}
