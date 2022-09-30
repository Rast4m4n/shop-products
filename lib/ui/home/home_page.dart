import 'package:flutter/material.dart';
import 'package:shop_products/ui/home/catalogView/catalog_view.dart';
import 'package:shop_products/ui/home/mainShopView/main_shop_view.dart';
import 'package:shop_products/ui/home/shoppingCart/shopping_cart_view.dart';
import 'package:shop_products/ui/home/userTab/user_tab.dart';
import 'package:shop_products/ui/widgets/page_wrapper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _selectedItemBar(int index) {
    if (_selectedIndex == index) return;
    _selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      appBar: AppBar(
        title: const Text('Магия вкуса'),
        actions: const [UserTab()],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          MainShopView(),
          CatalogView(),
          ShoppingCartView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedItemBar,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Каталог'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Корзина'),
        ],
      ),
    );
  }
}