import 'package:ecommerce/data/models/product_model.dart';
import 'package:ecommerce/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizes=MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('WishList'),
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
                  childAspectRatio: 0.73,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(sizes: sizes, product: Product(),);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
