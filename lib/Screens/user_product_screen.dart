import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Screens/edit_product_screen.dart';
import 'package:flutter_complete_guide/providers/products.dart';
import 'package:flutter_complete_guide/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

import '../widgets/user_product_item.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({Key key}) : super(key: key);
  static const routeName = '/user-products';

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);

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
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productData.items.length,
          itemBuilder: (_, i) => Column(
            children: [
              UserProductItem(
                productData.items[i].id,
                productData.items[i].title,
                productData.items[i].imageUrl,
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
