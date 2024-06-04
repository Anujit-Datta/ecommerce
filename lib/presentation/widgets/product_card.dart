import 'package:ecommerce/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.sizes,
    required this.imageLink,
    required this.productName,
    required this.price,
    required this.rating,
    required this.isWishListed,
  });

  final Size sizes;
  final String imageLink;
  final String productName;
  final double price;
  final String rating;
  final bool isWishListed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sizes.width*0.3,
      child: Card(
        elevation: 3,
        surfaceTintColor: Colors.transparent,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none
        ),
        child: SizedBox(
          height: sizes.height*0.15,
          width: sizes.width*0.27,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImage(sizes: sizes, imageLink: imageLink),
              ProductTitle(productName: productName),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sizes.width*0.01),
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductPrice(price: price),
                      Row(
                        children: [
                          ProductRating(rating: rating),
                          SizedBox(width: sizes.width*0.01,),
                          ProductWishlisted(isWishListed: isWishListed),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductWishlisted extends StatelessWidget {
  const ProductWishlisted({
    super.key,
    required this.isWishListed,
  });

  final bool isWishListed;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(3)
        ),
        child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Icon(
              isWishListed?Icons.favorite:Icons.favorite_outline,
              size: 11,
              color: isWishListed?Colors.redAccent:Colors.white,
            )
        )
    );
  }
}



class ProductRating extends StatelessWidget {
  const ProductRating({
    super.key,
    required this.rating,
  });

  final String rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.yellowAccent,
          size: 13,
        ),
        Text(
          rating,
          style: const TextStyle(
              color: Colors.black54,
              fontSize: 11
          ),
        ),
      ],
    );
  }
}



class ProductPrice extends StatelessWidget {
  const ProductPrice({
    super.key,
    required this.price,
  });

  final double price;

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${price.toStringAsFixed(0)}',
      style: const TextStyle(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w700,
          fontSize: 15
      ),
    );
  }
}



class ProductTitle extends StatelessWidget {
  const ProductTitle({
    super.key,
    required this.productName,
  });

  final String productName;

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
      child: Text(
        'product title dkfgiu dfvoidf fuoihdvb',
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black54
        ),
      ),
    );
  }
}


class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.sizes,
    required this.imageLink,
  });

  final Size sizes;
  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Image.asset(
          'assets/images/shoe.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
