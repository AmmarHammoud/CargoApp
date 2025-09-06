import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../dio_helper/dio_helper.dart';
import '../../../storage/storage_helper.dart';
import 'states.dart';

class SendingReportCubit extends Cubit<SendingReportStates> {
  SendingReportCubit() : super(SendingReportInitialState());

  static SendingReportCubit get(context) => BlocProvider.of(context);

  final TextEditingController reportMessageController = TextEditingController();

  sendReport({required String id, required String message}) async {
    emit(SendingReportLoadingState());
    try {
      var response = await DioHelper.reportAShipment(
        token: StorageHelper.getUserToken()!,
        id: id,
        message: message,
      );
      print(response.data);
      if (response.statusCode == 200) {
        emit(SendingReportSuccessState(response.data['message']));
      } else {
        emit(
          SendingReportErrorState(
            response.data['message'] ?? 'error sending report',
          ),
        );
      }
    } catch (e, h) {
      print(e.toString());
      print(h.toString());
      emit(SendingReportErrorState(e.toString()));
    }
  }
}
