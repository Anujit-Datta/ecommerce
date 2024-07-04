import 'package:ecommerce/presentation/controllers/add_to_cart_controller.dart';
import 'package:ecommerce/presentation/controllers/bottom_nav_bar_controller.dart';
import 'package:ecommerce/presentation/controllers/categories_list_controller.dart';
import 'package:ecommerce/presentation/controllers/email_verify_controller.dart';
import 'package:ecommerce/presentation/controllers/new_products_controller.dart';
import 'package:ecommerce/presentation/controllers/otp_verify_controller.dart';
import 'package:ecommerce/presentation/controllers/popular_products_controller.dart';
import 'package:ecommerce/presentation/controllers/product_details_controller.dart';
import 'package:ecommerce/presentation/controllers/product_list_by_category_controller.dart';
import 'package:ecommerce/presentation/controllers/promotional_slider_controller.dart';
import 'package:ecommerce/presentation/controllers/spacial_products_controller.dart';
import 'package:get/get.dart';

class ControllerBinders extends Bindings{
  @override
  void dependencies() {
    Get.put(BottomNavBarController());
    Get.put(PromotionalSliderController());
    Get.put(CategoriesListController());
    Get.put(ProductListByCategoryController());
    Get.put(PopularProductsController());
    Get.put(SpecialProductsController());
    Get.put(NewProductsController());
    Get.put(ProductDetailsController());
    Get.put(EmailVerifyController());
    Get.put(OtpVerifyController());
    Get.put(AddToCartController());
  }

}