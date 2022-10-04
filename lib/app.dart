import 'package:flutter/material.dart';
import 'package:shop_products/domain/state/theme_switcher.dart';
import 'package:shop_products/ui/navigator/app_navigation.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.navigation}) : super(key: key);
  final AppNavigation navigation;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    ThemeSwitcher.instance.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Магия вкуса',
      theme: ThemeSwitcher.instance.currentTheme(),
      initialRoute: widget.navigation.initialRoute,
      routes: widget.navigation.routes,
    );
  }
}
