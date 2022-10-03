import 'package:flutter/material.dart';
import 'package:shop_products/theme/app_theme.dart';
import 'package:shop_products/ui/widgets/page_wrapper.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      appBar: AppBar(title: const Text('Профиль')),
      body: Column(
        children: const [
          HeaderProfile(),
          SizedBox(height: 20),
          BodyBarProfile(),
          SizedBox(height: 26),
          BodyProfileView(),
        ],
      ),
    );
  }
}

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: AppColors.subStrate,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 51),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 100,
              maxWidth: 100,
            ),
            child: const Placeholder(),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              "Иван Петров",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 40,
                    fontFamily: AppFonts.primaryFontMedium,
                    color: Colors.black,
                  ),
            ),
          ),
          const SizedBox(width: 400),
          const BonusCardWidget(),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}

class BonusCardWidget extends StatelessWidget {
  const BonusCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 120,
        width: 400,
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 28, left: 45),
              child: Text(
                "бонусная карта",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "25678",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontSize: 28,
                          color: AppColors.appBarTitle,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "баллов",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BodyBarProfile extends StatelessWidget {
  const BodyBarProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 40),
        Expanded(
          child: TextButton(
            onPressed: () {},
            child: Text(
              "Мои настройки",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontFamily: AppFonts.primaryFontMedium,
                  ),
            ),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {},
            child: Text(
              "Список покупок",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontFamily: AppFonts.primaryFontMedium,
                    color: const Color(0x75000000),
                  ),
            ),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {},
            child: Text(
              "История покупок",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontFamily: AppFonts.primaryFontMedium,
                    color: const Color(0x75000000),
                  ),
            ),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {},
            child: Text(
              "Мои отзывы",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontFamily: AppFonts.primaryFontMedium,
                    color: const Color(0x75000000),
                  ),
            ),
          ),
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}

class BodyProfileView extends StatelessWidget {
  const BodyProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200),
      child: IndexedStack(
        index: 0,
        children: const [],
      ),
    );
  }
}
