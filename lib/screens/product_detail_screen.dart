import 'package:flutter/material.dart';

import '/services/product_services.dart';
import '/models/models.dart';
import '/widgets/widgets.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = '/productdetail';

  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late Future _productDetail;

  Future _getProductDetail() {
    return ProductService.getSingleProduct();
  }

  @override
  void initState() {
    super.initState();
    _productDetail = _getProductDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(
              top: 10,
              right: 20,
            ),
            child: AppBarButton(
              iconName: Icons.shopping_bag_outlined,
              iconColor: Colors.white,
              isDotActive: true,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _productDetail,
        builder: (context, snapshot) {
          Product? product = snapshot.data as Product?;

          return snapshot.connectionState == ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Stack(
                  children: [
                    Image.network(
                      product?.images ?? '',
                      fit: BoxFit.contain,
                      height: MediaQuery.of(context).size.height * 0.5,
                    ),
                    DraggableScrollableSheet(
                      maxChildSize: 0.85,
                      minChildSize: 0.50,
                      builder: (context, scrollController) {
                        return Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45),
                              topRight: Radius.circular(45),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              top: 20,
                              right: 20,
                              bottom: 10,
                            ),
                            child: SingleChildScrollView(
                              controller: scrollController,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 20),
                                        height: 3,
                                        width: 80,
                                        color: Colors.grey[300],
                                      ),
                                    ],
                                  ),
                                  CustomText(
                                    text: product?.title ?? '',
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  Row(
                                    children: [
                                      const Spacer(),
                                      CustomText(
                                        text: product?.price ?? '',
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      ProductRatingComponent(product: product),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      CustomText(
                                        text: product?.rating.toString() ?? '',
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomText(
                                    text: product?.description ?? '',
                                    color: Colors.grey[500]!,
                                    fontSize: 14,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ProductFeatureList(),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  ConstrainedBox(
                                    constraints: BoxConstraints.tightFor(
                                      width: MediaQuery.of(context).size.width,
                                      height: 54,
                                    ),
                                    child: const CustomButton(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
        },
      ),
    );
  }
}
