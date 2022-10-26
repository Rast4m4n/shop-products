import 'package:flutter/material.dart';
import 'package:shop_products/ui/theme/app_icons.dart';
import 'package:shop_products/ui/theme/app_paddings.dart';

class BankTypeTextWidget extends StatelessWidget {
  const BankTypeTextWidget({
    Key? key,
    required this.numberCard,
    required this.image,
  }) : super(key: key);

  final String numberCard;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image(image: AssetImage(image)),
        const SizedBox(width: AppPadding.smallP - 4),
        Text(
          'Карта $numberCard',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
        ),
        const Radio(value: 'value', groupValue: 'groupValue', onChanged: null),
      ],
    );
  }
}
