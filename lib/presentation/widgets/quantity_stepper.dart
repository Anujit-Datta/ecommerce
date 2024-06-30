import 'package:ecommerce/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';

class QuantityStepper extends StatelessWidget {
  const QuantityStepper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(9),
          child: InkWell(
            onTap: (){},
            child: Container(
              height: 21,
              width: 21,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.primaryColor,
              ),
              margin: const EdgeInsets.all(1),
              child: const Center(
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 17,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
          child: Text(
            '1',
            style: TextStyle(
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(9),
          child: InkWell(
            onTap: (){},
            child: Container(
              height: 21,
              width: 21,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.primaryColor,
              ),
              margin: const EdgeInsets.all(1),
              child: const Center(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 17,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}