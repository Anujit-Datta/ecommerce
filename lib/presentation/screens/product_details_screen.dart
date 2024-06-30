import 'package:ecommerce/presentation/screens/reviews_screen.dart';
import 'package:ecommerce/presentation/utils/app_colors.dart';
import 'package:ecommerce/presentation/widgets/bottom_price_overview_area.dart';
import 'package:ecommerce/presentation/widgets/product_card.dart';
import 'package:ecommerce/presentation/widgets/quantity_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<String> measurement=['S','M','L','XL'];
  int selectedMeasurement=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProductImagesSlideShow(),
          Padding(
            padding: const EdgeInsets.all(12),
            child: SizedBox(
              height: 400,
              child: ListView(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Text(
                          'Happy New Year Spacial Deal Save 30%',
                          maxLines: 2,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      const Expanded(
                        flex: 2,
                        child: QuantityStepper(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const ProductRating(rating: '4.8'),
                      TextButton(
                        onPressed: (){
                          Get.to(()=>const ReviewsScreen());
                        },
                        child: const Text(
                          'Reviews',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 14
                          ),
                        ),
                      ),
                      const ProductWishlisted(isWishListed: false),
                    ],
                  ),
                  const SectionHeader(title: 'Color'),
                  SizedBox(
                    height: 30,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: CircleAvatar(
                            radius: 13,
                            backgroundColor: AppColors.primaryColor,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const SectionHeader(title: 'Size'),
                  SizedBox(
                    height: 28,
                    child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: (){
                              selectedMeasurement=index;
                              setState(() {});
                            },
                            child: Container(
                              width: 28,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(width: 1,color: Colors.grey),
                                color: index==selectedMeasurement?AppColors.primaryColor:null,
                              ),
                              child: Center(
                                child: Text(
                                  measurement[index],
                                  style: TextStyle(
                                    color: index==selectedMeasurement?Colors.white:Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const SectionHeader(title: 'Description'),
                  const Text(
                    'iadgv dfiughdf vudiafghfrd vdufvghfrv fuvhofv fvifhvofd vfudsvhgoiafdsv fvoihafiov fvoifdhvoidfv dfvoihfdoivfd vdfovhdfoivdaf vdfoivhdofivbdf vdfiohdfvhfd dfhbfkbv fdhvodfv dfvhiodfhvd fvdfhv',
                    style: TextStyle(
                      color: Colors.black38
                    ),
                  ),
                ],
              ),
            ),
          ),
          const PriceOverview(isCart: false),
        ],
      )
    );
  }
}


class ProductImagesSlideShow extends StatelessWidget {
  const ProductImagesSlideShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel(
      options: CarouselOptions(
        viewportFraction: 1,
        enlargeCenterPage: true,
        showIndicator: true,
        slideIndicator: CircularSlideIndicator(
          currentIndicatorColor: AppColors.primaryColor,
          indicatorBorderColor: Colors.grey.withOpacity(0.3),
        ),
        floatingIndicator: true,
        aspectRatio: 1.5,
      ),
      items: [1,2,3].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Text(
                      'Item $i',
                      style: const TextStyle(
                        fontSize: 30.0,
                      ),
                    )));
          },
        );
      }).toList(),
    );
  }
}


class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight:
        FontWeight.w600,
        color: Colors.black38,
      ),
    );
  }
}

