import 'package:carge_app/shared/component/qr_scanner/qr_scanner_borrom_sheet.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../shared/component/my_loader_indicator.dart';
import '../../shared/constants/app_routes.dart';
import 'cubit/home_page_cubit.dart';
import 'cubit/sates.dart';
import 'home_page_components/current_shipments/current_shipments_list.dart';
import 'home_page_components/home_page_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageCubit()..getShipments(),
      child: Builder(
        builder: (context) {
          return RefreshIndicator(
            onRefresh: () async {
              var homeCubit = context.read<HomePageCubit>();
              homeCubit.getShipments();
            },
            child: BlocConsumer<HomePageCubit, HomePageStates>(
              listener: (context, state) {
                if(state is HomePageLoggingOutSuccessfulState){
                  Get.offAllNamed(AppRoutes.loginScreen);
                }
              },
              builder: (context, state) {
                var homeCubit = HomePageCubit.get(context);

                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Theme.of(context).primaryColor,
                    leading: const Icon(Icons.location_on_outlined, size: 29),
                    leadingWidth: 60.0,
                    actions: [
                      ConditionalBuilder(
                        condition: state is HomePageLoggingOutLoadingState,
                        builder: (context) => MyLoaderIndicator(),
                        fallback: (context) => Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: IconButton(
                            icon: Icon(FontAwesomeIcons.bell),
                            onPressed: () {
                              homeCubit.logout();
                            },
                          ),
                        ),
                      ),
                    ],
                    elevation: Theme.of(context).appBarTheme.elevation,
                    shape: Theme.of(context).appBarTheme.shape,
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Card(
                          color: Colors.pink[100],
                          elevation: 1.5,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                HomePageButton(
                                  color: Colors.green,
                                  icon: FontAwesomeIcons.arrowRightArrowLeft,
                                  title: 'اضافة شحنة',
                                  onTap: () {
                                    Get.toNamed(AppRoutes.addShipmentScreen);
                                  },
                                ),
                                const SizedBox(width: 5),
                                HomePageButton(
                                  color: Colors.blue,
                                  icon: FontAwesomeIcons.print,
                                  title: 'استلام شحنة',
                                  onTap: () {
                                    qrScannerBottomSheet(context: context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Container(
                              //elevation: 1.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                // border: Border.all(color: Colors.red),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    offset: const Offset(1, 3),
                                    blurRadius: 7,
                                  ),
                                ],
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Icon(Icons.qr_code_scanner),
                              ),
                            ),
                            // SearchBox(),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Expanded(
                          child: ConditionalBuilder(
                            condition: state is HomePageLoadingState,
                            builder: (context) => const MyLoaderIndicator(),
                            fallback: (context) => CurrentShipmentsList(
                              shipments: homeCubit.shipments,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
