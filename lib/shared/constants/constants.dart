import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hugeicons/hugeicons.dart';

abstract class Constants {
  static Color primaryColor = Colors.pink[900]!;
  static Color successColor = Colors.green;
  static Color errorColor = Colors.red;
  // static String baseUrl = 'http://10.225.247.17:8000';
  static String baseUrl = dotenv.env['BASE_URL']!;
  static String appCurrency = 'SP';
}

abstract class ConstIcons {
  static IconData nameIcon = HugeIcons.strokeRoundedUserAccount;
  static IconData emailIcon = HugeIcons.strokeRoundedMailAccount01;
  static IconData phoneIcon = HugeIcons.strokeRoundedCall02;
  static IconData lockIcon = HugeIcons.strokeRoundedCall02;
  static IconData locationIcon = HugeIcons.strokeRoundedLocation02;
  static IconData invoiceNumberIcon = HugeIcons.strokeRoundedInvoice04;
  static IconData shipmentTypeIcon = HugeIcons.strokeRoundedGroupLayers;
  static IconData numberOfPiecesIcon = HugeIcons.strokeRoundedLeftToRightListNumber;
  static IconData shipmentWeightIcon = HugeIcons.strokeRoundedWeightScale;
  static IconData shipmentValueIcon = Icons.euro_symbol_rounded;
  static IconData senderLatIcon = HugeIcons.strokeRoundedLatitude;
  static IconData senderLngIcon = HugeIcons.strokeRoundedLongitude;
  static IconData deliveryPriceIcon = FontAwesomeIcons.moneyBill1;
  static IconData totalAmountIcon = HugeIcons.strokeRoundedCoinsPound;
  // static IconData totalAmountIcon = FontAwesomeIcons.handHoldingDollar;
}
