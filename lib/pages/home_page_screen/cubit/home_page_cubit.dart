import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_noti/simple_noti.dart';

import '../../../models/shipment_model.dart';
import '../../../shared/dio_helper/dio_helper.dart';
import '../../../shared/storage/storage_helper.dart';
import 'sates.dart';

class HomePageCubit extends Cubit<HomePageStates> {
  HomePageCubit() : super(HomePageInitialState());

  static HomePageCubit get(context) => BlocProvider.of(context);

  List<String> announcementImages = [];
  List<ShipmentModel> shipments = [];

  // subscribeToNotification() async {
  //   await SimpleNotifications.subscribe(
  //     channelName: 'client',
  //     roomId: StorageHelper.getUser().id,
  //     onEvent: (e){
  //       print(e.toString());
  //     }
  //   );
  // }

  getAnnouncements() async {
    emit(HomePageLoadingState());

    var response = await DioHelper.getAnnouncements();

    for (var image in response.data) announcementImages.add(image);
  }

  getShipments() async {
    emit(HomePageLoadingState());

    try {
      var response = await DioHelper.getShipments(
        token: StorageHelper.getUserToken()!,
      );
      // print(response.statusCode);
      // print(response.data);
      if (response.statusCode == 200) {
        for (var shipment in response.data['shipments']) {
          shipments.add(ShipmentModel.fromJson(shipment));
        }
        emit(HomePageSuccessState());
      } else {
        emit(HomePageErrorState('xxxxxxxx'));
      }
    } catch (e, h) {
      print(e.toString());
      print(h.toString());
      emit(HomePageErrorState(e.toString()));
    }
  }

  confirmDelivery({required String barcode}) async {
    emit(HomePageScanningQrState());
    try {
      var response = await DioHelper.confirmDelivery(
        token: StorageHelper.getUserToken()!,
        barcode: barcode,
      );
      print(response.data);
      if (response.statusCode == 200) {
        emit(HomePageScannedQrSuccessState(response.data['message']));
      } else {
        emit(HomePageScannedQrErrorState(response.data['message']));
      }
    } catch (e, h) {
      print(e.toString());
      print(h.toString());
      emit(HomePageScannedQrErrorState(e.toString()));
    }
  }

  logout() async {
    emit(HomePageLoggingOutLoadingState());
    try {
      var response = await DioHelper.logout();
      if (response.statusCode == 200) {
        emit(HomePageLoggingOutSuccessfulState());
      } else {
        emit(
          HomePageLoggingOutErrorState(
            response.data['message'] ?? 'error logging out',
          ),
        );
      }
    } catch (e, h) {
      print(e.toString());
      print(h.toString());
      emit(HomePageLoggingOutErrorState(e.toString()));
    }
  }
}
