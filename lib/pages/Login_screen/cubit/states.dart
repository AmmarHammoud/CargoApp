abstract class LoginScreenStates {}

class LoginScreenInitialState extends LoginScreenStates {}

class LoginScreenLoadingState extends LoginScreenStates {}

class LoginScreenSuccessState extends LoginScreenStates {
  final String message;

  LoginScreenSuccessState(this.message);
}

class LoginScreenErrorState extends LoginScreenStates {
  final String error;

  LoginScreenErrorState(this.error);
}
