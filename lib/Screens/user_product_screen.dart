import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Screens/edit_product_screen.dart';
import '../providers/products.dart';
import '../widgets/app_drawer.dart';
import '../widgets/user_product_item.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/user-products';

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false)
        .fetchAndSetProducts(true);
  }

  @override
  Widget build(BuildContext context) {
    // final productData = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: _refreshProducts(context),
        builder: (ctx, snapshot) => RefreshIndicator(
          child: RefreshIndicator(
            onRefresh: () => snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : _refreshProducts(context),
            child: Consumer<Products>(
              builder: (ctx, productData, _) => Padding(
                padding: EdgeInsets.all(8),
                child: ListView.builder(
                  itemCount: productData.items.length,
                  itemBuilder: (_, i) => Column(
                    children: [
                      UserProductItem(
                        productData.items[i].title,
                        productData.items[i].imageUrl,
                        productData.items[i].id,
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
