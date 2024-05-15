import 'package:ecommerce/presentation/utils/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/logo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size sizes=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Logo(
          path: AssetPaths.navBarLogo,
          scale: sizes.height*0.04,
        ),
        actions: [
          Logo(scale: 20, path: AssetPaths.appLogo)
        ],
      ),
    );
  }
}
