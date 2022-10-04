import 'package:flutter/material.dart';
import 'package:shop_products/domains/state/theme_switcher.dart';
import 'package:shop_products/ui/home/view_model_home_page.dart';

class UserTab extends StatefulWidget {
  const UserTab({Key? key}) : super(key: key);

  @override
  State<UserTab> createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> {
  final model = ViewModelHomePage();

  void update() => setState(() {});

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
              title: Text(
                'Профиль',
                style: Theme.of(context).popupMenuTheme.textStyle,
              ),
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              title: Text(
                'Избранные',
                style: Theme.of(context).popupMenuTheme.textStyle,
              ),
            ),
          ),
          PopupMenuItem(
            child: _ThemeSwitcherWidget(callBack: update),
          ),
          PopupMenuItem(
            child: ListTile(
              title: Text(
                'Выход',
                style: Theme.of(context).popupMenuTheme.textStyle,
              ),
            ),
          ),
        ];
      },
    );
  }
}

class _ThemeSwitcherWidget extends StatelessWidget {
  const _ThemeSwitcherWidget({Key? key, required this.callBack})
      : super(key: key);
  final VoidCallback callBack;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Тёмная тема',
        style: Theme.of(context).popupMenuTheme.textStyle,
      ),
      trailing: Switch(
        activeColor: Colors.deepPurple,
        value: ThemeSwitcher.isDark,
        onChanged: (value) {
          ThemeSwitcher.instance.switchTheme();
          callBack;
        },
      ),
    );
  }
}
