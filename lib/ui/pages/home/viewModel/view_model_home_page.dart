import 'package:flutter/material.dart';
import 'package:shop_products/ui/navigator/app_navigation.dart';

class ViewModelHomePage {
  // void enterProfilePage(BuildContext context) {
  //   Navigator.of(context).pushNamed(AppRouteNames.profile);
  // }

  void returnToMainPage(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRouteNames.home, (route) => false);
  }
}
