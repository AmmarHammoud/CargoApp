// Add this to your DioHelper class or create a new debug version
import 'package:dio/dio.dart';

class DioHelperDebug {
  static final Dio _dio = Dio()
    ..interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));

  static Future<Response> createPaymentIntent({
    required String token,
    required String shipmentId,
  }) async {
    try {
      print('🔄 Making request to create payment intent...');
      print('📦 Shipment ID: $shipmentId');
      print('🔑 Token: ${token.substring(0, 10)}...'); // Log first 10 chars only

      final response = await _dio.post(
        'https://your-api-endpoint/create-payment-intent', // Replace with your actual endpoint
        data: {
          'shipment_id': shipmentId,
          'amount': 1000, // Add explicit amount for testing
          'currency': 'usd',
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ),
      );

      print('✅ Response received: ${response.statusCode}');
      return response;

    } on DioException catch (e) {
      print('❌ Dio Error:');
      print('   Message: ${e.message}');
      print('   Type: ${e.type}');
      print('   Response: ${e.response?.data}');
      print('   Status: ${e.response?.statusCode}');
      print('   Headers: ${e.response?.headers}');
      rethrow;
    } catch (e) {
      print('❌ Unexpected error in DioHelper: $e');
      rethrow;
    }
  }
}