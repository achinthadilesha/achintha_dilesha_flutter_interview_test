import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '/models/models.dart';

class ProductRatingComponent extends StatelessWidget {
  const ProductRatingComponent({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: product?.rating ?? 1,
      minRating: product?.rating ?? 1,
      maxRating: product?.rating ?? 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 18,
      itemPadding: const EdgeInsets.only(left: 5),
      itemBuilder: (context, _) => const Icon(
        Icons.star_outline,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
