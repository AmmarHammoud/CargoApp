import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../models/shipment_model.dart';
import '../constants/constants.dart';
import 'endpoints.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: '${Constants.baseUrl}/api',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> login({
    required String email,
    required String password,
  }) async {
    return await dio.post(
      Endpoints.loginEndpoints,
      data: {'email': email, 'password': password},
      options: Options(
        headers: {'Accept': 'application/json'},
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
  }

  static Future<Response> signUp({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    return await dio.post(
      Endpoints.signUpEndpoints,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
        'password_confirmation': password,
        'role': 'client',
      },
      options: Options(
        headers: {'Accept': 'application/json'},
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static Future<Response> logout() async {
    return await dio.get(
      'logout',
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static Future<Response> getAnnouncements() async {
    return await dio.get(
      Endpoints.announcement,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static Future<Response> getProduct() async {
    return await dio.get(
      Endpoints.getProducts,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static Future<Response> verifyEmail({
    required String email,
    required String otp,
  }) async {
    return await dio.post(
      Endpoints.verifyEmail,
      data: {'email': email, 'verification_code': otp},
      options: Options(
        headers: {'Accept': 'application/json'},
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
  }

  static Future<Response> getShipments({required String token}) async {
    return await dio.get(
      Endpoints.getShipments,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static Future<Response> addRecipientInfo({
    required String token,
    required String recipientPhone,
    required String recipientLat,
    required String recipientLng,
    required String recipientLocation,
  }) async {
    return await dio.post(
      Endpoints.addRecipientInfo,
      data: {
        'recipient_phone': recipientPhone,
        'recipient_lat': recipientLat,
        'recipient_lng': recipientLng,
        'recipient_location': recipientLocation,
      },
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static Future<Response> addShipmentInfo({
    required String token,
    required ShipmentModel shipment,
  }) async {
    return await dio.post(
      Endpoints.addShipmentInfo,
      data: shipment.toJson(),
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static Future<Response> getShipmentInvoice({
    required String token,
    required String id,
  }) async {
    return await dio.get(
      '${Endpoints.shipmentInvoice}/$id',
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static Future<Response> rateShipment({
    required String token,
    required String id,
    required String rating,
    required String comment,
  }) async {
    return await dio.post(
      Endpoints.rating,
      data: {'shipment_id': id, 'rating': rating, 'comment': comment},
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static Future<Response> getShipmentRating({
    required String token,
    required String id,
  }) async {
    return await dio.get(
      '${Endpoints.rating}/$id',
      data: {'shipment_id': id},
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static Future<Response> reportAShipment({
    required String token,
    required String id,
    required String message,
  }) async {
    return await dio.post(
      Endpoints.reportAShipment,
      data: {'shipment_id': id, 'message': message},
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static Future<Response> createPaymentIntent({
    required String token,
    required String shipmentId,
  }) async {
    return await dio.post(
      Endpoints.createPaymentIntent,
      data: {'shipment_id': shipmentId, 'platform': 'mobile'},
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static Future<Response> confirmDelivery({
    required String token,
    required String barcode,
  }) async {
    return await dio.post(
      '${Endpoints.shipments}/$barcode/confirm',
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static Future<Response> markPaymentSuccess({
    required String token,
    required String paymentIntentId,
  }) async {
    return await dio.get(
      Endpoints.markPaymentSuccess,
      queryParameters: {'payment_intent_id': paymentIntentId},
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }
}
