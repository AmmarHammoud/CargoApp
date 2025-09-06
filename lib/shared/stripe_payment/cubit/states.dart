abstract class PaymentStates {}

class PaymentInitialState extends PaymentStates {}

class PaymentLoadingState extends PaymentStates {}

class PaymentSuccessState extends PaymentStates {
  final String message;

  PaymentSuccessState(this.message);
}

class PaymentErrorState extends PaymentStates {
  final String error;

  PaymentErrorState(this.error);
}
