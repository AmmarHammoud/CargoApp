import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';


import '../constants/constants.dart';
import '../component/customized_botton.dart';
import '../component/show_toast.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class PaymentButton extends StatelessWidget {
  final String title;
  final String shipmentId;

  const PaymentButton({
    super.key,
    required this.title,
    required this.shipmentId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: BlocConsumer<PaymentCubit, PaymentStates>(
        listener: (context, state)  async {
          if (state is PaymentSuccessState) {
            showToast(
              context: context,
              text: state.message,
              color: Constants.successColor,
            );

          } else if (state is PaymentErrorState) {
            showToast(
              context: context,
              text: state.error,
              color: Constants.errorColor,
            );
          }
        },
        builder: (context, state) {
          final paymentCubit = PaymentCubit.get(context);
          return CustomizedButton(
            title: title,
            condition: state is! PaymentLoadingState,
            onPressed: () {
              paymentCubit.makePayment(
                shipmentId: shipmentId
              );
              // paymentCubit.makePaymentDebug(shipmentId: shipmentId);
            },
          );
        },
      ),
    );
  }
}
