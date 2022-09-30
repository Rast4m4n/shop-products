import 'package:flutter/material.dart';
import 'package:shop_products/theme/app_theme.dart';

class PageWrapper extends StatelessWidget {
  const PageWrapper(
      {Key? key, required this.body, this.bottomNavigationBar, this.appBar})
      : super(key: key);
  final Widget body;
  final PreferredSizeWidget? appBar;
  final BottomNavigationBar? bottomNavigationBar;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        if (isMobile) {
          return Scaffold(
            appBar: appBar,
            body: body,
            bottomNavigationBar: bottomNavigationBar,
            drawer: Drawer(),
          );
        } else {
          return Scaffold(
            body: Column(
              children: [
                PageHeaderWidget(),
                Expanded(child: body),
              ],
            ),
          );
        }
      }),
    );
  }
}

class PageHeaderWidget extends StatelessWidget {
  const PageHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: AppColors.primaryColor,
      child: Row(
        children: [
          const SizedBox(width: 40),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Магия Вкуса',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'RoundsBlack',
                  fontSize: 32,
                ),
              ),
            ],
          ),
          const SizedBox(width: 40),
          PopupMenuButton(
              tooltip: 'Каталог',
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(child: Text('data')),
                  const PopupMenuItem(child: Text('data')),
                  const PopupMenuItem(child: Text('data')),
                ];
              })
        ],
      ),
    );
  }
}
