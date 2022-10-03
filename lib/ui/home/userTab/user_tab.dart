import 'package:flutter/material.dart';
import 'package:shop_products/domains/state/theme_switcher.dart';
import 'package:shop_products/ui/home/view_model_home_page.dart';

class UserTab extends StatelessWidget {
  UserTab({Key? key}) : super(key: key);
  final model = ViewModelHomePage();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      tooltip: 'Пользователь',
      icon: const Icon(Icons.person),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            child: ListTile(
              onTap: () => model.enterProfilePage(context),
              title: const Text('Профиль'),
            ),
          ),
          const PopupMenuItem(child: ListTile(title: Text('Избранные'))),
          const PopupMenuItem(child: _ThemeSwitcherWidget()),
          const PopupMenuItem(
            child: ListTile(title: Text('Выход')),
          ),
        ];
      },
    );
  }
}

class _ThemeSwitcherWidget extends StatefulWidget {
  const _ThemeSwitcherWidget({Key? key}) : super(key: key);

  @override
  State<_ThemeSwitcherWidget> createState() => __ThemeSwitcherWidgetState();
}

class __ThemeSwitcherWidgetState extends State<_ThemeSwitcherWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Тёмная тема'),
      trailing: Switch(
        activeColor: Colors.deepPurple,
        value: ThemeSwitcher.isDark,
        onChanged: (value) {
          ThemeSwitcher.instance.switchTheme();
          setState(() {});
        },
      ),
    );
  }
}
