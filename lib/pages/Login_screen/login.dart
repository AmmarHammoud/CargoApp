import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginScreenCubit(),
      child: BlocConsumer<LoginScreenCubit, LoginScreenStates>(
        listener: (context, state) {
          if (state is LoginScreenErrorState) {
            showToast(
              context: context,
              text: state.error,
              color: Constants.errorColor,
            );
          } else if (state is LoginScreenSuccessState) {
            Get.offAllNamed(AppRoutes.homeScreen);
            showToast(
              context: context,
              text: state.message,
              color: Constants.successColor,
            );
          }
        },
        builder: (context, state) {
          var loginCubitObject = LoginScreenCubit.get(context);
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
                        borderRadius: BorderRadius.circular(30)),
                    transform: Matrix4.translationValues(0.0, -25.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight:
                            MediaQuery.of(context).size.height * 0.4,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ValidatedTextField(
                                icon: ConstIcons.emailIcon,
                                controller: loginCubitObject
                                    .userTextController.emailController,
                                validator: loginCubitObject
                                    .userTextValidators.emailValidator,
                                errorText: 'email field cannot be empty',
                                hintText: 'email',
                              ),
                              ValidatedTextField(
                                icon: ConstIcons.lockIcon,
                                obscureText: true,
                                controller: loginCubitObject
                                    .userTextController.passwordController,
                                validator: loginCubitObject
                                    .userTextValidators.passwordValidator,
                                errorText: 'password field cannot be empty',
                                hintText: 'password',
                                hasNextText: false,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Checkbox(value: false, onChanged: (d) {}),
                                      const Text('remember me'),
                                    ],
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text('Forget Password?'))
                                ],
                              ),
                              CustomizedButton(
                                  title: 'Login',
                                  condition: state is! LoginScreenLoadingState,
                                  onPressed: () {
                                    loginCubitObject.login(
                                      context: context,
                                    );
                                  }),
                              Row(
                                children: const [
                                  Expanded(child: Divider()),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: Text('Or login with'),
                                  ),
                                  Expanded(child: Divider()),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
