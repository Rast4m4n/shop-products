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

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      key: UniqueKey(),
      tooltip: 'Пользователь',
      icon: const Icon(Icons.person),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            child: _PopupItemWidget(
              name: 'Профиль',
              onTap: () => model.enterProfilePage(context),
            ),
          ),
          const PopupMenuItem(
            child: _PopupItemWidget(
              name: 'Избранные',
            ),
          ),
          const PopupMenuItem(
            child: _ThemeSwitcherWidget(),
          ),
          const PopupMenuItem(
            child: _PopupItemWidget(
              name: 'Выход',
            ),
          ),
        ];
      },
    );
  }
}

class _PopupItemWidget extends StatelessWidget {
  const _PopupItemWidget({
    Key? key,
    required this.name,
    this.onTap,
    this.trailing,
  }) : super(key: key);

  final String name;
  final VoidCallback? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(name, style: Theme.of(context).popupMenuTheme.textStyle),
      trailing: trailing,
    );
  }
}

class _ThemeSwitcherWidget extends StatefulWidget {
  const _ThemeSwitcherWidget({Key? key}) : super(key: key);

  @override
  State<_ThemeSwitcherWidget> createState() => _ThemeSwitcherWidgetState();
}

class _ThemeSwitcherWidgetState extends State<_ThemeSwitcherWidget> {
  void _onSwitched(bool value) {
    ThemeSwitcher.instance.switchTheme();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _PopupItemWidget(
      name: 'Тёмная тема',
      trailing: Switch(
        activeColor: Colors.deepPurple,
        value: ThemeSwitcher.isDark,
        onChanged: _onSwitched,
      ),
    );
  }
}
