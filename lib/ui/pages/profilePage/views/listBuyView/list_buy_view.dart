import 'package:flutter/material.dart';
import 'package:shop_products/ui/theme/app_paddings.dart';
import 'package:shop_products/ui/theme/app_theme.dart';

class ListBuyView extends StatelessWidget {
  const ListBuyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.smallP),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.add,
                    size: 54,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: AppPadding.mediumP),
                Text(
                  'Новый список',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontFamily: AppFonts.primaryFontRegular,
                        fontSize: 24,
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
