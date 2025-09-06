import 'package:flutter_stripe/flutter_stripe.dart';

abstract class ConfigValidator {
  static Future<void> validateStripeConfiguration() async {
    print('=== STRIPE CONFIGURATION VALIDATION ===');

    // Check publishable key
    final publishableKey = Stripe.publishableKey;
    print(
      'Publishable Key: ${publishableKey?.isNotEmpty == true ? "✅ Set" : "❌ Missing"}',
    );

    // Check merchant identifier
    final merchantId = Stripe.merchantIdentifier;
    print(
      'Merchant ID: ${merchantId?.isNotEmpty == true ? "✅ Set" : "❌ Missing"}',
    );

    // Check URL scheme
    final urlScheme = Stripe.urlScheme;
    print(
      'URL Scheme: ${urlScheme?.isNotEmpty == true ? "✅ Set" : "❌ Missing"}',
    );

    // Verify Stripe settings
    try {
      await Stripe.instance.applySettings();
      print('Stripe Settings: ✅ Applied successfully');
    } catch (e) {
      print('Stripe Settings: ❌ Failed: $e');
    }

    print('=== VALIDATION COMPLETE ===');
  }
}
