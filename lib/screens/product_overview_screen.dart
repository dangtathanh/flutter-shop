import 'package:flutter/material.dart';
import 'package:flutter_shops/widgets/producs_grid.dart';

class ProductOverviewScreen extends StatelessWidget {

  const ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
      ),
      body: ProductsGrid(),
    );
  }
}


