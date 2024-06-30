import 'package:ecommerce/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PriceOverview extends StatelessWidget {
  final bool isCart;
  const PriceOverview({
    super.key,required this.isCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          color: AppColors.primaryColor.withOpacity(0.15)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  !isCart?'Price':'Total Price',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight:
                    FontWeight.w600,
                    color: Colors.black38,
                  ),
                ),
                const Text(
                  '\$1000',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 140,
              height: 45,
              child: ElevatedButton(
                onPressed: (){},
                child: Text(
                  !isCart?'Add To Cart':'Checkout',
                  style: const TextStyle(
                    color: Colors.white,

                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
