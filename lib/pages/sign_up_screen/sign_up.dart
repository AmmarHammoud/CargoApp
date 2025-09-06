import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../shared/component/customized_botton.dart';
import '../../shared/component/show_toast.dart';
import '../../shared/component/validated_text_field.dart';
import '../../shared/constants/app_routes.dart';
import '../../shared/constants/constants.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpScreenCubit(),
      child: BlocConsumer<SignUpScreenCubit, SignUpScreenStates>(
        listener: (context, state) {
          if (state is SignUpScreenErrorState) {
            showToast(
              context: context,
              text: state.error,
              color: Constants.errorColor,
            );
          } else if (state is SignUpScreenSuccessState) {
            Get.offNamed(AppRoutes.otpScreen,
                arguments: SignUpScreenCubit.get(context)
                    .userTextController
                    .emailController
                    .text);
            showToast(
              context: context,
              text: state.message,
              color: Constants.successColor,
            );
          }
        },
        builder: (context, state) {
          var signUpCubitObject = SignUpScreenCubit.get(context);
          var screenHeight = MediaQuery.of(context).size.height;
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Constants.primaryColor,
                  height: screenHeight * 0.3,
                  width: double.infinity,
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: SizedBox()),
                        Text(
                          'Go ahead and set up\nyour account',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          'Sign in-up enjoy the best experience',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    transform: Matrix4.translationValues(0.0, -25.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight:
                                MediaQuery.of(context).size.height * 0.45,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ValidatedTextField(
                                controller: signUpCubitObject
                                    .userTextController.nameController,
                                validator: signUpCubitObject
                                    .userTextValidators.nameValidator,
                                errorText: 'name field cannot be empty',
                                hintText: 'name',
                                icon: ConstIcons.nameIcon,
                              ),
                              ValidatedTextField(
                                controller: signUpCubitObject
                                    .userTextController.emailController,
                                validator: signUpCubitObject
                                    .userTextValidators.emailValidator,
                                errorText: 'email field cannot be empty',
                                hintText: 'email',
                                icon: HugeIcons.strokeRoundedMailAccount01,
                              ),
                              ValidatedTextField(
                                icon: ConstIcons.phoneIcon,
                                controller: signUpCubitObject
                                    .userTextController.phoneController,
                                validator: signUpCubitObject
                                    .userTextValidators.phoneValidator,
                                errorText: 'phone field cannot be empty',
                                hintText: 'phone',
                              ),
                              ValidatedTextField(
                                icon: ConstIcons.lockIcon,
                                obscureText: true,
                                controller: signUpCubitObject
                                    .userTextController.passwordController,
                                validator: signUpCubitObject
                                    .userTextValidators.passwordValidator,
                                errorText: 'password field cannot be empty',
                                hintText: 'password',
                                hasNextText: false,
                              ),
                              CustomizedButton(
                                  title: 'SignUp',
                                  condition: state is! SignUpScreenLoadingState,
                                  onPressed: () {
                                    signUpCubitObject.signUp(context: context);
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Center(
                //   child: Text(
                //     "- OR Continue With -",
                //     style: TextStyle(
                //         fontWeight: FontWeight.bold,
                //         fontSize: 15,
                //         color: Color(0xff575757)),
                //   ),
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     CircleImageWithBorder(
                //       borderColor: AppColors.primary,
                //       borderWidth: 1,
                //       imagePath: NetworkImage('assets/images/apple 1.png'),
                //       size: 56,
                //     ),
                //     SizedBox(width: 20,),
                //     CircleImageWithBorder(
                //       borderColor: AppColors.primary,
                //       borderWidth: 1,
                //       imagePath: NetworkImage('assets/images/facebook-app-symbol 1.png'),
                //       size: 56,
                //     ),
                //     SizedBox(width: 20,),
                //     CircleImageWithBorder(
                //       borderColor: AppColors.primary,
                //       borderWidth: 1,
                //       imagePath: NetworkImage('assets/images/Frame 4.png') ,
                //       size: 56,
                //     ),
                //     SizedBox(height: 30,),
                //
                //   ],
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "I Already Have an Account ?",
                      style: TextStyle(color: Color(0xff575757)),
                    ),
                    TextButton(
                        onPressed: () {
                          context.go(AppRoutes.loginScreen);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Color(0xffF83758),
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
