import 'package:ecommerce/presentation/screens/bottom_nav_layout.dart';
import 'package:ecommerce/presentation/screens/home_screen.dart';
import 'package:ecommerce/presentation/screens/otp_verify_screen.dart';
import 'package:ecommerce/presentation/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/asset_paths.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  final TextEditingController _firstNameTEController=TextEditingController();
  final TextEditingController _lastNameTEController=TextEditingController();
  final TextEditingController _mobileTEController=TextEditingController();
  final TextEditingController _cityTEController=TextEditingController();
  final TextEditingController _shippingAddressTEController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final sizes=MediaQuery.sizeOf(context);
    final textTheme=Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(sizes.height*0.05),
          child: ListView(
            children:[
              const Spacer(),
              Logo(path: AssetPaths.appLogo,scale: sizes.height*0.12,),
              SizedBox(height: sizes.height*0.03,),
              Center(child: Text('Complete Profile', style: textTheme.titleLarge,)),
              SizedBox(height: sizes.height*0.01,),
              Center(child: Text('Get started with us with your details', style: textTheme.titleSmall,)),
              SizedBox(height: sizes.height*0.02,),
              _completeProfileForm(sizes),
              ElevatedButton(
                onPressed: (){
                  Get.to(() => BottomNavLayout());
                },
                child: const Text('Next',),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }

  Widget _completeProfileForm(Size sizes) {
    return Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _firstNameTEController,
                ),
                SizedBox(height: sizes.height*0.02,),
                TextFormField(
                  controller: _lastNameTEController,
                ),
                SizedBox(height: sizes.height*0.02,),
                TextFormField(
                  controller: _mobileTEController,
                ),
                SizedBox(height: sizes.height*0.02,),
                TextFormField(
                  controller: _cityTEController,
                ),
                SizedBox(height: sizes.height*0.02,),
                TextFormField(
                  controller: _shippingAddressTEController,
                  maxLines: 3,
                ),
                SizedBox(height: sizes.height*0.02,),
              ],
            ),
          );
  }
  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _cityTEController.dispose();
    _mobileTEController.dispose();
    _shippingAddressTEController.dispose();
    super.dispose();
  }
}
