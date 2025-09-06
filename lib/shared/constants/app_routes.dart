import 'package:get/get.dart';
import '../../pages/Login_screen/login.dart';
import '../../pages/add_shipment_screens/add_shipment_screen.dart';
import '../../pages/add_shipment_screens/invoice_screen/invoice_screen.dart';
import '../../pages/add_shipment_screens/recipient_info_screen/map_widget.dart';
import '../../pages/add_shipment_screens/recipient_info_screen/recipient_info_screen.dart';
import '../../pages/add_shipment_screens/shipment_info_screen/shipment_info_screen.dart';
import '../../pages/home_page_screen/home_page.dart';
import '../../pages/notifications_screen/notifications_screen.dart';
import '../../pages/otp_screen/otp_screen.dart';
import '../../pages/sign_up_screen/sign_up.dart';
import '../storage/storage_helper.dart';

abstract class AppRoutes {
  static const String defaultRoute = '/';
  static const String loginScreen = '/loginScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String notificationsScreen = '/notificationsScreen';
  static const String otpScreen = '/otpScreen';
  static const String homeScreen = '/homeScreen';
  static const String addShipmentScreen = '/addShipmentScreen';
  static const String recipientInfoScreen = '/recipientInfoScreen';
  static const String shipmentInfoScreen = '/shipmentInfoScreen';
  static const String invoiceScreen = '/invoiceScreen';
  static const String mapWidget = '/mapWidget';

  static final initialRoute = StorageHelper.getUserToken() == null
      ? loginScreen
      : homeScreen;

  static final routes = [
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: signUpScreen, page: () => const SignUp()),
    GetPage(name: notificationsScreen, page: () => const NotificationsScreen()),
    GetPage(
      name: otpScreen,
      page: () => OtpScreen(email: Get.arguments),
    ),
    GetPage(name: homeScreen, page: () => const HomePage()),
    GetPage(name: addShipmentScreen, page: () => const AddShipmentScreen()),
    GetPage(
      name: recipientInfoScreen,
      page: () => RecipientInfoScreen(recipientLocation: Get.arguments),
    ),
    GetPage(name: shipmentInfoScreen, page: () => const ShipmentInfoScreen()),
    GetPage(
      name: invoiceScreen,
      page: () => InvoiceScreen(id: Get.arguments),
    ),
    GetPage(name: mapWidget, page: () => const MapWidget()),
  ];
}
