import 'package:flutter/material.dart';

import '/screens/screens.dart';
import '/models/models.dart';
import '/services/product_services.dart';
import 'widgets.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late Future _products;

  Future _getProducts() {
    return ProductService.getProducts();
  }

  @override
  void initState() {
    super.initState();
    _products = _getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _products,
      builder: (context, snapshot) {
        List<Product>? products = snapshot.data as List<Product>?;
        return snapshot.connectionState == ConnectionState.waiting
            ? const SizedBox(
                height: 220,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Container(
                height: 220,
                padding: const EdgeInsets.only(left: 15),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products?.length ?? 0,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(ProductDetailScreen.routeName);
                      },
                      child: ProductCard(
                        imageUrl: products?[index].images ?? '',
                        title: products?[index].title ?? '',
                        price: products?[index].price ?? '',
                      ),
                    );
                  },
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                ),
              );
      },
    );
  }
}
