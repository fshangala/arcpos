import 'package:arcpos/models/product_model.dart';
import 'package:arcpos/viewmodels/app_viewmodel.dart';
import 'package:arcpos/viewmodels/home_product_page_viewmodel.dart';
import 'package:arcpos/views/home_page_view.dart';
import 'package:arcpos/views/home_products_page_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  static final List<Widget> _widgetOptions = <Widget>[
    HomePageView(),
    HomeProductsPageView(),
    Text('Orders Screen'),
  ];

  void addAction() {}

  @override
  Widget build(BuildContext context) {
    final appViewModel = Provider.of<AppViewModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: () => addAction()),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(value: 'add_product', child: Text('Add Product')),
                PopupMenuItem(value: 'settings', child: Text('Settings')),
              ];
            },
            onSelected: (value) {
              // if (value == 'add_product') {
              //   final homeProductPageViewModel = Provider.of<HomeProductPageViewModel>(context, listen: false);
              //   homeProductPageViewModel.addProduct(ProductModel(name: 'New Product', description: 'Product Description'));
              // } else if (value == 'settings') {
              //   // Handle settings action
              // }
            },
          ),
        ],
      ),
      body: Center(child: _widgetOptions.elementAt(appViewModel.selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Orders',
          ),
        ],
        currentIndex: appViewModel.selectedIndex,
        onTap: appViewModel.selectIndex,
      ),
    );
  }
}
