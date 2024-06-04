import 'package:ecommerce/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

class CategoryWiseProductList extends StatelessWidget {
  const CategoryWiseProductList({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    final sizes=MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0,left: 16,right: 16),
              child: GridView.builder(
                itemCount: 16,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(sizes: sizes, imageLink: 'assets/images/shoe.png', productName: 'Name', price: 100, rating: '4.7', isWishListed: true);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
