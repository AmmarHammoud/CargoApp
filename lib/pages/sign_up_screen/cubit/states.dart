abstract class SignUpScreenStates {}

class SignUpScreenInitialState extends SignUpScreenStates {}

class SignUpScreenLoadingState extends SignUpScreenStates {}

class SignUpScreenSuccessState extends SignUpScreenStates {
  final String message;

  SignUpScreenSuccessState(this.message);
}

class SignUpScreenErrorState extends SignUpScreenStates {
  final String error;

  SignUpScreenErrorState(this.error);
}
