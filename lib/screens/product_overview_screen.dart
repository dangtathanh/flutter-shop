import 'package:flutter/material.dart';
import 'package:flutter_shops/widgets/producs_grid.dart';

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
        ],
      ),
      body: ProductsGrid(
        showFavorites: _showFavorites,
      ),
    );
  }
}
