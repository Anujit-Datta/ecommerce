import 'dart:async';

import 'package:ecommerce/presentation/screens/complete_profile_screen.dart';
import 'package:ecommerce/presentation/utils/app_colors.dart';
import 'package:ecommerce/presentation/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../utils/asset_paths.dart';

class OTPVerifyScreen extends StatefulWidget {
  const OTPVerifyScreen({super.key});

  @override
  State<OTPVerifyScreen> createState() => _OTPVerifyScreenState();
}

class _OTPVerifyScreenState extends State<OTPVerifyScreen> {
  final TextEditingController _otpTEController=TextEditingController();
  RxInt time=12.obs;
  RxBool resetButtonEnabled=false.obs;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

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
              Text('Enter OTP Code', style: textTheme.titleLarge,),
              SizedBox(height: sizes.height*0.01,),
              Text('A 4 digit OTP code that has been Sent', style: textTheme.titleSmall,),
              SizedBox(height: sizes.height*0.02,),
              _otpTextField(context),
              SizedBox(height: sizes.height*0.02,),
              ElevatedButton(
                onPressed: (){
                  Get.to(() => const CompleteProfileScreen());
                },
                child: const Text('Next',),
              ),
              SizedBox(height: sizes.height*0.04,),
              _resendTimer(textTheme),
              _resendButton(textTheme),
              const Spacer(),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }

  Widget _resendTimer(TextTheme textTheme) {
    return Obx(() =>
      RichText(
        text: TextSpan(
            text: 'This code will expire in ',
            style: textTheme.titleSmall,
            children: [
              TextSpan(
                text: '${time.value}s',
                style: textTheme.labelSmall,
              ),
            ],
        ),
      ),
    );
  }

  Widget _resendButton(TextTheme textTheme) {
    return Obx(() =>
      TextButton(
        onPressed: resetButtonEnabled.value?(){}:null,
        child: Text(
          'Resend Code',
          style: !resetButtonEnabled.value
              ?textTheme.titleSmall
              :const TextStyle(
            color: AppColors.primaryColor,
          ),
        ),

      ),
    );
  }

  PinCodeTextField _otpTextField(BuildContext context) {
    return PinCodeTextField(
      length: 6,
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.transparent,
        activeColor: AppColors.primaryColor,
        inactiveFillColor: Colors.transparent,
        inactiveColor: Colors.grey,
        selectedFillColor: Colors.transparent
      ),
      enableActiveFill: true,
      controller: _otpTEController,
      beforeTextPaste: (text) {
        return true;
      },
      appContext: context,
    );
  }
  @override
  void dispose() {
    _otpTEController.dispose();
    super.dispose();
  }

  startTimer(){
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if(time.value>0){
        time.value--;
        if(time.value==0){
          resetButtonEnabled.value=true;
        }
      }else{
        timer.cancel();
      }
    });
  }
}
