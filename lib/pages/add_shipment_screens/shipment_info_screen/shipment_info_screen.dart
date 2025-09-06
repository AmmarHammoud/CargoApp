import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../shared/component/customized_botton.dart';
import '../../../shared/component/show_toast.dart';
import '../../../shared/component/validated_text_field.dart';
import '../../../shared/constants/app_routes.dart';
import '../../../shared/constants/constants.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class ShipmentInfoScreen extends StatelessWidget {
  const ShipmentInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AddShipmentCubit>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.5,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back),
                      ),
                      const Text('Add Shipment'),
                    ],
                  ),
                ),
                const Text('Shipment Info'),
                ValidatedTextField(
                  icon: ConstIcons.shipmentTypeIcon,
                  controller:
                      cubit.shipmentTextControllers.shipmentTypeController,
                  validator: cubit.shipmentTextValidators.shipmentTypeValidator,
                  errorText: 'type cannot be empty',
                  hintText: 'shipment type',
                ),
                ValidatedTextField(
                  icon: ConstIcons.numberOfPiecesIcon,
                  controller:
                      cubit.shipmentTextControllers.numberOfPiecesController,
                  validator:
                      cubit.shipmentTextValidators.numberOfPiecesValidator,
                  errorText: 'number of pieces cannot be empty',
                  hintText: 'number of pieces',
                ),
                ValidatedTextField(
                  icon: ConstIcons.shipmentWeightIcon,
                  controller: cubit.shipmentTextControllers.weightController,
                  validator: cubit.shipmentTextValidators.weightValidator,
                  errorText: 'weight cannot be empty',
                  hintText: 'shipment weight',
                ),
                ValidatedTextField(
                  icon: ConstIcons.shipmentValueIcon,
                  controller:
                      cubit.shipmentTextControllers.productValueController,
                  validator: cubit.shipmentTextValidators.productValueValidator,
                  errorText: 'value cannot be empty',
                  hintText: 'value',
                ),
                // ValidatedTextField(
                //   icon: ConstIcons.senderLatIcon,
                //   controller: cubit.shipmentTextControllers.shipmentTypeController,
                //   validator: cubit.shipmentTextValidators.shipmentTypeValidator,
                //   errorText: 'type cannot be empty',
                //   hintText: 'shipment type',
                // ),
                // ValidatedTextField(
                //   icon: ConstIcons.shipmentTypeIcon,
                //   controller: cubit.shipmentTextControllers.shipmentTypeController,
                //   validator: cubit.shipmentTextValidators.shipmentTypeValidator,
                //   errorText: 'type cannot be empty',
                //   hintText: 'shipment type',
                // ),
                CustomizedButton(
                  title: 'add shipment',
                  condition: cubit.state is! AddShipmentLoadingState,
                  onPressed: () async {
                    await cubit.addShipmentInfo();
                    if (cubit.state is AddShipmentSuccessState) {
                      Get.offNamed(AppRoutes.homeScreen);
                      showToast(
                        context: context,
                        text: 'shipment added successfully',
                        color: Constants.successColor,
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
