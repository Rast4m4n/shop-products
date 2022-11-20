import 'package:flutter/material.dart';
import 'package:shop_products/ui/theme/app_paddings.dart';
import 'package:shop_products/ui/theme/app_theme.dart';

class BonusCardWidget extends StatelessWidget {
  const BonusCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.primaryPurple,
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
                padding: const EdgeInsets.only(
                    right: AppPadding.mediumP, bottom: AppPadding.mediumP),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '0',
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: AppColors.secondaryYellow,
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
              '1%',
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
