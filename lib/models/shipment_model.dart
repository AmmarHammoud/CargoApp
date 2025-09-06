import '../shared/constants/constants.dart';
import '../shared/constants/shipment_status.dart';
import 'user_model.dart';

class ShipmentModel {
  late final int id;
  late final int? clientId;
  late final int? centerFromId;
  late final int? centerToId;
  late final int? pickupDriverId;
  late final int? deliveryDriverId;
  late final String? senderLat;
  late final String? senderLng;
  late final int? recipientId;
  late final ShipmentStatus status;
  late final String? recipientLat;
  late final String? recipientLng;
  late final String type;
  late final int? numberOfPieces;
  late final String? weight;
  late final String? deliveryPrice;
  late final String productValue;
  late final String totalAmount;
  late final String? invoiceNumber;
  late final String barcode;
  late final String? qrCodeUrl;
  late final UserModel? recipient;

  ShipmentModel({
    required this.type,
    required this.numberOfPieces,
    required this.weight,
    required this.productValue,
    required this.senderLat,
    required this.senderLng,
  });

  ShipmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientId = json['client_id'];
    centerFromId = json['center_from_id'];
    centerToId = json['center_to_id'];
    pickupDriverId = json['pickup_driver_id'];
    deliveryDriverId = json['delivery_driver_id'];
    senderLat = json['sender_lat'];
    senderLng = json['sender_lng'];
    recipientId = json['recipient_id'];
    recipientLat = json['recipient_lat'];
    recipientLng = json['recipient_lng'];
    type = json['shipment_type'];
    numberOfPieces = json['number_of_pieces'];
    weight = json['weight'];
    deliveryPrice = json['delivery_price'];
    productValue = json['product_value'];
    totalAmount = json['total_amount'];
    invoiceNumber = json['invoice_number'];
    barcode = json['barcode'];
    qrCodeUrl = '${Constants.baseUrl}${json['qr_code_url']}';
    if (json['recipient'] != null) {
      print(json['recipient']);
      recipient = UserModel.fromJson(json['recipient']);
    }
    status = ShipmentStatus.fromBackendStatus(json['status']);
  }

  Map<String, dynamic> toJson() =>
      {
        // 'id': id,
        // 'clientId': clientId,
        // 'centerFromId': centerFromId,
        // 'centerToId': centerToId,
        // 'pickupDriverId': pickupDriverId,
        // 'deliveryDriverId': deliveryDriverId,
        'sender_lat': senderLat,
        'sender_lng': senderLng,
        // 'recipientId': recipientId,
        // 'recipientLat': recipientLat,
        // 'recipientLng': recipientLng,
        'shipment_type': type,
        'number_of_pieces': numberOfPieces,
        'weight': weight,
        //'deliveryPrice': deliveryPrice,
        'product_value': productValue,
        // 'totalAmount': totalAmount,
        // 'invoiceNumber': invoiceNumber,
        // 'barcode': barcode,
        // 'qrCodeUrl': qrCodeUrl,
        // 'status': status.toJson(),
      };

  @override
  String toString() {
    return '''id: $id
    clientId: $clientId
    centerFromId: $centerFromId
    centerToId: $centerToId
    pickupDriverId: $pickupDriverId
    deliveryDriverId: $deliveryDriverId
    senderLat: $senderLat
    senderLng: $senderLng
    recipientId: $recipientId
    status: $status
    recipientLat: $recipientLat
    recipientLng: $recipientLng
    type: $type
    numberOfPieces: $numberOfPieces
    weight: $weight
    deliveryPrice: $deliveryPrice
    productValue: $productValue
    totalAmount: $totalAmount
    invoiceNumber: $invoiceNumber
    barcode: $barcode''';
  }
}
