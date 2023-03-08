import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Screens/edit_product_screen.dart';
import 'package:provider/provider.dart';

import '../Screens/user_product_screen.dart';
import '../Screens/cart_screens.dart';
import '../providers/cart.dart';
import '../providers/orders.dart';
import './Screens/product_overview_screen.dart';
import './Screens/product_detail_screen.dart';
import './providers/products.dart';
import './Screens/orders_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
              .copyWith(secondary: Colors.deepOrange),
        ),
        home: ProductOverviewScreeen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          UserProductScreen.routeName: (ctx) => UserProductScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen(),
        },
      ),
    );
  }
}
