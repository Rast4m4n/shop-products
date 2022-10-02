import 'package:flutter/material.dart';
import 'package:shop_products/theme/app_theme.dart';
import 'package:shop_products/ui/home/view_model_home_page.dart';

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
        final isMobile = constraints.maxWidth < 900;
        if (isMobile) {
          return Scaffold(
            appBar: appBar,
            body: body,
            bottomNavigationBar: bottomNavigationBar,
            drawer: const Drawer(),
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

//Для веб/десктопа
class PageHeaderWidget extends StatelessWidget {
  PageHeaderWidget({Key? key}) : super(key: key);

  final List<PopupMenuEntry<dynamic>> categoryProducts = const [
    PopupMenuItem(child: Text('Молочные изделия')),
    PopupMenuItem(child: Text('Овощи и фрукты')),
    PopupMenuItem(child: Text('Мясо и рыба')),
    PopupMenuItem(child: Text('Чай и кофе')),
    PopupMenuItem(child: Text('Напитки')),
    PopupMenuItem(child: Text('Орехи и снеки')),
  ];
  final model = ViewModelHomePage();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: AppColors.primaryColor,
      child: Row(
        children: [
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Expanded(
                  child: Text(
                    'магия',
                    style: TextStyle(
                      color: AppColors.appBarTitle,
                      fontFamily: 'DaysOne',
                      fontSize: 32,
                      height: 1.6,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'вкуса',
                    style: TextStyle(
                      color: AppColors.appBarTitle,
                      fontFamily: 'DaysOne',
                      fontSize: 32,
                      height: 0.8,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          PopupMenuButton(
              tooltip: '',
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.appBarTitle,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                  child: Text(
                    'каталог',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              itemBuilder: (BuildContext context) {
                return categoryProducts;
              }),
          const SizedBox(width: 43),
          const Expanded(flex: 2, child: SearchField()),
          const SizedBox(width: 64),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Санкт-Петербург',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'ул. Адмирала Ноунейма, 13',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(width: 64),
          Expanded(
            child: TextButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.shopping_bag, color: AppColors.appBarTitle),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Корзина',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 34),
          Expanded(
            child: TextButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.favorite_outline, color: AppColors.appBarTitle),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Избранные',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 34),
          Expanded(
            child: TextButton(
              onPressed: () => model.enterProfilePage(context),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.person_outline, color: AppColors.appBarTitle),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Профиль',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffDDE7FF),
        isCollapsed: true,
        contentPadding: EdgeInsets.all(14),
        prefixIcon: Icon(Icons.search, size: 18, color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        hintText: "Поиск",
        hintStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
