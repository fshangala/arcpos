import 'package:arcpos/viewmodels/home_product_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeProductsPageView extends StatefulWidget {
  const HomeProductsPageView({super.key});

  @override
  State<StatefulWidget> createState() => _HomeProductsPageViewState();
}

class _HomeProductsPageViewState extends State<HomeProductsPageView> {
  @override
  Widget build(BuildContext context) {
    final homeProductPageViewModel = Provider.of<HomeProductPageViewModel>(
      context,
      listen: true,
    );
    return ListView(
      children:
          homeProductPageViewModel.products.map((product) {
            return ListTile(
              title: Text(product.name),
              subtitle: Text(product.description),
              leading: Icon(Icons.inventory),
            );
          }).toList(),
    );
  }
}
