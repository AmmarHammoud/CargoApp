import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../shared/component/show_toast.dart';
import '../../shared/constants/app_routes.dart';
import '../../shared/constants/constants.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtpScreenCubit(),
      child: BlocConsumer<OtpScreenCubit, OtpScreenStates>(
        listener: (context, state) {
          if (state is OtpScreenErrorState) {
            showToast(
              context: context,
              text: state.error,
              color: Constants.errorColor,
            );
          } else if (state is OtpScreenSuccessState) {
            Get.offAllNamed(AppRoutes.loginScreen);
            showToast(
              context: context,
              text: state.message,
              color: Constants.successColor,
            );
          }
        },
        builder: (context, state) {
          var otpCubit = OtpScreenCubit.get(context);
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: PinCodeTextField(
                  appContext: context,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  //backgroundColor: Colors.blue.shade50,
                  enableActiveFill: true,
                  //errorAnimationController: errorController,
                  controller: otpCubit.otpController,
                  onCompleted: (v) async {
                    print("Completed");
                    otpCubit.verifyEmail(email: email);
                  },
                  onChanged: (value) {
                    print(value);
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
