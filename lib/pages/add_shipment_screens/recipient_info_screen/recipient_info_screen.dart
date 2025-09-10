import 'package:carge_app/models/sender_and_recipient_locatinos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import '../../../shared/component/customized_botton.dart';
import '../../../shared/component/show_toast.dart';
import '../../../shared/component/validated_text_field.dart';
import '../../../shared/constants/app_routes.dart';
import '../../../shared/constants/constants.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class RecipientInfoScreen extends StatelessWidget {
  const RecipientInfoScreen({
    super.key,
    required this.senderAndRecipientLocations,
  });

  final SenderAndRecipientLocations senderAndRecipientLocations;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AddShipmentCubit>();
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Recipient info'),
        elevation: Theme.of(context).appBarTheme.elevation,
        shape: Theme.of(context).appBarTheme.shape,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: screenHeight * 0.2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(35.0),
                //   ),
                //   child: Row(
                //     children: [
                //       IconButton(
                //         onPressed: () {
                //           Get.offAllNamed(AppRoutes.homeScreen);
                //         },
                //         icon: Icon(Icons.arrow_back),
                //       ),
                //       const Text('Add Shipment'),
                //     ],
                //   ),
                // ),
                // const Text('Recipient Info'),
                // ValidatedTextField(
                //   icon: ConstIcons.nameIcon,
                //   controller: cubit.userTextController.nameController,
                //   validator: cubit.userTextValidators.nameValidator,
                //   errorText: 'name cannot be empty',
                //   hintText: 'name',
                // ),
                ValidatedTextField(
                  icon: ConstIcons.phoneIcon,
                  controller: cubit.userTextController.phoneController,
                  validator: cubit.userTextValidators.phoneValidator,
                  errorText: 'phone cannot be empty',
                  hintText: 'phone',
                ),
                // ValidatedTextField(
                //   icon: ConstIcons.emailIcon,
                //   controller: cubit.userTextController.emailController,
                //   validator: cubit.userTextValidators.emailValidator,
                //   errorText: 'email cannot be empty',
                //   hintText: 'email',
                //   hasNextText: false,
                // ),
                // SizedBox(
                //   // height: screenHeight * 0.1,
                //   // width:  screenWidth * 0.1,
                //   child: MapWidget(),
                // ),
                CustomizedButton(
                  title: 'Next',
                  condition: cubit.state is! AddShipmentLoadingState,
                  onPressed: () async {
                    if (!cubit.userTextValidators.phoneValidator.currentState!
                        .validate()) {
                      return;
                    }
                    await cubit.addRecipientInfo(
                      recipientLocation:
                          senderAndRecipientLocations.recipientLoc!,
                    );
                    if (cubit.state is AddShipmentSuccessState) {
                      Get.toNamed(
                        AppRoutes.shipmentInfoScreen,
                        arguments: senderAndRecipientLocations,
                      );
                      final successState =
                          cubit.state as AddShipmentSuccessState;
                      showToast(
                        context: context,
                        text: successState.message,
                        color: Constants.errorColor,
                      );
                    }
                    if (cubit.state is AddShipmentErrorState) {
                      final errorState = cubit.state as AddShipmentErrorState;
                      showToast(
                        context: context,
                        text: errorState.error,
                        color: Constants.errorColor,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
