import 'package:flutter/material.dart';
import 'package:shop_products/domains/state/theme_switcher.dart';

class UserTab extends StatelessWidget {
  const UserTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      tooltip: 'Пользователь',
      icon: const Icon(Icons.person),
      itemBuilder: (BuildContext context) {
        return const [
          PopupMenuItem(child: ListTile(title: Text('Профиль'))),
          PopupMenuItem(child: ListTile(title: Text('Избранные'))),
          PopupMenuItem(child: _ThemeSwitcherWidget()),
          PopupMenuItem(
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
