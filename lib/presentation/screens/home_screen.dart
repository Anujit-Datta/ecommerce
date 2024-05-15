import 'package:ecommerce/presentation/utils/app_colors.dart';
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
    Size sizes = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
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
        backgroundColor: Colors.grey.withOpacity(0.25),
        child: Logo(
          scale: selection=='bell'?sizes.height*0.045:sizes.height * 0.023,
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
