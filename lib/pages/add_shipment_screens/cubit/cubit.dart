import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import '../../../models/shipment_model.dart';
import '../../../shared/constants/shipment_text_controllers.dart';
import '../../../shared/constants/shipment_text_validators.dart';
import '../../../shared/constants/user_text_controllers.dart';
import '../../../shared/constants/user_text_validators.dart';
import '../../../shared/dio_helper/dio_helper.dart';
import '../../../shared/storage/storage_helper.dart';
import 'states.dart';

class AddShipmentCubit extends Cubit<AddShipmentStates> {
  AddShipmentCubit() : super(AddShipmentInitialState());

  static AddShipmentCubit get(context) => BlocProvider.of(context);

  UserTextController userTextController = UserTextController();
  UserTextValidators userTextValidators = UserTextValidators();
  ShipmentTextControllers shipmentTextControllers = ShipmentTextControllers();
  ShipmentTextValidators shipmentTextValidators = ShipmentTextValidators();
  late ShipmentModel shipmentInvoice;

  addRecipientInfo({required LatLng recipientLocation}) async {
    emit(AddShipmentLoadingState());
    try {
      var response = await DioHelper.addRecipientInfo(
        token: StorageHelper.getUserToken()!,
        recipientPhone: userTextController.phoneController.text,
        recipientLat: recipientLocation.latitude.toString(),
        recipientLng: recipientLocation.longitude.toString(),
        recipientLocation: '-',
      );
      // print(response.data);
      if (response.statusCode == 200) {
        emit(AddShipmentSuccessState(response.data['message']));
      } else {
        emit(AddShipmentErrorState(response.data['message']));
      }
    } catch (e, h) {
      print(e.toString());
      emit(AddShipmentErrorState(e.toString()));
    }
  }

  addShipmentInfo() async {
    print(shipmentTextControllers.shipmentTypeController.text);
    print(shipmentTextControllers.numberOfPiecesController.text);
    print(shipmentTextControllers.productValueController.text);
    if (!shipmentTextValidators.shipmentTypeValidator.currentState!
            .validate() ||
        !shipmentTextValidators.numberOfPiecesValidator.currentState!
            .validate() ||
        !shipmentTextValidators.weightValidator.currentState!.validate() ||
        !shipmentTextValidators.productValueValidator.currentState!
            .validate()) {
      return;
    }
    emit(AddShipmentLoadingState());
    try {
      var response = await DioHelper.addShipmentInfo(
        token: StorageHelper.getUserToken()!,
        shipment: ShipmentModel(
          type: shipmentTextControllers.shipmentTypeController.text,
          numberOfPieces:
              int.parse(shipmentTextControllers.numberOfPiecesController.text),
          weight: shipmentTextControllers.weightController.text,
          productValue: shipmentTextControllers.productValueController.text,
          senderLat: '33.510414',
          senderLng: '36.278336',
        ),
      );
      print(response.data);
      if (response.statusCode == 200) {
        emit(AddShipmentSuccessState(response.data['message']));
      } else {
        emit(AddShipmentErrorState(response.data['message']));
      }
    } catch (e, h) {
      print(e.toString());
      print(h.toString());
      emit(AddShipmentErrorState(e.toString()));
    }
  }

  getShipmentInvoice({
    required String id,
  }) async {
    emit(AddShipmentLoadingState());

    try {
      var response = await DioHelper.getShipmentInvoice(
        token: StorageHelper.getUserToken()!,
        id: id,
      );
      // print(response.data);
      if (response.statusCode == 200) {
        shipmentInvoice = ShipmentModel.fromJson(response.data['shipment']);
        print(shipmentInvoice);
        emit(AddShipmentSuccessState('message'));
      } else {
        emit(AddShipmentErrorState(response.data['message']));
      }
    } catch (e, h) {
      print(e.toString());
      print(h.toString());
      emit(AddShipmentErrorState(e.toString()));
    }
  }
}
