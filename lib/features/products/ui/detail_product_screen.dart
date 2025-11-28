import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_x/features/main/home/product_provider.dart';
import 'package:shop_x/features/widgets/product_image_gallery_widget.dart';
import 'package:shop_x/features/widgets/product_rating_widget.dart';
import 'package:shop_x/utils/helper.dart';

class DetailProductScreen extends ConsumerWidget {
  const DetailProductScreen({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(fetchProductById(productId));

    return Scaffold(
      body: productState.when(
        data: (product) {
          if (product == null) {
            return Center(child: Text("Product not found"));
          }

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                stretch: true,
                pinned: true,
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    product.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  centerTitle: true,
                  titlePadding: EdgeInsets.only(bottom: 16),

                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      /// Paling bawah
                      Image.network(
                        product.thumbnail,
                        fit: BoxFit.cover,
                        cacheHeight: 200,
                        cacheWidth: 200,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image, size: 48),
                      ),

                      /// Urutan terakhir ada id paling atas
                      const DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.center,
                            colors: [Color(0xffeeeeee), Colors.transparent],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      ProductImageGalleryWidget(
                        images: product.images,
                        height: 84,
                        imageSize: 84,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        currencyFormatterIDR.format(product.price),
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      ProductRatingWidget(
                        rating: product.rating,
                        reviews: product.reviews,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Description',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product.description,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Tags',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: List.generate(
                          product.tags.length,
                          (index) => Chip(label: Text(product.tags[index])),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => Center(child: CircularProgressIndicator.adaptive()),
      ),
    );
  }
}
