import 'package:deliverpros/widgets/products_grid.dart';
import 'package:flutter/material.dart';


class ProductsScreen extends StatelessWidget {
  final String type;

  ProductsScreen(this.type);
  @override
  Widget build(BuildContext context) {
    return ProductsGrid(type);
  }
}
