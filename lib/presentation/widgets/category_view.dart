import 'package:ecommerce/presentation/utils/app_colors.dart';
import 'package:ecommerce/presentation/widgets/logo.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({
    super.key,
    required this.categoryImage,
    required this.categoryName,
  });

  final String categoryImage;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10)
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Logo(
              path: categoryImage,
              scale: 50,
            ),
          ),
        ),
        const SizedBox(height: 10,),
        Text(
          categoryName,
          style: const TextStyle(
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
