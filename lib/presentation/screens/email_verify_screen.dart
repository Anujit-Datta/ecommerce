import 'package:ecommerce/presentation/screens/otp_verify_screen.dart';
import 'package:ecommerce/presentation/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/asset_paths.dart';

class EmailVerifyScreen extends StatefulWidget {
  const EmailVerifyScreen({super.key});

  @override
  State<EmailVerifyScreen> createState() => _EmailVerifyScreenState();
}

class _EmailVerifyScreenState extends State<EmailVerifyScreen> {
  final TextEditingController _emailTEController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final sizes=MediaQuery.sizeOf(context);
    final textTheme=Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(sizes.height*0.05),
          child: Column(
            children: [
              const Spacer(),
              Logo(path: AssetPaths.appLogo,scale: sizes.height*0.12,),
              SizedBox(height: sizes.height*0.03,),
              Text('Welcome Back', style: textTheme.titleLarge,),
              SizedBox(height: sizes.height*0.01,),
              Text('Please Enter Your Email Address', style: textTheme.titleSmall,),
              SizedBox(height: sizes.height*0.02,),
              TextFormField(
                controller: _emailTEController,
              ),
              SizedBox(height: sizes.height*0.02,),
              ElevatedButton(
                onPressed: (){
                  Get.to(() => const OTPVerifyScreen());
                },
                child: const Text('Next',),
              ),
              const Spacer(),
              const Spacer(),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}
