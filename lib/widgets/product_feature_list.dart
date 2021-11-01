import 'package:flutter/material.dart';

import '/models/models.dart';
import 'widgets.dart';

class ProductFeatureList extends StatelessWidget {
  final List<ProductFeatures> _productFeatures = [
    ProductFeatures(
      iconName: Icons.remove_red_eye,
      productFeature: 'Improved Optics',
    ),
    ProductFeatures(
      iconName: Icons.brightness_5,
      productFeature: 'Clear Brightness',
    ),
    ProductFeatures(
      iconName: Icons.wifi,
      productFeature: 'Wifi Controllers',
    ),
  ];

  ProductFeatureList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _productFeatures
            .map((feature) => ProductFeatureCustomComponent(
                  iconName: feature.iconName,
                  featureText: feature.productFeature,
                ))
            .toList());
  }
}

class ProductFeatureCustomComponent extends StatelessWidget {
  final IconData iconName;
  final String featureText;

  const ProductFeatureCustomComponent({
    required this.iconName,
    required this.featureText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.black12,
            ),
          ),
          child: Icon(iconName),
        ),
        const SizedBox(height: 15),
        CustomText(
          text: featureText,
          color: Colors.black,
          fontSize: 13,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
