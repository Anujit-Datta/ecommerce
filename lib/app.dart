import 'package:ecommerce/presentation/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class ECommerce extends StatelessWidget {
  const ECommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'E-Commerce',
      home: SplashScreen(),
    );
  }
}
