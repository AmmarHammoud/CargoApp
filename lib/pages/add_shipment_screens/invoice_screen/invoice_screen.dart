import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../shared/component/app_bar_icon_component.dart';
import '../../../shared/component/my_loader_indicator.dart';
import '../../../shared/component/rating_widget/rating_widget.dart';
import '../../../shared/component/report_widget/report_widget.dart';
import '../../../shared/constants/constants.dart';
import '../../../shared/constants/shipment_status.dart';
import '../../../shared/stripe_payment/payment_button.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import 'invoice_details_row_component.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AddShipmentCubit>()..getShipmentInvoice(id: id);
    return BlocConsumer<AddShipmentCubit, AddShipmentStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var screenWidth = MediaQuery.of(context).size.width;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Invoice Screen'),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColor,
            leading: AppBarIconComponent(
              icon: Icons.arrow_back,
              onTap: () => Get.back(),
            ),
            elevation: Theme.of(context).appBarTheme.elevation,
            shape: Theme.of(context).appBarTheme.shape,
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ConditionalBuilder(
              condition: state is AddShipmentSuccessState,
              builder: (context) {
                var shipmentInvoice = cubit.shipmentInvoice;
                print(
                  '-------------- qr code url: ${shipmentInvoice.qrCodeUrl}',
                );
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Barcode',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Constants.primaryColor,
                        ),
                      ),
                      SvgPicture.network(
                        width: 150,
                        height: 150,
                        shipmentInvoice.qrCodeUrl!,
                        semanticsLabel: 'A shark?!',
                        placeholderBuilder: (BuildContext context) => Container(
                          padding: const EdgeInsets.all(30.0),
                          child: const MyLoaderIndicator(),
                        ),
                      ),
                      Text(
                        'Invoice Details',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Constants.primaryColor,
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InvoiceDetailsRowComponent(
                                icon: ConstIcons.invoiceNumberIcon,
                                title: 'Invoice Number',
                                value: shipmentInvoice.invoiceNumber!,
                              ),
                              InvoiceDetailsRowComponent(
                                icon: ConstIcons.shipmentTypeIcon,
                                title: 'shipment type',
                                value: shipmentInvoice.type,
                              ),
                              InvoiceDetailsRowComponent(
                                icon: ConstIcons.numberOfPiecesIcon,
                                title: 'number of pieces',
                                value: shipmentInvoice.numberOfPieces!
                                    .toString(),
                              ),
                              InvoiceDetailsRowComponent(
                                icon: ConstIcons.shipmentWeightIcon,
                                title: 'Shipment wight',
                                value: '${shipmentInvoice.weight} KG ',
                              ),
                              InvoiceDetailsRowComponent(
                                icon: ConstIcons.deliveryPriceIcon,
                                title: 'delivery price',
                                value:
                                    '${shipmentInvoice.deliveryPrice} ${Constants.appCurrency}',
                              ),
                              // Divider(),
                              // InvoiceDetailsRowComponent(
                              //   icon: ConstIcons.totalAmountIcon,
                              //   title: 'total amount',
                              //   value:
                              //       '${shipmentInvoice.totalAmount} ${Constants.appCurrency}',
                              // ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        'Recipient Information',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Constants.primaryColor,
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              InvoiceDetailsRowComponent(
                                icon: ConstIcons.nameIcon,
                                title: 'Recipient name',
                                // value: 'xxx',
                                value: shipmentInvoice.recipient!.userName,
                              ),
                              InvoiceDetailsRowComponent(
                                icon: ConstIcons.phoneIcon,
                                title: 'phone number',
                                // value: 'xxx',
                                value: shipmentInvoice.recipient!.phone,
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (cubit.shipmentInvoice.status ==
                          ShipmentStatus.delivered)
                        RatingWidget(id: id),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => ReportWidget(id: id),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            child: const Text(
                              'Report',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          // if (shipmentInvoice.isPaid ?? false)
                          //   SizedBox(
                          //     width: screenWidth * 0.3,
                          //     child: PaymentButton(
                          //       title: 'pay',
                          //       shipmentId: shipmentInvoice.id.toString(),
                          //     ),
                          //   ),
                          // if (shipmentInvoice.isPaid ?? false)
                          //   SizedBox(
                          //     width: screenWidth * 0.3,
                          //
                          //     child: Container(
                          //       decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(15),
                          //         color: Colors.green,
                          //       ),
                          //       child: Center(child: Text('already paid')),
                          //     ),
                          //   ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              fallback: (context) => const Center(child: MyLoaderIndicator()),
            ),
          ),
        );
      },
    );
  }
}
