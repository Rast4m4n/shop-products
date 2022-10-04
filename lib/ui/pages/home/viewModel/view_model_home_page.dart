import 'package:flutter/material.dart';
import 'package:shop_products/ui/navigator/app_navigation.dart';

class ViewModelHomePage {
  void enterProfilePage(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoute.profile);
  }

  void returnTomainPage(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoute.main, (route) => false);
  }
}
