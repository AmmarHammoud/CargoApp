import 'package:carge_app/pages/home_page_screen/cubit/home_page_cubit.dart';
import 'package:carge_app/pages/home_page_screen/cubit/sates.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'qr_scanner.dart';
//
// void qrScannerBottomSheet({required BuildContext context}) {
//   bool isDismissed = false;
//
//   showModalBottomSheet<void>(
//     context: context,
//     isDismissible: true,
//     builder: (BuildContext context) {
//       return BlocConsumer<CurrentShipmentWidgetCubit,
//           CurrentShipmentWidgetStates>(
//         listener: (context, state) {
//           if (state is CurrentShipmentWidgetScannedQrSuccessState) {
//             Navigator.pop(context);
//           }
//         },
//         builder: (context, state) {
//           return ConditionalBuilder(
//             condition: state is CurrentShipmentWidgetScanningQrState,
//             builder: (context) => const Center(
//               child: CircularProgressIndicator(),
//             ),
//             fallback: (context) => Container(
//               height: 500,
//               color: Colors.white,
//               child: Center(
//                 child: Container(
//                   decoration:
//                       BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
//                   child: Padding(
//                     padding: const EdgeInsets.all(50.0),
//                     child: QrScanner(
//                       onDetect: (result) {
//                         if (!isDismissed) {
//                           print('xxxx|xxxx|xxxx|xxxx');
//                           print(result.barcodes.first.rawValue);
//                           context
//                               .read<CurrentShipmentWidgetCubit>()
//                               .confirmPickup(
//                                 barcode: result.barcodes.first.rawValue!,
//                               );
//                           //Navigator.pop(context);
//                           isDismissed = true;
//                         }
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       );
//     },
//   );
// }

void qrScannerBottomSheet({required BuildContext context}) {
  bool isDismissed = false;

  showModalBottomSheet<void>(
    context: context,
    isDismissible: true,
    builder: (BuildContext bottomSheetContext) { // Use a different name for clarity
      return BlocProvider.value(
        value: BlocProvider.of<HomePageCubit>(context),
        child: BlocConsumer<HomePageCubit, HomePageStates>(
          listener: (consumerContext, state) {
            if (state is HomePageScannedQrSuccessState) {
              Navigator.pop(consumerContext);
            }
          },
          builder: (consumerContext, state) {
            return ConditionalBuilder(
              condition: state is HomePageScanningQrState,
              builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
              fallback: (context) => Container(
                height: 500,
                color: Colors.white,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: QrScanner(
                        onDetect: (result) {
                          if (!isDismissed) {
                            String? scannedBarcode = result.barcodes.first.rawValue;
                            print('xxxx|xxxx|xxxx|xxxx');
                            print(result.barcodes.first.rawValue);
                            if (scannedBarcode != null) {
                              consumerContext.read<HomePageCubit>().confirmDelivery(
                                barcode: scannedBarcode,
                              );
                            }
                            isDismissed = true;
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    },
  );
}