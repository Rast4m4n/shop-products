import 'package:flutter/material.dart';
import 'package:shop_products/ui/theme/app_icons.dart';
import 'package:shop_products/ui/theme/app_paddings.dart';
import 'package:shop_products/ui/theme/app_theme.dart';

class FooterInfo extends StatelessWidget {
  const FooterInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _FooterOtherInfoWidget(),
        _FotterAppOfDevelopersWidget(),
      ],
    );
  }
}

class _FooterOtherInfoWidget extends StatelessWidget {
  const _FooterOtherInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.subStrate,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.bigP * 2, vertical: AppPadding.bigP - 6),
        child: Row(
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'О нас',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.black.withOpacity(0.7),
                    fontFamily: AppFonts.primaryFontBold),
              ),
            ),
            const SizedBox(width: AppPadding.bigP),
            TextButton(
              onPressed: () {},
              child: Text(
                'Партнёры',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.black.withOpacity(0.7),
                    fontFamily: AppFonts.primaryFontBold),
              ),
            ),
            const SizedBox(width: AppPadding.bigP),
            TextButton(
              onPressed: () {},
              child: Text(
                'Карьера',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.black.withOpacity(0.7),
                    fontFamily: AppFonts.primaryFontBold),
              ),
            ),
            const SizedBox(width: AppPadding.bigP),
            TextButton(
              onPressed: () {},
              child: Text(
                'Помощь',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.black.withOpacity(0.7),
                    fontFamily: AppFonts.primaryFontBold),
              ),
            ),
            const Spacer(),
            InkWell(
              splashColor: Colors.black,
              onTap: () {},
              borderRadius: BorderRadius.circular(18),
              child: const Icon(
                AppIcons.dzen,
                color: AppColors.primaryPurple,
              ),
            ),
            const SizedBox(width: AppPadding.bigP),
            InkWell(
              splashColor: Colors.blue,
              onTap: () {},
              borderRadius: BorderRadius.circular(18),
              child: const Icon(
                AppIcons.vk,
                color: AppColors.primaryPurple,
              ),
            ),
            const SizedBox(width: AppPadding.bigP),
            InkWell(
              splashColor: AppColors.primaryPurple,
              onTap: () {},
              borderRadius: BorderRadius.circular(18),
              child: const Icon(
                AppIcons.youtube,
                color: AppColors.primaryPurple,
              ),
            ),
            const SizedBox(width: AppPadding.bigP),
            InkWell(
              splashColor: AppColors.primaryPurple,
              onTap: () {},
              borderRadius: BorderRadius.circular(18),
              child: const Icon(
                AppIcons.viber,
                color: AppColors.primaryPurple,
              ),
            ),
            const SizedBox(width: AppPadding.bigP),
            InkWell(
              splashColor: AppColors.primaryPurple,
              onTap: () {},
              borderRadius: BorderRadius.circular(18),
              child: const Icon(
                AppIcons.whatsapp,
                color: AppColors.primaryPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FotterAppOfDevelopersWidget extends StatelessWidget {
  const _FotterAppOfDevelopersWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.subStrate.withOpacity(0.15),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.bigP * 2, vertical: AppPadding.smallP - 4),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Text(
                '©2022 Магия вкуса',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.black.withOpacity(0.5),
                    ),
              ),
              const SizedBox(width: AppPadding.bigP),
              const _AppServiceWidget(
                  text: 'Google Play', image: "assets/images/googlePlay.png"),
              const SizedBox(width: AppPadding.bigP),
              const _AppServiceWidget(
                  text: 'App Store', image: "assets/images/appStore.png"),
              const SizedBox(width: AppPadding.bigP),
              const _AppServiceWidget(
                  text: 'AppGallery', image: "assets/images/appGallery.png"),
              const Spacer(),
              const _DevelopersOfAppWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppServiceWidget extends StatelessWidget {
  const _AppServiceWidget({Key? key, required this.text, required this.image})
      : super(key: key);
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Image(image: AssetImage(image)),
          const SizedBox(
            width: AppPadding.smallP,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.black.withOpacity(0.5),
                ),
          ),
        ],
      ),
    );
  }
}

class _DevelopersOfAppWidget extends StatelessWidget {
  const _DevelopersOfAppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MOT | ',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 20, color: Colors.black.withOpacity(0.5)),
            ),
            Text(
              "programming",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontSize: 8, color: Colors.black.withOpacity(0.5)),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              'CODEX',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 20, color: Colors.black.withOpacity(0.5)),
            ),
            Text(
              "design",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontSize: 8, color: Colors.black.withOpacity(0.5)),
            ),
          ],
        ),
      ],
    );
  }
}
