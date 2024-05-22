import 'package:ecommerce/presentation/utils/app_colors.dart';
import 'package:ecommerce/presentation/utils/asset_paths.dart';
import 'package:ecommerce/presentation/widgets/category_view.dart';
import 'package:ecommerce/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import '../widgets/logo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchTEController=TextEditingController();
  List carouselItems=[1,2,3,4,5];
  String title='Section Title';
  String productName='Product Name';
  String rating='4.8';
  double price=100;
  bool isFavourite=false;
  String imageLink='assets/images/shoe.png';
  List categoryNames=['Electronics','Food','Fashion','Furniture'];
  List categoryImages=[
    AssetPaths.electronicsCategoryLogo,
    AssetPaths.foodCategoryLogo,
    AssetPaths.fashionCategoryLogo,
    AssetPaths.furnitureCategoryLogo
  ];

  @override
  Widget build(BuildContext context) {
    Size sizes = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(sizes),
      body: Padding(
        padding: const EdgeInsets.only(left: 16,right: 16,top: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchBar(searchTEController: _searchTEController,),
              const SizedBox(height: 16,),
              PromotionalCarousel(carouselItems: carouselItems),
              const SizedBox(height: 8,),
              const SectionHeader(title: 'All Categories'),
              CategoriesHorizontalScroll(categoryImages: categoryImages, categoryNames: categoryNames,sizes: sizes,),
              const SizedBox(height: 8,),
              const SectionHeader(title: 'Popular'),
              SizedBox(
                height: sizes.height*0.215,
                child: ListView.separated(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return ProductCard(sizes: sizes, imageLink: imageLink, productName: productName, price: price, rating: rating,isWishListed: false,);
                  },
                  separatorBuilder: (context,_){
                    return const SizedBox(width: 5,);
                  },
                ),
              ),
              const SizedBox(height: 8,),
              const SectionHeader(title: 'Spacial'),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return ProductCard(sizes: sizes, imageLink: imageLink, productName: productName, price: price, rating: rating,isWishListed: false,);
                  },
                  separatorBuilder: (context,_){
                    return const SizedBox(width: 5,);
                  },
                ),
              ),
              const SizedBox(height: 8,),
              const SectionHeader(title: 'New'),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return ProductCard(sizes: sizes, imageLink: imageLink, productName: productName, price: price, rating: rating,isWishListed: false,);
                  },
                  separatorBuilder: (context,_){
                    return const SizedBox(width: 5,);
                  },
                ),
              ),
          
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(Size sizes) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Logo(
        path: AssetPaths.navBarLogo,
        scale: sizes.height * 0.045,
      ),
      actions: [
        TopBarIconButtons(
          sizes: sizes,
          selection: 'person',
        ),
        const SizedBox(
          width: 10,
        ),
        TopBarIconButtons(
          sizes: sizes,
          selection: 'dialer',
        ),
        SizedBox(
          width: sizes.height * 0.015,
        ),
        TopBarIconButtons(
          sizes: sizes,
          selection: 'bell',
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}


class CategoriesHorizontalScroll extends StatelessWidget {
  const CategoriesHorizontalScroll({
    super.key,
    required this.categoryImages,
    required this.categoryNames,
    required this.sizes,
  });

  final List categoryImages;
  final List categoryNames;
  final Size sizes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sizes.height*0.113,
      width: double.maxFinite,
      child: ListView.separated(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return CategoryView(categoryImage: categoryImages[index], categoryName: categoryNames[index]);
        },
        separatorBuilder: (context,index){
          return const SizedBox(width: 28,);
        },
      ),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        TextButton(
          onPressed: (){

          },
          child: const Text('See All',),
        ),
      ],
    );
  }
}

class PromotionalCarousel extends StatelessWidget {
  const PromotionalCarousel({
    super.key,
    required this.carouselItems,
  });

  final List carouselItems;

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
        aspectRatio: 1.8,
      ),
      items: carouselItems.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: double.maxFinite,
                margin: const EdgeInsets.only(bottom: 32,),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text('Item $i', style: const TextStyle(fontSize: 30.0,),))
            );
          },
        );
      }).toList(),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required TextEditingController searchTEController,
  }) : _searchTEController = searchTEController;

  final TextEditingController _searchTEController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _searchTEController,
      decoration: InputDecoration(
        fillColor: Colors.grey.withOpacity(0.15),
        filled: true,
        border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(8)),
        enabledBorder:
        OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(8)),
        disabledBorder:
        OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(8)),
        focusedBorder:
        OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(8)),
        prefixIcon: const Icon(
          Icons.search,
          size: 30,
          color: Colors.black45,
        ),
        hintText: 'Search',
        hintStyle: TextStyle(
            color: Colors.grey.withOpacity(0.5)
        ),
      ),
    );
  }
}

class TopBarIconButtons extends StatelessWidget {
  const TopBarIconButtons({
    super.key,
    required this.sizes,
    required this.selection,
  });

  final Size sizes;
  final String selection;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      splashColor: AppColors.primaryColor.withOpacity(0.2),
      child: CircleAvatar(
        radius: sizes.height * 0.023,
        backgroundColor: Colors.grey.withOpacity(0.15),
        child: Logo(
          scale:
              selection == 'bell' ? sizes.height * 0.045 : sizes.height * 0.023,
          path: selection == 'person'
              ? AssetPaths.navBarPersonLogo
              : selection == 'dialer'
                  ? AssetPaths.navBarDialerLogo
                  : AssetPaths.navBarBellLogo,
        ),
      ),
    );
  }
}
