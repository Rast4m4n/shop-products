import 'package:flutter/material.dart';
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
                children: [
                  _BodyProfile(),
                  SizedBox(height: 20),
                  _BodyMenuBar(),
                ],
              ),
              const Positioned(
                right: AppPadding.mediumP,
                bottom: AppPadding.mediumP,
                child: BonusCardWidget(),
              ),
            ],
          ),
          SizedBox(height: 26),
        ],
      ),
    );
  }
}

class _BodyProfile extends StatelessWidget {
  const _BodyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: AppColors.subStrate,
      child: Row(
        children: [
          const SizedBox(width: AppPadding.bigP * 2),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 100, maxWidth: 100),
            child: const Placeholder(),
          ),
          const SizedBox(width: AppPadding.bigP),
          Text(
            "Иван Петров",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 40,
                  fontFamily: AppFonts.primaryFontMedium,
                  color: Colors.black,
                ),
          ),
        ],
      ),
    );
  }
}

class BonusCardWidget extends StatelessWidget {
  const BonusCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 35, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'бонусная карта',
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
                padding: const EdgeInsets.only(right: 10, bottom: 10),
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

class _BodyMenuBar extends StatelessWidget {
  const _BodyMenuBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: AppPadding.bigP),
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
    );
  }
}
