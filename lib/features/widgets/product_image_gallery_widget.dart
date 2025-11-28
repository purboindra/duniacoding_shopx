import 'package:flutter/material.dart';

class ProductImageGalleryWidget extends StatelessWidget {
  const ProductImageGalleryWidget({
    super.key,
    required this.images,
    this.imageSize = 40,
    this.height = 40,
  });

  final List<String> images;
  final double imageSize;
  final double height;

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return const SizedBox();
    }

    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: images.length > 4 ? 4 : images.length,
        separatorBuilder: (context, index) => const SizedBox(width: 4),
        itemBuilder: (context, index) {
          return Container(
            width: imageSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
              image: DecorationImage(
                image: NetworkImage(images[index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
