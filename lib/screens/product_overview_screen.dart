import 'package:flutter/material.dart';
import 'package:flutter_shops/providers/cart.dart';
import 'package:flutter_shops/screens/cart_screen.dart';
import 'package:flutter_shops/widgets/badge.dart';
import 'package:flutter_shops/widgets/products_grid.dart';
import 'package:provider/provider.dart';

enum FIlterOptions {
  favorites,
  all,
}

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _showFavorites = false;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (FIlterOptions option) {
              setState(() {
                if (option == FIlterOptions.favorites) {
                  _showFavorites = true;
                } else {
                  _showFavorites = false;
                }
              });
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                  child: Text('Only Favorites'),
                  value: FIlterOptions.favorites),
              const PopupMenuItem(
                child: Text('Show all'),
                value: FIlterOptions.all,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch ?? const Text('Emtpy cart'),
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  CartScreen.routeName,
                );
              },
            ),
          ),
        ],
      ),
      body: ProductsGrid(
        showFavorites: _showFavorites,
      ),
    );
  }
}
