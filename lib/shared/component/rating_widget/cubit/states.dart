abstract class RatingStates {}

class RatingInitialState extends RatingStates {}

class RatingLoadingState extends RatingStates {}

class RatingSuccessState extends RatingStates {
  final String message;

  RatingSuccessState(this.message);
}

class RatingErrorState extends RatingStates {
  final String error;

  RatingErrorState(this.error);
}
