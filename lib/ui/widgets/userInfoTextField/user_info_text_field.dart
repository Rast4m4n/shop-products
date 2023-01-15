import 'package:flutter/material.dart';
import 'package:shop_products/ui/theme/app_paddings.dart';
import 'package:shop_products/ui/theme/app_theme.dart';

class UserInfoTextFieldWidget extends StatelessWidget {
  const UserInfoTextFieldWidget({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);
  final String labelText;
  final TextEditingController controller;
  final VoidCallback onChanged;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300),
      child: TextField(
        controller: controller,
        onChanged: (value) => onChanged,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontFamily: AppFonts.primaryFontRegular,
            ),
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
            height: 2,
            fontSize: 16,
          ),
          contentPadding: const EdgeInsets.only(
            top: AppPadding.bigP,
            bottom: AppPadding.mediumP,
            left: AppPadding.smallP,
            right: AppPadding.mediumP,
          ),
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
