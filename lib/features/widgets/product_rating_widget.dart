import 'package:flutter/material.dart';
import 'package:shop_x/model/review_model.dart';

class ProductRatingWidget extends StatelessWidget {
  const ProductRatingWidget({
    super.key,
    required this.rating,
    required this.reviews,
  });

  final double rating;
  final List<ReviewModel> reviews;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (rating > 0)
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 16),
              const SizedBox(width: 4),
              Text(
                rating.toString(),
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        if (reviews.isNotEmpty)
          Text(
            ' (${reviews.length})',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
          ),
      ],
    );
  }
}
