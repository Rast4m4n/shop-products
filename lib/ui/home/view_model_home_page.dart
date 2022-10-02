import 'package:flutter/material.dart';
import 'package:shop_products/navigation/app_navigation.dart';

class ViewModelHomePage {
  void enterProfilePage(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoute.profile);
  }
}
