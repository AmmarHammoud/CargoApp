import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

abstract class StripePayment {
  static void init() {
    Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY']!;
    Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
    Stripe.urlScheme = 'flutterstripe';
    Stripe.instance.applySettings();
  }

  static Future<void> makePayment() async {
    // try {
    //   //STEP 1: Create Payment Intent
    //   paymentIntent = await createPaymentIntent('100', 'USD');
    //
    //   //STEP 2: Initialize Payment Sheet
    //   await Stripe.instance
    //       .initPaymentSheet(
    //
    //       paymentSheetParameters: SetupPaymentSheetParameters(
    //           paymentIntentClientSecret: paymentIntent![
    //           'client_secret'], //Gotten from payment intent
    //           style: ThemeMode.light,
    //           merchantDisplayName: 'Ikay'))
    //       .then((value) {});
    //
    //   //STEP 3: Display Payment sheet
    //   displayPaymentSheet();
    // } catch (err) {
    //   throw Exception(err);
    // }
  }
}
