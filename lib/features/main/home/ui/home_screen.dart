import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_x/features/main/home/product_provider.dart';
import 'package:shop_x/features/products/ui/detail_product_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesState = ref.watch(fetchCategoryProductProvider);
    final productsState = ref.watch(fetchProductsProvider);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 48,
            child: categoriesState.when(
              /// SUccess
              data: (data) => ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 8),
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ChoiceChip(
                    visualDensity: const VisualDensity(
                      horizontal: 0.0,
                      vertical: -1,
                    ),
                    onSelected: (val) {},

                    selectedColor: Colors.white,
                    checkmarkColor: Theme.of(context).primaryColor,
                    selected: false,
                    label: Text(
                      data[index].name,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    labelStyle: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),

                    side: BorderSide(
                      color: Theme.of(
                        context,
                      ).primaryColor.withValues(alpha: 0.2),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                },
              ),

              /// Error
              error: (error, stackTrace) =>
                  Center(child: Text(error.toString())),

              /// Loading
              loading: () =>
                  Center(child: CircularProgressIndicator.adaptive()),
            ),
          ),
          SizedBox(height: 12),

          /// Products
          Expanded(
            child: productsState.when(
              data: (products) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.48,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: products.length,
                  itemBuilder: (_, i) {
                    final product = products[i];
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 2,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailProductScreen(productId: product.id),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Thumbnail
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey.shade200,
                                ),
                                child: Center(
                                  child: Image.network(product.thumbnail),
                                ),
                              ),
                              const SizedBox(height: 8),
                              // if (product.images.isNotEmpty)
                              //   ProductImageGalleryWidget(images: product.images),
                              const SizedBox(height: 8),

                              /// Brand
                              if (product.brand.isNotEmpty)
                                Text(
                                  product.brand.toString().toUpperCase(),
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              const SizedBox(height: 4),

                              /// Title
                              Text(
                                product.title,
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              // ProductRatingWidget(
                              //   rating: product.rating,
                              //   reviews: product.reviews,
                              // ),
                              const Spacer(),
                              // ProductPriceWidget(price: product.price),
                              if (product.discountPercentage > 0)
                                Text(
                                  '${product.discountPercentage}% off',
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(
                                        color: Colors.green.shade700,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              error: (err, stack) => Center(child: Text(err.toString())),
              loading: () =>
                  Center(child: CircularProgressIndicator.adaptive()),
            ),
          ),
        ],
      ),
    );
  }
}
