
import 'package:flutter/material.dart';
import 'package:shop_products/ui/theme/app_theme.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
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