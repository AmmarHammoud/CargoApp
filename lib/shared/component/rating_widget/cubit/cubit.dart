import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../dio_helper/dio_helper.dart';
import '../../../storage/storage_helper.dart';
import 'states.dart';

class RatingCubit extends Cubit<RatingStates> {
  RatingCubit() : super(RatingInitialState());

  static RatingCubit get(context) => BlocProvider.of(context);

  double rating = 0.0;

  rateShipment({
    required String id,
    required double rating,
    required String comment,
  }) async {
    emit(RatingLoadingState());
    try {
      var response = await DioHelper.rateShipment(
        token: StorageHelper.getUserToken()!,
        id: id,
        rating: rating.toString(),
        comment: comment,
      );
      print(response.statusCode);
      print(response.data);
      if (response.statusCode == 200) {
        getShipmentRating(id: id);
        emit(RatingSuccessState(response.data['message']));
      } else {
        emit(RatingErrorState(
            response.data['message'] ?? 'error sending rating'));
      }
    } catch (e, h) {
      print(e.toString());
      print(h.toString());
      emit(RatingErrorState(e.toString()));
    }
  }

  getShipmentRating({
    required String id,
  }) async {
    emit(RatingLoadingState());
    try {
      var response = await DioHelper.getShipmentRating(
          token: StorageHelper.getUserToken()!, id: id);
      print(response.statusCode);
      print(response.data);
      if (response.statusCode == 200) {
        //ratingModel = RatingModel.fromJson();
        emit(RatingSuccessState(response.data['message']));
      } else {
        emit(RatingErrorState(response.data['message']));
      }
    } catch (e, h) {
      print(e.toString());
      print(h.toString());
      emit(RatingErrorState(e.toString()));
    }
  }
}
