import 'package:flutter/cupertino.dart';

class UserTextController {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;



  UserTextController(){
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
  }


  dispose(){
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

}

