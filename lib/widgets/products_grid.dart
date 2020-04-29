import '../providers/products.dart';
import '../widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class ProductsGrid extends StatelessWidget {
  final String type;
  ProductsGrid(this.type);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products = productData.sortedProducts(type);
    return GridView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: products.length,
          itemBuilder: (context, index) => ChangeNotifierProvider.value(
            value: products[index],
            child: ProductItem(),
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 163 /263,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ));
  }
}
