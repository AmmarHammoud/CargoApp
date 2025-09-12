import 'package:carge_app/shared/locator/locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:simple_noti/simple_noti.dart';
import 'firebase_options.dart';
import 'pages/add_shipment_screens/cubit/cubit.dart';
import 'shared/constants/app_routes.dart';
import 'shared/constants/constants.dart';
import 'shared/dio_helper/dio_helper.dart';
import 'shared/storage/storage_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: "assets/.env");
  DioHelper.init();
  await StorageHelper.init();
  print(StorageHelper.getUserToken());
  Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY']!;
  Stripe.merchantIdentifier = dotenv.env['STRIPE_MERCHANT_ID'];
  await Stripe.instance.applySettings();
  StorageHelper.myInitialLocation = await Locator.getCurrentLocation();
  // await SimpleNotifications.init(
  //   // onTap: onTap,
  //   appKey: dotenv.env['PUSHER_APP_KEY']!,
  //   cluster: dotenv.env['PUSHER_APP_CLUSTER']!,
  //   appSecret: dotenv.env['PUSHER_APP_SECRET']!,
  //   appId: dotenv.env['PUSHER_APP_ID']!,
  //   enableLogging: true,
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddShipmentCubit(),
      child: GetMaterialApp(
        getPages: AppRoutes.routes,
        initialRoute: AppRoutes.initialRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            foregroundColor: Colors.white,
            elevation: 1.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(
                  20.0,
                ), // Apply 30px radius to bottom corners
              ),
            ),
          ),
          fontFamily: 'tajawal',
          primaryColor: Constants.primaryColor,
          // scaffoldBackgroundColor: Colors.white70,
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(fontSize: 14),
            bodySmall: TextStyle(fontSize: 12),
            labelLarge: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            labelMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
