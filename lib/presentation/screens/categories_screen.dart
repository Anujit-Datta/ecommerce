import 'package:ecommerce/presentation/screens/category_wise_product_list.dart';
import 'package:ecommerce/presentation/utils/asset_paths.dart';
import 'package:ecommerce/presentation/widgets/category_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0,left: 16,right: 16),
              child: GridView.builder(
                itemCount: 16,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Get.to(() => const CategoryWiseProductList(category: 'Electronics'));
                    },
                    child: const CategoryView(
                      categoryImage: AssetPaths.electronicsCategoryLogo,
                      categoryName: 'Electronics',
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
