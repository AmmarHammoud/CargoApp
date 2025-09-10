import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../../dio_helper/dio_helper.dart';
import '../../storage/storage_helper.dart';
import 'states.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(PaymentInitialState());

  static PaymentCubit get(context) => BlocProvider.of(context);

  Future<void> makePayment({required String shipmentId}) async {
    emit(PaymentLoadingState());
    try {
      final paymentIntentData = await _createPaymentIntent(
        shipmentId: shipmentId,
      );
      print('payment intent data: ');
      for (var k in paymentIntentData!.keys) {
        print('$k: ${paymentIntentData[k]}');
      }
      // print('payment intent data: $paymentIntentData');
      print(
        'payment intent client secret: ${paymentIntentData!['client_secret']}',
      );

      var paymentSheetOption = await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentData!['client_secret'],
          customerId: null,
          allowsDelayedPaymentMethods: true,
          // customFlow: true,
          merchantDisplayName: 'Shipment payment',
        ),
      );

      print('payment sheet option: $paymentSheetOption');

      await Stripe.instance.presentPaymentSheet();

      var markPaymentResponse = await DioHelper.markPaymentSuccess(
        token: StorageHelper.getUserToken()!,
        paymentIntentId: paymentIntentData['payment_intent_id'],
      );

      if (markPaymentResponse.statusCode == 200) {
        emit(PaymentSuccessState('Paid successfully'));
      } else {
        emit(PaymentErrorState(markPaymentResponse.data['message']));
      }
    } on Exception catch (e, h) {
      print(e.toString());
      print(h.toString());
      if (e is StripeException) {
        emit(
          PaymentErrorState('Error from Stripe: ${e.error.localizedMessage}'),
        );
      } else {
        print(e.toString());
        emit(PaymentErrorState('An unexpected error occurred: $e'));
      }
    }
  }

  Future<Map<String, dynamic>?> _createPaymentIntent({
    required String shipmentId,
  }) async {
    try {
      final response = await DioHelper.createPaymentIntent(
        token: StorageHelper.getUserToken()!,
        shipmentId: shipmentId,
      );
      // print(response.statusCode);
      print(response.data);
      if (response.statusCode == 200) {
        return response.data;
      }
      return null;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
